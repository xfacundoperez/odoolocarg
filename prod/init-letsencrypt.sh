#!/bin/bash

if ! [ -x "$(command -v docker-compose)" ]; then
  echo 'Error: docker-compose is not installed.' >&2
  exit 1
fi

domains=(DOMINIO)
rsa_key_size=4096
data_path="./proxy/certbot"
email="admin@hcsinergia.com" # añadir un email valido
staging=0 # Setear a 1 para hacer pruebas, solo cuando esté ok, colocar 0. Así evitamos el request limit.

if [ -d "$data_path" ]; then
  read -p "Existing data found for $domains. Continue and replace existing certificate? (y/N) " decision
  if [ "$decision" != "Y" ] && [ "$decision" != "y" ]; then
    exit
  fi
fi


if [ ! -e "$data_path/conf/options-ssl-nginx.conf" ] || [ ! -e "$data_path/conf/ssl-dhparams.pem" ]; then
  echo "### Descargando parametros TLS recomendados ..."
  mkdir -p "$data_path/conf"
  curl -s https://raw.githubusercontent.com/certbot/certbot/master/certbot-nginx/certbot_nginx/_internal/tls_configs/options-ssl-nginx.conf > "$data_path/conf/options-ssl-nginx.conf"
  curl -s https://raw.githubusercontent.com/certbot/certbot/master/certbot/certbot/ssl-dhparams.pem > "$data_path/conf/ssl-dhparams.pem"
  echo
fi

echo "### Deteniendo todos los contenedores ..."
docker-compose down --remove-orphans

echo "### Creando certificados temporales para $domains ..."
path="/etc/letsencrypt/live/$domains"
mkdir -p "$data_path/conf/live/$domains"
docker-compose -f certbot-compose.yaml run --rm --entrypoint "\
  openssl req -x509 -nodes -newkey rsa:$rsa_key_size -days 1\
    -keyout '$path/privkey.pem' \
    -out '$path/fullchain.pem' \
    -subj '/CN=localhost'" certbot
echo


echo "### Iniciando nginx ..."
docker-compose -f certbot-compose.yaml up --force-recreate -d nginx
echo

echo "### Borrando certificados temporales para $domains ..."
docker-compose -f certbot-compose.yaml run --rm --entrypoint "\
  rm -Rf /etc/letsencrypt/live/$domains && \
  rm -Rf /etc/letsencrypt/archive/$domains && \
  rm -Rf /etc/letsencrypt/renewal/$domains.conf" certbot
echo


echo "### Solicitando certificados a Let's Encrypt para $domains ..."
#Join $domains to -d args
domain_args=""
for domain in "${domains[@]}"; do
  domain_args="$domain_args -d *.$domain  -d $domain"
done

# Select appropriate email arg
case "$email" in
  "") email_arg="--register-unsafely-without-email" ;;
  *) email_arg="--email $email" ;;
esac

# Enable staging mode if needed
if [ $staging != "0" ]; then staging_arg="--staging"; fi

# certbot certonly --webroot -w /var/www/certbot \
    
docker-compose -f certbot-compose.yaml run --rm --entrypoint "\
  certbot certonly 
    $staging_arg \
    $email_arg \
    $domain_args \
    --rsa-key-size $rsa_key_size \
    --manual \
    --preferred-challenges dns \
    --agree-tos \
    --force-renewal" certbot
echo

echo "### Deteniendo contenedores ..."
docker-compose -f certbot-compose.yaml down