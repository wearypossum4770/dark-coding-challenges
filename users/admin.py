from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from users.models import NormalUser

admin.site.register(NormalUser, UserAdmin)
