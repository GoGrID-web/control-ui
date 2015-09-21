from django.contrib import admin

from .models import Zone, User, Door

admin.site.register(Zone)
admin.site.register(Door)
admin.site.register(User)
