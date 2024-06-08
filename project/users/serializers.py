from rest_framework import serializers
from .models import User, Group, GroupMember, Variance

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


class GroupDetailSerializer(serializers.ModelSerializer):
    member = serializers.SerializerMethodField()
    class Meta:
        model = Group
        fields = '__all__'

    def get_member(self, obj):
        members = GroupMember.objects.filter(group=obj)
        serializer = GroupMemberSerializer(instance=members, many=True)
        return serializer.data
    
class AcceptMemberSerializer(serializers.Serializer):
    group = serializers.IntegerField()
    user = serializers.IntegerField()

class VariationSerializer(serializers.ModelSerializer):
    user = serializers.PrimaryKeyRelatedField(read_only=True)

    class Meta:
        model = Variance
        fields = '__all__'