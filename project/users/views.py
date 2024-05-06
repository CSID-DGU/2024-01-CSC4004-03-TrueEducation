from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.contrib import auth
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.models import User

@csrf_exempt
def login(request):
    if request.method == 'POST' :
        username = request.POST['username']
        password = request.POST['password']

        user = auth.authenticate(request, username=username, password=password)
        
        if user is not None:
            auth.login(request,user)
            print("success")
            #return HttpResponse(status=200)
        else:
            print("fail")
            #return HttpResponse(status=401)
        return render(request, "users/success.html")
        
    elif request.method == 'GET' :
        return render(request, 'users/login.html')

def logout(request):
    auth.logout(request)
    print("logout")
    return redirect("users:login")

def signup(request):
    if request.method == 'POST' :
        
        if request.POST['password'] == request.POST['confirm']:
            user = User.objects.create_user(
                username=request.POST['username'],
                password=request.POST['password']
            )

            auth.login(request, user)
            print("create")
            return render(request, "users/success.html")
    return render(request, 'users/signup.html')