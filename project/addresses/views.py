from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from .models import Addresses
from .serializers import AddressesSerializer

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