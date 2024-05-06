from django.urls import path
from .views import *
# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.
app_name="addresses"
urlpatterns = [
    path('addresses/', address_list),
    path('addresses/<int:pk>/', address),
]