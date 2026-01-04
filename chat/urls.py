from django.urls import path

from chat.views import HomePageView, chat_index, chat_room

urlpatterns = (
    # path("", HomePageView.as_view(), name="home"),
    path("", chat_index, name="chats"),
    path("<str:room_name>/", chat_room, name="room"),
)
