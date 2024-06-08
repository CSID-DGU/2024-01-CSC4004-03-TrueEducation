from rest_framework import status
from django.contrib.auth import authenticate
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework_simplejwt.tokens import RefreshToken
from .serializers import UserSerializer, LoginSerializer, RegisterSerializer, GroupSerializer, GroupMemberSerializer, GroupDetailSerializer, AcceptMemberSerializer

from rest_framework.permissions import IsAuthenticated
from django.http import JsonResponse
from .Extraction import *
from .models import Schedule, Group, GroupMember
import json

# 시간표 정보를 리턴하는 메소드
@api_view(['POST'])
@permission_classes([IsAuthenticated])
def create_calendar(request):
    # user_schedule을 QuerySet이 아닌 객체로 가져오기
    user = request.user

    if Schedule.objects.filter(user=user).first() is None:
        Schedule.objects.create(user=user)

    user_schedule = Schedule.objects.filter(user=user).first()

    if user_schedule:
        if 'image' in request.POST:
            image = request.FILES.get('image')
            schedule = Extraction(image)
            result = schedule.binarization()
            serialized = json.dumps(result)
            # timetable 필드에 직렬화된 데이터 저장
            user_schedule.timetable = serialized
            user_schedule.save()  # 저장 후에 데이터베이스에 반영
            
        # 특정 필드만 선택하여 JSON 응답 생성
        response_data = {
            "timetable": user_schedule.timetable
        }
        return JsonResponse(response_data)
        
    else:
        return JsonResponse({'error': 'No schedule found'})
    
@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_calendar(request):
    user = request.user

    if Schedule.objects.filter(user=user).first() is None:
        Schedule.objects.create(user=user)

    user_schedule = Schedule.objects.filter(user=user).first()

    if user_schedule:
        # 특정 필드만 선택하여 JSON 응답 생성
        response_data = {
            "timetable": user_schedule.timetable
        }
        return JsonResponse(response_data)   
    else:
        return JsonResponse({'error': 'No schedule found'})

#토큰 발급 메소드
def get_tokens_for_user(user):
    refresh = RefreshToken.for_user(user)
    return {
        'refresh': str(refresh),
        'access': str(refresh.access_token),
    }

#회원가입 메소드
@api_view(['POST'])
def create_user(request):
    if request.method == 'POST':
        serializer = RegisterSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            response_data = {  # JSON 형식으로 응답 데이터 구성
                'message': "회원가입 성공",
            }
            return Response(response_data, status=status.HTTP_201_CREATED)  # JSON 응답 반환
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    

#로그인 메소드
@api_view(['POST'])
def login(request):
    if request.method == 'POST':
        serializer = LoginSerializer(data=request.data)
        if serializer.is_valid():
            email = serializer.validated_data['email']
            password = serializer.validated_data['password']
            user = authenticate(email=email, password=password)
            tokens = get_tokens_for_user(user)  # 토큰을 생성
            response_data = {  # JSON 형식으로 응답 데이터 구성
                'user_info': UserSerializer(user).data, # 유저 정보를 모두 담기
                'tokens': tokens
            }
            return Response(response_data, status=status.HTTP_201_CREATED)  # JSON 응답 반환
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#회원 탈퇴 메소드
@api_view(['DELETE'])
@permission_classes([IsAuthenticated])
def delete_user(request):
    try:
        # JWT 토큰을 사용하여 사용자 식별
        user = request.user
        # 사용자 삭제
        user.delete()
        return Response({"message": "User deleted successfully."}, status=status.HTTP_204_NO_CONTENT)
    except Exception as e:
        return Response({"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    

# 모임 생성 및 관리
@api_view(['POST'])
@permission_classes([IsAuthenticated])
def create_group(request):
    serializer = GroupSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save(leader=request.user)
        
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#전체 모임 리스트 출력
@api_view(['GET'])
@permission_classes([IsAuthenticated])
def recommand_group_list(request):
    groups = Group.objects.all().exclude(leader=request.user)
    group_members = GroupMember.objects.filter(user = request.user)

    member_group = {member.group for member in group_members} #현재 가입했거나 대기중인 그룹
    # 사용자가 속하지 않은 그룹을 필터링
    filtered_groups = [group for group in groups if group not in member_group and group.leader != request.user]
    serializer = GroupSerializer(filtered_groups, many=True)
    return Response(serializer.data)

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def my_group_list(request):
    my_groups = Group.objects.filter(leader=request.user) # 내 그룹

    group_members = GroupMember.objects.filter(user = request.user, state=2)
    member_group = {member.group for member in group_members} #현재 가입중인 그룹

    apply_members = GroupMember.objects.filter(user = request.user, state=1)
    member_apply = {member.group for member in apply_members} #현재 지원한 그룹(가입 대기중인 그룹)

    # 사용자가 속한 그룹을 필터링
    response_data = {
        "my_group" : GroupDetailSerializer(my_groups, many=True).data,
        "join": GroupSerializer(member_group, many=True).data,
        "wait": GroupSerializer(member_apply, many=True).data
    }
    return Response(response_data)

@api_view(['POST'])
@permission_classes([IsAuthenticated])
def apply_group(request):
    serializer = GroupMemberSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save(user=request.user)
    
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
@permission_classes([IsAuthenticated])
def accept_member(request):
    serializer = AcceptMemberSerializer(data=request.data)
    if serializer.is_valid():
        group_id = serializer.validated_data['group']
        user_id = serializer.validated_data['user']
        group_member = GroupMember.objects.get(group_id=group_id, user_id=user_id)
        group_member.state = 2 # 모임 가입 상태로 변경
        group_member.save()

        response_data = {  # JSON 형식으로 응답 데이터 구성
            'group_info': GroupDetailSerializer(Group.objects.get(group_id=group_id)).data, # 유저 정보를 모두 담기
        }
        return Response(response_data, status=status.HTTP_201_CREATED)  # JSON 응답 반환
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

# 모임 생성 및 관리
@api_view(['POST'])
@permission_classes([IsAuthenticated])
def create_group(request):
    serializer = GroupSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save(leader=request.user)
        
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)