"""
WSGI config for web project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.8/howto/deployment/wsgi/
"""

import os, sys

from django.core.wsgi import get_wsgi_application


sys.path.append(os.path.dirname(os.path.abspath(__file__)))
os.environ['DJANGO_SETTINGS_MODULE'] = 'web.settings'

#os.environ["DJANGO_SETTINGS_MODULE"] = "web.settings"

application = get_wsgi_application()

