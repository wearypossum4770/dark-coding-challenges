from django.forms import Form
from imagekit.forms import ProcessedImageField
from imagekit.processors import ResizeToFill

class ProfileForm(Form):
    avatar_thumbnail = ProcessedImageField(spec_id='myapp:profile:avatar_thumbnail',
                                           processors=[ResizeToFill(100, 50)],
                                           format='WEBP',
                                           options={'quality': 60})

class Watermark(object):
    def process(self, image):
        return image