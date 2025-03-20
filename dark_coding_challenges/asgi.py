"""
https://docs.djangoproject.com/en/5.1/howto/deployment/asgi/
"""

from os import environ

from channels.auth import AuthMiddlewareStack
from channels.routing import ProtocolTypeRouter, URLRouter
from channels.security.websocket import AllowedHostsOriginValidator
from django.core.asgi import get_asgi_application

environ.setdefault("DJANGO_SETTINGS_MODULE", "dark_coding_challenges.settings")

django_asgi_app = get_asgi_application()
from chat.routing import websocket_urlpatterns

application = ProtocolTypeRouter(
    {
        "http": django_asgi_app,
        "websocket": AllowedHostsOriginValidator(
            AuthMiddlewareStack(URLRouter(websocket_urlpatterns))
        ),
    }
)
