from django.urls import path
from .views import*
from django.conf import settings
from django.conf.urls.static import static

app_name = "users"
urlpatterns = [
    path('register/', create_user, name='create_user'),
    path('create_calendar/', create_calendar, name='create_calendar'),
    path('get_calendar/', get_calendar, name='get_calendar'),
    path('login/', login, name='login'),
    path('delete/', delete_user, name='delete'),
    path('create_group/', create_group, name='create_group'),
    path('get_member/', get_member, name='get_member'),
    path('recommand_group_list/', recommand_group_list, name='recommand_group_list'),
    path('my_group_list/', my_group_list, name='my_group_list'),
    path('apply_group/', apply_group, name='apply_group'),
    path('accept_member/', accept_member, name='accept_member'),
    path('make_variation/', make_variation, name='make_variation'),
    path('get_variation/', get_variation, name='get_variation'),
    path('evaluate_user/', update_user_state, name='evaluate_userState'), 
    path('get_userState/', get_user_state, name='get_userState'), 
    path('trans_group_state/', trans_group_state, name='trans_group_state'), 
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)