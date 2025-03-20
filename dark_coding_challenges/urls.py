"""
https://docs.djangoproject.com/en/5.1/topics/http/urls/

"""

from django.contrib import admin
from django.urls import include, path
from sesame.views import LoginView

urlpatterns = (
    path("admin/", admin.site.urls),
    path("chats/", include("chat.urls")),
    path("sesame/login/", LoginView.as_view(), name="sesame-login"),
)
