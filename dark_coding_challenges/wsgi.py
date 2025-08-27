"""
https://docs.djangoproject.com/en/5.1/howto/deployment/wsgi/

"""

import os

from django.core.wsgi import get_wsgi_application

os.environ.setdefault(
    "DJANGO_SETTINGS_MODULE", "dark_coding_challenges.settings"
)

application = get_wsgi_application()
