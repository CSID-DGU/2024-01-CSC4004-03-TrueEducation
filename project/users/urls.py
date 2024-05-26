from django.urls import path
from .views import*
app_name = "users"
urlpatterns = [
    path('register/', create_user, name='create_user'),
    path('calendar/', calendar, name='calendar'),
    path('login/', login, name='login'),
    path('delete/', delete_user, name='delete'),
]