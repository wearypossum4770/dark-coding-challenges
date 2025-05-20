# Create your models here.
from django.contrib.auth.models import AbstractUser
from django.db import models


class NormalUser(AbstractUser):
    pass


class UserProfile(models.Model):  # new
    user = models.OneToOneField(
        "users.NormalUser",
        on_delete=models.CASCADE,
    )
    # add additional fields for UserProfile

    def __str__(self):
        return self.user

    class Meta:
        verbose_name = "User Profile"
        verbose_name_plural = "User Profiles"
