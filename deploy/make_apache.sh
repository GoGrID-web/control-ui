#!/bin/bash

apt-get install libapache2-mod-wsgi
local_dir=$(pwd)

cat > control-ui.conf << EOF

WSGIScriptAlias /test $(pwd)/web/wsgi.py
WSGIPythonPath $(pwd)

<Directory $(pwd)/web>
<Files wsgi.py>
Require all granted
</Files>
</Directory>

EOF

cat > django << EOF

NameVirtualHost *:80
#NameVirtualHost *:443

WSGIScriptAlias / $local_dir/wsgi.py
WSGIDaemonProcess django processes=1 threads=3
WSGIProcessGroup django

<VirtualHost *:80>
    UseCanonicalName Off
    serveradmin  webmaster@localhost
    documentroot /var/www/project/media
    </virtualhost>

   # <virtualhost *:443>
   #     sslengine on
   #     sslcertificateFile /etc/ssl/certs/cert.pem
   #     serveradmin  webmaster@localhost
   #     documentRoot /var/www/project/media
   # </virtualHost>

    alias /media /var/www/project/media
    <location "/media">
        setHandler None
    </Location>
EOF
