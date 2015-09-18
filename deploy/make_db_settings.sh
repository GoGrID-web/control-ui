#!/bin/bash


db_name="grid-web"
db_user="grid-web"
db_pw="teretere"

cat > db_settings.py << EOF
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': '$db_name',
        'USER': '$db_user',
        'PASSWORD': '$db_pw',
        'HOST': 'localhost',
        'PORT': '3306',
    },

}

EOF
