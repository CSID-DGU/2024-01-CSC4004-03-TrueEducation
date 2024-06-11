from rest_framework import serializers
from .models import User, Group, GroupMember, Variance, UserState

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = [
            'user_id', 'email', 'password', 'nickname',
            'username', 'birthdate', 'gender',
        ]
        extra_kwargs = {
            'password': {'write_only': True},
        }

class RegisterSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = [
            'user_id', 'email', 'password', 'nickname',
            'username', 'birthdate', 'gender',
            'is_active', 'is_staff', 'created_at', 'updated_at'
        ]
        extra_kwargs = {
            'password': {'write_only': True},
            'created_at': {'read_only': True},
            'updated_at': {'read_only': True}
        }

    def create(self, validated_data):
        user = User.objects.create_user(
            email=validated_data['email'],
            password=validated_data['password'],
            nickname=validated_data['nickname'],
            username=validated_data['username'],
            birthdate=validated_data['birthdate'],
            gender=validated_data['gender']
        )
        return user

    def update(self, instance, validated_data):
        instance.email = validated_data.get('email', instance.email)
        instance.nickname = validated_data.get('nickname', instance.nickname)
        instance.username = validated_data.get('username', instance.username)
        instance.birthdate = validated_data.get('birthdate', instance.birthdate)
        instance.gender = validated_data.get('gender', instance.gender)

        # 비밀번호 변경 시
        password = validated_data.get('password', None)
        if password:
            instance.set_password(password)

        instance.save()
        return instance
    
class LoginSerializer(serializers.Serializer):
    email = serializers.EmailField()
    password = serializers.CharField()


class GroupSerializer(serializers.ModelSerializer):
    leader = serializers.PrimaryKeyRelatedField(read_only=True)

    class Meta:
        model = Group
        fields = '__all__'    

class GroupMemberSerializer(serializers.ModelSerializer):
    user = serializers.PrimaryKeyRelatedField(read_only=True)

    class Meta:
        model = GroupMember
        fields = '__all__'


class GroupMemberDetailSerializer(serializers.ModelSerializer):
    user_name = serializers.SerializerMethodField()
    user_nickname = serializers.SerializerMethodField()
    user_grade = serializers.SerializerMethodField()

    class Meta:
        model = GroupMember
        fields = ['user', 'state', 'user_name', 'user_nickname', 'user_grade']

    def get_user_name(self, obj):
        return obj.user.username

    def get_user_nickname(self, obj):
        return obj.user.nickname

    def get_user_grade(self, obj):
        user_state = UserState.objects.get(user=obj.user)
        return user_state.grade
    
class GroupDetailSerializer(serializers.ModelSerializer):
    member = serializers.SerializerMethodField()
    class Meta:
        model = Group
        fields = '__all__'

    def get_member(self, obj):
        members = GroupMember.objects.filter(group=obj)
        serializer = GroupMemberDetailSerializer(instance=members, many=True)
        return serializer.data
    
class AcceptMemberSerializer(serializers.Serializer):
    group = serializers.IntegerField()
    user = serializers.IntegerField()

class VariationSerializer(serializers.ModelSerializer):
    user = serializers.PrimaryKeyRelatedField(read_only=True)

    class Meta:
        model = Variance
        fields = '__all__'
             
class UserStateSerializer(serializers.ModelSerializer): ##
    class Meta:
        model = UserState
        fields = '__all__'
        
class UserStateSerializer(serializers.ModelSerializer):
    evaluateAdd = serializers.ListField(child=serializers.IntegerField(), write_only=True)
    evaluated_user = serializers.IntegerField(write_only=True)

    class Meta:
        model = UserState
        fields = '__all__'

    def update(self, instance, validated_data):
        evaluateAdd = validated_data.pop('evaluateAdd', None)
        evaluated_user = validated_data.pop('evaluated_user', None)
        
        if evaluateAdd:
            if evaluateAdd[0] == 1:
                instance.pos_time_num += 1
            if evaluateAdd[1] == 1:
                instance.pos_manner_num += 1
            if evaluateAdd[2] == 1:
                instance.pos_honor_num += 1
            if evaluateAdd[3] == 1:
                instance.pos_ready_num += 1
            if evaluateAdd[4] == 1:
                instance.pos_conven_num += 1
            if evaluateAdd[5] == 1:
                instance.pos_leadership_num += 1

        instance.save()
        return instance

        
        
        
