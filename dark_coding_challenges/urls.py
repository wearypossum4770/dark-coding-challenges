"""
https://docs.djangoproject.com/en/5.1/topics/http/urls/

"""

from django.contrib import admin
from django.urls import include, path

urlpatterns = (
    path("admin/", admin.site.urls),
    path("", include("chats.urls")),
)
