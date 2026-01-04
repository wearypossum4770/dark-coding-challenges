from django.conf import settings
from django.db.models import (
    CASCADE,
    CharField,
    ForeignKey,
    ManyToManyField,
    Model,
)


class Continent(Model):
    name = CharField(max_length=100)


class Country(Model):
    name = CharField(max_length=100)

    class Meta:
        verbose_name_plural = "countries"


class State(Model):
    name = CharField(max_length=100)


class County(Model):
    name = CharField(max_length=100)

    class Meta:
        verbose_name_plural = "counties"


class City(Model):
    name = CharField(max_length=100)

    class Meta:
        verbose_name_plural = "cities"


class Precinct(Model):
    name = CharField(max_length=250)


class District(Model):
    name = CharField(max_length=250)


class ChatThread(Model):
    title = CharField(max_length=100)


class ChatMessage(Model):
    body = CharField(max_length=250)
    sender = ForeignKey(settings.AUTH_USER_MODEL, on_delete=CASCADE)
    receivers = ManyToManyField(ChatThread)
