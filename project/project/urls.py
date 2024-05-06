from django.urls import path, include
from addresses import views
from users import views
from django.contrib import admin
# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.
urlpatterns = [
    path('addresses/', include('addresses.urls')),
    path('users/', include('users.urls')),
    path('admin/', admin.site.urls),
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework'))
]