#!/bin/bash
ODOO_VERSION=13.0
DEPTH_DEFAULT=1
ADDONS_PATH=./addons

#hcsinergia
git clone https://github.com/xfacundoperez/hcsinergia.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/hcsinergia

# odoomates-odooapps
git clone https://github.com/odoomates/odooapps.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/odoomates-odooapps

# odoo-argentina
git clone https://github.com/ingadhoc/odoo-argentina.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/odoo-argentina
    
# Repositorios desde ingadhoc

# odoo-argentina-ce
git clone https://github.com/ingadhoc/odoo-argentina-ce -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/odoo-argentina-ce

# ingadhoc-argentina-sale
git clone https://github.com/ingadhoc/argentina-sale.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/ingadhoc-argentina-sale

# ingadhoc-miscellaneous
git clone https://github.com/ingadhoc/miscellaneous.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/ingadhoc-miscellaneous

# ingadhoc-account-payment
git clone https://github.com/ingadhoc/account-payment.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/ingadhoc-account-payment

# ingadhoc-account-financial-tools
git clone https://github.com/ingadhoc/account-financial-tools.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/ingadhoc-account-financial-tools

# ingadhoc-aeroo_reports
git clone https://github.com/ingadhoc/aeroo_reports.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/ingadhoc-aeroo_reports

# ingadhoc-account-invoicing
git clone https://github.com/ingadhoc/account-invoicing.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/ingadhoc-account-invoicing

# ingadhoc-partner
git clone https://github.com/ingadhoc/partner.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/ingadhoc-partner

# ingadhoc-account-analytic
git clone https://github.com/ingadhoc/account-analytic.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/ingadhoc-account-analytic

# ingadhoc-hr
git clone https://github.com/ingadhoc/hr.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/ingadhoc-hr

# ingadhoc-product
git clone https://github.com/ingadhoc/product.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/ingadhoc-product

# ingadhoc-multi-company
git clone https://github.com/ingadhoc/multi-company.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/ingadhoc-multi-company

# ingadhoc-purchase
git clone https://github.com/ingadhoc/purchase.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/ingadhoc-purchase

# ingadhoc-stock
git clone https://github.com/ingadhoc/stock.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/ingadhoc-stock

# ingadhoc-website
git clone https://github.com/ingadhoc/website.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/ingadhoc-website

# ingadhoc-sale
git clone https://github.com/ingadhoc/sale.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/ingadhoc-sale

# ingadhoc-project
git clone https://github.com/ingadhoc/project.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/ingadhoc-project

# ingadhoc-argentina-reporting
git clone https://github.com/ingadhoc/argentina-reporting.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/ingadhoc-argentina-reporting

# ingadhoc-reporting-engine
#git clone https://github.com/ingadhoc/reporting-engine.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/ingadhoc-reporting-engine

# ingadhoc-multi-store
git clone https://github.com/ingadhoc/multi-store.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/ingadhoc-multi-store

# ingadhoc-manufacture
git clone https://github.com/ingadhoc/manufacture.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/ingadhoc-manufacture

# backend_theme desde odooerpdevelopers

# odooerpdevelopers-backend_theme
git clone https://github.com/odooerpdevelopers/backend_theme.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/odooerpdevelopers-backend_theme

# OCA

# oca-helpdesk
git clone https://github.com/OCA/helpdesk.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/oca-helpdesk

# oca-web
git clone https://github.com/oca/web.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/oca-web

# oca-account-financial-reporting
git clone https://github.com/oca/account-financial-reporting.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/oca-account-financial-reporting

# oca-account-financial-tools
git clone https://github.com/oca/account-financial-tools.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/oca-account-financial-tools

# oca-reporting-engine
git clone https://github.com/oca/reporting-engine.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/oca-reporting-engine

# oca-server-ux
git clone https://github.com/OCA/server-ux.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/oca-server-ux

# oca-stock-picking-invoice-link
git clone https://github.com/OCA/stock-logistics-workflow.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/oca-stock-picking-invoice-link

# resumenes de bancos
# oca-bank-statement-import
git clone https://github.com/OCA/bank-statement-import.git -b $ODOO_VERSION --depth $DEPTH_DEFAULT $ADDONS_PATH/oca-bank-statement-import