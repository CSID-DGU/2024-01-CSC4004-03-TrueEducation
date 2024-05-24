from django.http import JsonResponse
from .Extraction import *
from .models import Schedule, User
import json
import os

# Create your views here.
def calendar(request):
    # user_schedule을 QuerySet이 아닌 객체로 가져오기
    user_schedule = Schedule.objects.filter(user_id=1).first()
    
    if user_schedule:
        os.chdir(os.path.dirname(os.path.abspath(__file__)))
        imgs = os.listdir('img')
        schedule = Extraction('./img/' + imgs[0])

        result = schedule.binarization()
        serialized = json.dumps(result)
        
        # timetable 필드에 직렬화된 데이터 저장
        user_schedule.timetable = serialized
        user_schedule.save()  # 저장 후에 데이터베이스에 반영

        # 특정 필드만 선택하여 JSON 응답 생성
        response_data = {
            "user_id": user_schedule.user_id,
            "timetable": user_schedule.timetable
        }
        return JsonResponse(response_data)
    else:
        return JsonResponse({'error': 'No schedule found'})
