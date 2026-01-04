import json
import logging
from re import sub
from secrets import token_urlsafe

from asgiref.sync import async_to_sync
from channels.generic.websocket import AsyncWebsocketConsumer
from django.contrib.auth import get_user_model

User = get_user_model()


def sanitize_room_name(room_name):
    sanitized_name = sub(r"\W+", "", room_name)
    return sanitized_name


client_cache = {}
logger = logging.basicConfig(
    format="%(asctime)s %(message)s", level=logging.debug
)


def add_client_connection():
    join_key = token_urlsafe(12)
    client_cache[join_key] = {}


class AdminChatConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        self.room_name = sub(
            r"\W+", "", self.scope["url_route"]["kwargs"]["room_name"]
        )
        self.room_group_name = f"chat_{self.room_name}"
        await self.channel_layer.group_add(
            self.room_group_name, self.channel_name
        )

        await self.accept()


class ChatConsumer(AsyncWebsocketConsumer):

    async def connect(self):
        self.room_name = self.scope["url_route"]["kwargs"]["room_name"]
        self.room_id = sanitize_room_name(self.room_name)
        print("room id", self.room_id)
        self.room_group_name = f"chat_{self.room_name}"
        await self.channel_layer.group_add(
            "chat", self.room_group_name, self.channel_name
        )

        await self.accept()

    async def get_name(self):
        return None

    async def disconnect(self, close_code):
        await self.channel_layer.group_discard(
            "chat", self.room_group_name, self.channel_name
        )

    async def receive(self, text_data):
        text_data_json = json.loads(text_data)
        message = text_data_json.get("message")
        room_id = text_data_json.get("room_id")
        message_type = text_data_json.get("type")
        # Send message to room group
        connection_info = {
            "client": str(self.scope["client"]),
            "path": self.scope["path"],
            "headers": dict(self.scope["headers"]),
        }
        await self.channel_layer.group_send(
            self.room_group_name,
            {
                "type": "chat.message",
                "username": self.scope["user"].username,
                "message": message,
                "room_id": room_id,
                "connection_info": connection_info,
            },
        )

    async def chat_message(self, event):
        context = {
            "room": event.get("room_id"),
            "message": event.get("message"),
            "username": event.get("username"),
        }
        print(context)
        await self.send(text_data=json.dumps(context))
