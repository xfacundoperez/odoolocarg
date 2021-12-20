# odoolocarg
Odoo + Docker + Nginx + Localización Argentina

# Antes de empezar
En esta ocación vamos a usar Ubuntu 20.04, para configurar todo es necesario tener instalado previamente Docker y Python3.7 ya que vamos a utilizar para esta version Odoo 13.0
- Usando un usuario con permiso de sudo
```
sudo apt-get update
sudo apt-get install docker
sudo apt-get install ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo groupadd docker
newgrp docker
sudo usermod -aG docker $USER

sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# Si hello-world funciona, ya está. sino esta la documentación en: https://docs.docker.com/engine/install/ubuntu/
docker run hello-world
```
- Con esto deberiamos tener instalado Docker y con el usuario con permiso para correrlo.

###### Primeros pasos
- Importar el proyecto: git clone https://github.com/xfacundoperez/odoolocarg.git

Una vez que descargamos el repositorio, entramos a la carpeta odoolocarg, actualizamos permisos:

> sudo chown -R $USER:$USER ~/odoolocarg/

Dentro van a haber 2 carpetas:

- devel
- prod

Vamos a centrarnos en 'prod':

###### Certificados
El archivo 'init-letsencrypt.sh' le vamos a dar permisos de ejecución.

> sudo chmod +x init-letsencrypt.sh

Para poder habilitar los certificados vamos a tener que editar los archivos:

- init-letsencrypt.sh
- proxy/config/cerbot/certbot.conf
- proxy/config/nginx/odoo.conf

cambiando 'DOMINIO' con el dominio que tengamo (Por ejemplo 'hcsinergia.com'). Una vez hecho los cambios, vamos a obtener los certificados (tener en cuenta que si vamos a para probar, el parametro staging tiene que ser 1, si funciona se pone en 0 y se solicitan nuevamente los certificados)

> ./init-letsencrypt.sh

En un momento el script se va a detener y va a especificar que se cree un registro TXT en el DNS con el nombre y valor especificado. esto es obligatorio, sino no va a funcionar, el registro deberia tener este formato:

> TYPE: TXT
> NAME: _acme-challenge.hcsinergia.com.
> VALUE: VGrmQt3pMKt73AdgTf-DGNB7N5aWbmtmAL6e-cqtrqd

Una vez que agreguemos el registro al DNS, podemos presionar la tecla ENTER y seguir ejecutando el script.

##### Repositorios
El archivo 'repos.sh' le vamos a dar permisos de ejecución.

> sudo chmod +x repos.sh

Para poder obtener los repositorios vamos a tener que editar los archivos:

- repos.sh
- /bin/config/odoo.conf

Y en caso de necesitar uno nuevo debemos agregar abajo de todo una linea como la siguiente:

> # NOMBRE_REPO
> git clone https://github.com/USUARIO/NOMBRE_REPO.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/NOMBRE_REPO

Y en el archivo '/bin/config/odoo.conf' se debe agregar:

> /mnt/extra-addons/NOMBRE_REPO

Hay que tener en cuenta que ODOO_VERSION y DEPTH_DEFAULT están seteados en las primeras lineas del archivo y el repositorio deberia tener una rama con el nombre '13.0' para este ejemplo y hay que respetar las comas en el archivo de configuración de odoo, sino surgen errores.

Ejecutamos el archivo y automaticamente empieza a descargar los repositorios necesarios.

> ./repos.sh

##### Iniciando el sistema
Ya tenemos todo listo, ahora solo queda levantar el sistema:

> docker-compose build
> docker-compose up

El parametro build lo vamos a utilizar para preparar el contenedor 'prod_odoo' e instalar todas las librerias necesarias para la Localización Argentina.


# Listo
El sistema deberia estár funcionando en https://DOMINIO/. Los proximos pasos sería crear la DB con la contraseña que está almacenada en la configuración de Odoo y empezar a configurar el mismo


