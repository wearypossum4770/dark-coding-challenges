from django.contrib.auth.forms import UserChangeForm, UserCreationForm

from .models import NormalUser


class NormalUserCreationForm(UserCreationForm):

    class Meta:
        model = NormalUser
        fields = ("username", "email")


class NormalUserChangeForm(UserChangeForm):

    class Meta:
        model = NormalUser
        fields = ("username", "email")
