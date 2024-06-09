from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin

# UserManager class
class UserManager(BaseUserManager):
    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError('The Email field must be set')
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        return self.create_user(email, password, **extra_fields)

# User class
class User(AbstractBaseUser, PermissionsMixin):
    user_id = models.AutoField(primary_key=True)
    email = models.EmailField(max_length=30, unique=True, null=False, blank=False)  # NOT NULL
    password = models.CharField(max_length=30, null=False, blank=False)  # NOT NULL
    nickname = models.CharField(max_length=10, unique= True, null=False, blank=False) 
    username = models.CharField(max_length=10, null=False, blank=False)  # NOT NULL
    birthdate = models.DateField(null=False, blank=False)  # NOT NULL
    gender = models.PositiveSmallIntegerField(null=False, blank=False)  # NOT NULL
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    objects = UserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['nickname', 'username', 'birthdate', 'gender']

    def __str__(self):
        return self.email

# UserState class
class UserState(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    grade = models.PositiveSmallIntegerField(null=False, blank=False, default=8)  # NOT NULL
    pos_time_num = models.IntegerField(null=True, blank=True, default=0)  
    pos_manner_num = models.IntegerField(null=True, blank=True, default=0)  
    pos_honor_num = models.IntegerField(null=True, blank=True, default=0) 
    pos_ready_num = models.IntegerField(null=True, blank=True, default=0)  
    pos_conven_num = models.IntegerField(null=True, blank=True, default=0) 
    pos_leadership_num = models.IntegerField(null=True, blank=True, default=0) 
    # report_num = models.IntegerField(null=True, blank=True)

# Schedule class
class Schedule(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    timetable = models.TextField()

# Variance class
class Variance(models.Model):
    variable_time_id = models.AutoField(primary_key=True)
    variable_time = models.CharField(max_length=26, null=False, blank=False)  # NOT NULL
    flag = models.BooleanField(null=True, blank=True, default=0)  # NOT NULL
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    day = models.PositiveSmallIntegerField(null=False, blank=False)  # NOT NULL
    text = models.CharField(max_length=30, null=True, blank=True)
# Report class
class Report(models.Model):
    report_id = models.AutoField(primary_key=True)
    target_user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='target_user')
    reporter_user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='reporter_user')
    report_contents = models.IntegerField(null=False, blank=False)  # NOT NULL
    description = models.CharField(max_length=40, null=True, blank=True) 

# Group class
class Group(models.Model):
    group_id = models.AutoField(primary_key=True)
    group_img = models.ImageField(upload_to="group/", blank=True, null=True)
    group_name = models.CharField(max_length=30, null=False, blank=False)  # NOT NULL
    min_age = models.PositiveSmallIntegerField(null=False, blank=False, default=0)  # NOT NULL
    max_age = models.PositiveSmallIntegerField(null=False, blank=False, default=127)  # NOT NULL
    group_gender = models.PositiveSmallIntegerField(null=False, blank=False, default=3)  # 3이면 성별 상관없음
    leader = models.ForeignKey(User, on_delete=models.CASCADE)
    min_num = models.PositiveSmallIntegerField(null=False, blank=False, default=0)  # NOT NULL
    max_num = models.PositiveSmallIntegerField(null=False, blank=False, default=127)  # NOT NULL
    current_num = models.PositiveSmallIntegerField(null=False, blank=False, default=1)  # NOT NULL
    start_time = models.DateTimeField(null=False, blank=False)  # NOT NULL
    end_time = models.DateTimeField(null=False, blank=False)  # NOT NULL
    description = models.TextField(null=True, blank=True) 
    current_state = models.PositiveSmallIntegerField(null=True, blank=True, default=1)  # NOT NULL
    flag = models.BooleanField(null=True, blank=True, default=0) #0 은 노출가능

# GroupMember class
class GroupMember(models.Model):
    group= models.ForeignKey(Group, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    state = models.PositiveSmallIntegerField(null=True, blank=True, default=1)  # NOT NULL