#!/usr/bin/python
import sys, os

APPNAME = "web"
PREFIX = "/var/www/public/control-ui" 

# Add a custom Python path.
#sys.path.insert(0, os.path.join(PREFIX, "htdocs/python"))
#sys.path.insert(0, os.path.join(PREFIX, "htdocs"))

# Switch to the directory of your project. (Optional.)
os.chdir(os.path.join(PREFIX,  APPNAME))

# Set the DJANGO_SETTINGS_MODULE environment variable.
os.environ['DJANGO_SETTINGS_MODULE'] = "%s.settings" % (APPNAME,)

from django.core.servers.fastcgi import runfastcgi
runfastcgi(method="threaded", daemonize="false")
