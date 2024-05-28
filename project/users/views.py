from rest_framework import status
from django.contrib.auth import authenticate
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework_simplejwt.tokens import RefreshToken
from .serializers import UserSerializer, LoginSerializer, RegisterSerializer

from rest_framework.permissions import IsAuthenticated
from rest_framework_simplejwt.authentication import JWTAuthentication
from django.http import JsonResponse
from .Extraction import *
from .models import Schedule
import json
import os

# 시간표 정보를 리턴하는 메소드
@api_view(['GET'])
@permission_classes([IsAuthenticated])
def calendar(request):
    # user_schedule을 QuerySet이 아닌 객체로 가져오기
    user = request.user

    if Schedule.objects.filter(user=user).first() is None:
        Schedule.objects.create(user=user)

    user_schedule = Schedule.objects.filter(user=user).first()

    if user_schedule:
    
        os.chdir(os.path.dirname(os.path.abspath(__file__)))
        imgs = os.listdir('img')
        schedule = Extraction('./img/' + imgs[0]) # 인덱스 변경해야함

        #result = schedule.binarization()
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