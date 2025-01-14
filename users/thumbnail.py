from imagekit import ImageSpec, register
from imagekit.processors import ResizeToFill

class Thumbnail(ImageSpec):
    processors = [ResizeToFill(100, 50)]
    format = 'WEBP'
    options = {'quality': 60}

register.generator('myapp:thumbnail', Thumbnail)