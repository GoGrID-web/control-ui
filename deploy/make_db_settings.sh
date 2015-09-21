#!/bin/bash


db_name="grid_stest"
db_user="gid"
db_pw="teretere"

cat > local_settings.py << EOF
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


DEBUG = True 

EOF
