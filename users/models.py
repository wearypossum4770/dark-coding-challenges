
from django.db.model import Model, ImageField
from imagekit.models import ImageSpecField
from imagekit.processors import ResizeToFill

avatar_options = {'quality': 60}

class Profile(Model):
    avatar = ImageField(upload_to="avatars")
    avatar_thumbnail = ImageSpecField(source='avatar', processors=[ResizeToFill(100, 50)], format='WEBP', options=avatar_options)
