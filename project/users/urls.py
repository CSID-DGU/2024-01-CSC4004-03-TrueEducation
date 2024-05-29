from django.urls import path
from .views import*
from django.conf import settings
from django.conf.urls.static import static
app_name = "users"
urlpatterns = [
    path('register/', create_user, name='create_user'),
    path('calendar/', calendar, name='calendar'),
    path('login/', login, name='login'),
    path('delete/', delete_user, name='delete'),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)