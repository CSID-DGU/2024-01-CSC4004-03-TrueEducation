from django.contrib import admin
from .models import User, UserState, Schedule, Variance, Report, Group, GroupMember

admin.site.register(User)
admin.site.register(UserState)
admin.site.register(Schedule)
admin.site.register(Variance)
admin.site.register(Report)
admin.site.register(Group)
admin.site.register(GroupMember)