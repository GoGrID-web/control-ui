from django.contrib import admin

from .models import User, Door

admin.site.register(Door)
admin.site.register(User)
