"""
https://docs.djangoproject.com/en/5.1/howto/deployment/asgi/
"""

from os import environ

from channels.routing import ProtocolTypeRouter
from django.core.asgi import get_asgi_application

environ.setdefault("DJANGO_SETTINGS_MODULE", "dark_coding_challenges.settings")

django_asgi_app = get_asgi_application()

application = ProtocolTypeRouter(
    {
        "http": django_asgi_app,
    }
)
