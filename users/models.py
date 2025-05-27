# Create your models here.
from django.contrib.auth.models import AbstractUser
from django.db.models import (Model, CASCADE, OneToOneField)


class NormalUser(AbstractUser):
    pass


class UserProfile(Model):  # new
    user = OneToOneField(
        "users.NormalUser",
        on_delete=CASCADE,
    )
    # add additional fields for UserProfile

    def __str__(self):
        return self.user

    class Meta:
        verbose_name = "User Profile"
        verbose_name_plural = "User Profiles"
