#!/bin/bash

APACHE_LOG_DIR="/var/log/apache2"
APACHE_CONF_DIR="/etc/apache2/sites-available"

cat > $APACHE_CONF_DIR/main << EOF
ServerName valdur55.dynu.com
SetEnvIf GEOIP_COUNTRY_CODE EE IS_EE

<VirtualHost *:80>
    ServerName valdur55.dynu.com
    DocumentRoot /var/www

    ErrorLog ${APACHE_LOG_DIR}/error.log
    LogLevel info

    CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>

EOF

pf="$(pwd)"
site_name="stest"

cat > $APACHE_CONF_DIR/$site_name << EOF
<VirtualHost *:80>

    ServerName $site_name.valdur55.dynu.com
#    ServerAlias example.com
    ServerAdmin webmaster@example.com

    #Alias /robots.txt $pf/robots.txt
    #Alias /favicon.ico $pf/favicon.ico

    Alias /static/ $pf/static/

    <Directory $pf>
    Order allow,deny
    Allow from all
    </Directory>

    WSGIDaemonProcess $site_name processes=2 threads=2 display-name=%{GROUP}
    WSGIProcessGroup  $site_name

    WSGIScriptAlias / $pf/wsgi.py

    #<Directory /usr/local/www/wsgi-scripts>
    #Order allow,deny
    #Allow from all
    #</Directory>
    <location "/static">
        setHandler None
    </Location>
    <Files wsgi.py>
        Allow from all
    </Files>

    ErrorLog ${APACHE_LOG_DIR}/error.$site_name.log
    LogLevel info
    CustomLog ${APACHE_LOG_DIR}/access.$site_name.log combined
</VirtualHost>


    <LocationMatch "/(phpmyadmin)">
        Deny from all
        Allow from env=IS_EE
        Allow from 127.0.0.1
        Allow from 192.168
    </LocationMatch>

EOF
a2dissite default
a2ensite main $site_name
service apache2 restart
