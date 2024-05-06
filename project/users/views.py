from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth import authenticate

# Create your views here.
@csrf_exempt
def login(request):
    if request.method == 'POST':
        # print("request log: " + str(request.body))
        id = request.POST.get('userid', '')
        pw = request.POST.get('userpw', '')
        print("id : " + id + " , pw : " + pw)

        result = authenticate(username=id , password=pw)
        if result:
            print("success!")
            return HttpResponse(status=200)
        else:
            print("fail.")
            return HttpResponse(status=401)
    return render(request, 'users/login.html')