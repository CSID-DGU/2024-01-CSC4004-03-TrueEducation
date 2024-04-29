from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from .models import Addresses
from .serializers import AddressesSerializer
from django.contrib.auth import authenticate


# Create your views here.
@csrf_exempt
def address_list(request):
    if request.method == 'GET' :
        query_set = Addresses.objects.all()
        serializer = AddressesSerializer(query_set , many = True)
        return JsonResponse(serializer.data, safe = False)
    
    elif request.method == 'POST':
        data = JSONParser().parse(request)
        serializer = AddressesSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data, status=201)
        return JsonResponse(serializer.errors, status=400)
    
@csrf_exempt
def address(request, pk):
    address_data = Addresses.objects.get(pk=pk)
    if request.method == 'GET':
        serializer = AddressesSerializer(address_data)
        return JsonResponse(serializer.data, safe = False)
    
    elif request.method == 'PUT':
        data = JSONParser().parse(request)
        serializer = AddressesSerializer(address_data , data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data, status=201)
        return JsonResponse(serializer.errors, status=400)

    elif request.method == 'DELETE':
        address_data.delete()
        return HttpResponse(status=204)
@csrf_exempt
def login(request):
    if request.method == 'POST':
        print("request log: " + str(request.body))
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
    return render(request, 'addresses/login.html')