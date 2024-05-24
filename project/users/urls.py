from django.urls import path, include
from .views import*
app_name = "users"
urlpatterns = [
    path('', include('dj_rest_auth.urls')),
    path('registration/', include('dj_rest_auth.registration.urls')),
    path('calendar/', calendar),
]