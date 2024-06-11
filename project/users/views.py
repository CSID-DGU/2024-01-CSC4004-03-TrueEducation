from rest_framework import status
from django.contrib.auth import authenticate
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework_simplejwt.tokens import RefreshToken
from .serializers import UserSerializer, LoginSerializer, RegisterSerializer, GroupSerializer, GroupMemberSerializer, GroupDetailSerializer, AcceptMemberSerializer, VariationSerializer, UserStateSerializer

from rest_framework.permissions import IsAuthenticated
from django.http import JsonResponse
from .Extraction import *
from .models import Schedule, Group, GroupMember, Variance, UserState
import json, datetime

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
        image = request.FILES.get('image')
        schedule = Extraction(image)
        result = schedule.binarization()

        variance = Variance.objects.filter(user=request.user)
        count = 1
        for i in range(len(result)):
            for j in range(len(result[i])):
                for k in variance:
                    if k.day == count:
                        result[i][j] &= int(k.variable_time, 2)
                        # print(int(k.variable_time, 2))
                        # print(timetable[i][j])
            count = count + 1
        
        user_schedule.timetable = json.dumps(result)
        user_schedule.save()
    
        response_data = {
            "timetable" : user_schedule.timetable
        }
        return JsonResponse(response_data, status=status.HTTP_201_CREATED)
        
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

            user_state = UserState.objects.create(user=user)
            user_state.save() #user_state 값 생성
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
    
    user_schedule = Schedule.objects.filter(user=request.user).first()
    if user_schedule :
        timetable = json.loads(user_schedule).timetable
        for i in range(len(timetable)):
            temp = 0
            for j in range(len(timetable[i])):
                temp |= timetable[i][j]
            
            str_binary = str(format(temp, '029b'))

            for k in filtered_groups:
                # 요일 정보 출력
                weekday = datetime.date(k.start_time.year, k.start_time.month, k.start_time.day).weekday()
                start_time = k.start_time.hour * 3600 + k.start_time.minute * 60
                end_time = k.end_time.hour * 3600 + k.end_time.minute * 60
                start_index = int((start_time/3600 - 9.0) * 2) # 0 ~ 26 인덱스
                end_index = int((end_time/3600 - 9.0) * 2) # 0 ~ 26 인덱스
                if i == weekday: # 시간표의 요일과 그룹 생성 요일이 같은 지 확인
                    for t in range(start_index, end_index):
                        if str_binary[t] == '1': # 해당 시간 시간표 값이 1 일때(공강이 아닐 때)
                            filtered_groups.remove(k)
                            break
        
        group_members = GroupMember.objects.filter(user = request.user)
        member_group = {member.group for member in group_members} #현재 가입했거나 대기중인 그룹
        # 사용자가 속하지 않은 그룹을 필터링
        filtered_groups = [group for group in groups if group not in member_group and group.leader != request.user]
        response_data = {
            "recommend_group" : GroupSerializer(filtered_groups, many=True).data
        }
    else:
        response_data = {
            "recommend_group" : GroupSerializer(groups, many=True).data
        }
    return Response(response_data)

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

@api_view(['POST'])
@permission_classes([IsAuthenticated])
def make_variation(request):
    serializer = VariationSerializer(data=request.data)
    user_schedule = Schedule.objects.filter(user=request.user).first()
    timetable = json.loads(user_schedule.timetable)
   
    if serializer.is_valid():
        serializer.save(user=request.user)
        variance = Variance.objects.filter(user=request.user)
        count = 1
        for i in range(len(timetable)):
            for j in range(len(timetable[i])):
                for k in variance:
                    if k.day == count:
                        timetable[i][j] &= int(k.variable_time, 2)
            count = count + 1
        
        user_schedule.timetable = json.dumps(timetable)
        user_schedule.save()

        response_data = {
            "timetable" : user_schedule.timetable
        }
        return Response(response_data, status=status.HTTP_201_CREATED)
    
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_variation(request):
    variance = Variance.objects.filter(user=request.user)
   
    serializer = VariationSerializer(variance, many=True)
    return Response(serializer.data)

@api_view(['DELETE'])
@permission_classes([IsAuthenticated])
def delete_variation(request):
    variance = Variance.objects.filter(user=request.user)
   
    serializer = VariationSerializer(variance, many=True)
    return Response(serializer.data)

# 유저 평가
@api_view(['POST'])
@permission_classes([IsAuthenticated])
def update_user_state(request):
    user = request.user
    user_state = UserState.objects.get(user=user)
    
    serializer = UserStateSerializer(user_state, data=request.data, partial=True)
    if serializer.is_valid():
        serializer.save()            
        response_data = serializer.data
        response_data['message'] = '유저 평가 완료'
        return Response(response_data,  status=status.HTTP_200_OK)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

# 유저 평가 정보 가져오기
@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_user_state(request):
    user = request.user
    user_state = UserState.objects.get(user=user)
    
    serializer = UserStateSerializer(user_state)
    return Response(serializer.data)
