from django.db.models import Q  # new
from django.shortcuts import render
from django.views.generic import ListView, TemplateView


class HomePageView(TemplateView):
    template_name = "home.html"


def chat_index(request):
    return render(request, "chat/index.html")


def chat_room(request, room_name):
    return render(request, "chat/room.html", {"room_name": room_name})


# class SearchResultsView(ListView):
#     model = City
#     template_name = "search_results.html"

#     def get_queryset(self):

#         query = self.request.GET.get("city")
#         return City.objects.filter(Q(name__icontains=query) | Q(state__icontains=query))
