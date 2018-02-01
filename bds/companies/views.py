#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from unicodecsv import DictReader

from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.http import JsonResponse
from werkzeug.security import generate_password_hash, check_password_hash
from django.contrib.auth import authenticate
import uuid, datetime
from functools import wraps
import rest_framework_jwt
from .models import Admin, User, Mod, Typerealestate, Realestatenode, Loaiduan, Duan, Typeservice, Servicenode, Groupnode, Tiendo, Phancong, Phanhoi
from serializers import AdminSerializer, UserSerializer, ModSerializer, TyperealestateSerializer, RealestatenodeSerializer, LoaiduanSerializer, DuanSerializer, TypeserviceSerializer, ServicenodeSerializer, GroupnodeSerializer, TiendoSerializer, PhancongSerializer, PhanhoiSerializer
from django.db.models import Q
from django.conf import settings
from django.core.mail import EmailMessage
from django.core.mail import send_mail
from django.http import HttpResponseRedirect
import requests
from logins import views
from django.contrib import messages
from math import radians, cos, sin, asin, sqrt
import csv
import sys
import json
import re
import unicodedata
import xml.etree.ElementTree as ET

#xem, them, sua, xoa ADMIN
@api_view(['GET', 'POST'])
@views.token_required
def list_admin(request, current_admin):
    if request.META['REQUEST_METHOD'] == 'GET':
        admins = Admin.objects.all()
        if admins:
	        serializer = AdminSerializer(admins, many=True)
        	return Response(serializer.data)
        return JsonResponse({'message': 'No Admin!!!'})

    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))
        hashed_password = generate_password_hash(data['password'], method='sha256')
        request.data['password']=hashed_password
        serializer = AdminSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
@views.token_required
def detail_admin(request, current_admin, admin_id):
    try:
        admin = Admin.objects.get(id=admin_id)
    except Admin.DoesNotExist:
        return JsonResponse({'message': 'Not found!!!'}, status=404)

    if request.method == 'GET':
        serializer = AdminSerializer(admin)
        return Response(serializer.data)

    elif request.method == 'PUT':
    	request.data['id']= admin.id
        if 'password' in request.data:
            request.data['password'] = generate_password_hash(request.data['password'], method='sha256')
        elif not request.data['password']:
        	request.data['password'] = admin.password

        serializer = AdminSerializer(admin, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
    	if admin_id != current_admin.id:
        	admin.delete()
        	return Response(status=status.HTTP_204_NO_CONTENT)
        return JsonResponse({'message': 'Not found!!!'}, status=404)

#xem, them, sua, xoa USER
@api_view(['GET', 'POST'])
@views.token_required
def list_user(request, current_admin):
    if request.META['REQUEST_METHOD'] == 'GET':
        users = User.objects.all()
        if users: 	       	
        	serializer = UserSerializer(users, many=True)
        	return Response(serializer.data)
        return JsonResponse({'message': 'No result!!!'})

    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))
        if 'password' not in data:
            return JsonResponse({'message': 'No result!!!'}, status=status.HTTP_400_BAD_REQUEST)

        hashed_password = generate_password_hash(data['password'], method='sha256')
        data['password']=hashed_password
        serializer = UserSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET', 'PUT', 'DELETE'])
@views.token_required
def detail_user(request, current_admin, user_id):
    try:
        user = User.objects.get(id=user_id)
    except User.DoesNotExist:
        return JsonResponse({'message': 'Not found!!!'})

    if request.method == 'GET':
        serializer = UserSerializer(user)
        return Response(serializer.data)

    elif request.method == 'PUT':
        request.data['id'] = user_id
        if 'password' in request.data:
            request.data['password'] = generate_password_hash(request.data['password'], method='sha256')
        else:
            request.data['password'] = user.password
        request.data['username'] = user.username
        request.data['email'] = user.email
        request.data['coin'] = user.coin
        serializer = UserSerializer(user, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        user.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

#xem, them, sua, xoa SMOD
@api_view(['GET', 'POST'])
@views.token_required
def list_smod(request, current_admin):
    if request.META['REQUEST_METHOD'] == 'GET':
        smods = Mod.objects.filter(rank=1)
        if smods:
	        serializer = ModSerializer(smods, many=True)
        	return JsonResponse({'data': serializer.data})
        return JsonResponse({'data': []})

    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))

        #sinh id
        list_id = Mod.objects.all().values_list('id', flat=True)
        data['id'] = str(uuid.uuid4().get_hex().upper()[0:6])
        while data['id'] in list_id:
            data['id'] = str(uuid.uuid4().get_hex().upper()[0:6])

        data['password'] = generate_password_hash(data['password'], method='sha256')
        data['rank']=1
        serializer = ModSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'data':serializer.data})
        else:
            return JsonResponse({'data':[]})

@api_view(['GET', 'PUT', 'DELETE'])
@views.token_required
def detail_smod(request, current_admin, smod_id):
    try:
        smod = Mod.objects.get(id=smod_id, rank=1)
    except Mod.DoesNotExist:
        return JsonResponse({'data': []})

    if request.method == 'GET':
        serializer = ModSerializer(smod)
        return JsonResponse({'data': serializer.data})

    elif request.method == 'PUT':
        request.data['id'] = smod.id

        if 'password' in request.data:
            request.data['password'] = generate_password_hash(request.data['password'], method='sha256')
        else:
        	request.data['password'] = smod.password

        serializer = ModSerializer(smod, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'data': serializer.data})
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        smod.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

#xem, them, sua, xoa MOD
@api_view(['GET', 'POST'])
@views.token_required
def list_mod(request, current_admin):
    if request.META['REQUEST_METHOD'] == 'GET':
        mods = Mod.objects.filter(rank=0)
        if mods:
	        serializer = ModSerializer(mods, many=True)
        	return Response(serializer.data)
        return JsonResponse({'message': 'No Mod!!!'})

    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))
        hashed_password = generate_password_hash(data['password'], method='sha256')
        data['password']=hashed_password
        data['rank']=0
        data['status']=1
        serializer = ModSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
@views.token_required
def detail_mod(request, current_admin, mod_id):
    try:
        mod = Mod.objects.get(id=mod_id, rank=0)
    except Mod.DoesNotExist:
        return JsonResponse({'message': 'Not found!!!'})

    if request.method == 'GET':
        serializer = ModSerializer(mod)
        return Response(serializer.data)

    elif request.method == 'PUT':
        request.data['id'] = mod_id
		
        if 'password' in request.data:
            request.data['password'] = generate_password_hash(request.data['password'], method='sha256')
        else:	
			request.data['password'] = mod.password

        serializer = ModSerializer(mod, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        mod.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

#Xem, Them, Sua, Xoa Type RealEstate
@api_view(['GET', 'POST'])
@views.token_required
def list_typerealestate(request, current_admin):
    if request.META['REQUEST_METHOD'] == 'GET':
        typerealestates = Typerealestate.objects.all()
        if typerealestates:
	        serializer = TyperealestateSerializer(typerealestates, many=True)
        	return Response(serializer.data)
        return JsonResponse({'message': 'No Typerealestate!!!'})

    if request.method == 'POST':
        serializer = TyperealestateSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
@views.token_required
def detail_typerealestate(request, current_admin, typerealestate_id):
    try:
        typerealestate =Typerealestate.objects.get(id=typerealestate_id)
    except Typerealestate.DoesNotExist:
        return JsonResponse({'message': 'Not found!!!'})

    if request.method == 'GET':
        serializer = TyperealestateSerializer(typerealestate)
        return Response(serializer.data)

    elif request.method == 'PUT':
        request.data['id'] = typerealestate_id
        serializer = TyperealestateSerializer(typerealestate, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        typerealestate.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

#Xem, Them, Sua, Xoa RealEstateNode
@api_view(['GET', 'POST'])
@views.token_required
def list_realestatenode(request, current_admin):
    if request.META['REQUEST_METHOD'] == 'GET':
        realestatenodes = Realestatenode.objects.all()
        if realestatenodes:
	        serializer = RealestatenodeSerializer(realestatenodes, many=True)
        	return Response(serializer.data)
        return JsonResponse({'message': 'No Realestatenode!!!'})

    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))

        #sinh id
        list_id = Realestatenode.objects.all().values_list('id', flat=True)
        data['id'] = str(uuid.uuid4().get_hex().upper()[0:20])
        while data['id'] in list_id:
            data['id'] = str(uuid.uuid4().get_hex().upper()[0:20])
            
        serializer = RealestatenodeSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
@views.token_required
def detail_realestatenode(request, current_admin, realestatenode_id):
    try:
        realestatenode =Realestatenode.objects.get(id=realestatenode_id)
    except Realestatenode.DoesNotExist:
        return JsonResponse({'message': 'Not found!!!'})

    if request.method == 'GET':
        serializer = RealestatenodeSerializer(realestatenode)
        return Response(serializer.data)

    elif request.method == 'PUT':
        request.data['id'] = realestatenode_id
        serializer = RealestatenodeSerializer(realestatenode, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        realestatenode.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

#Xem, Them, Sua, Xoa Loaiduan
@api_view(['GET', 'POST'])
@views.token_required
def list_loaiduan(request, current_admin):
    if request.META['REQUEST_METHOD'] == 'GET':
        loaiduans = Loaiduan.objects.all()
        if loaiduans:
	        serializer = LoaiduanSerializer(loaiduans, many=True)
        	return Response(serializer.data)
        return JsonResponse({'message': 'No Loaiduan!!!'})

    if request.method == 'POST':
        serializer = LoaiduanSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
@views.token_required
def detail_loaiduan(request, current_admin, loaiduan_id):
    try:
        loaiduan =Loaiduan.objects.get(id=loaiduan_id)
    except Loaiduan.DoesNotExist:
        return JsonResponse({'message': 'Not found!!!'})

    if request.method == 'GET':
        serializer = LoaiduanSerializer(loaiduan)
        return Response(serializer.data)

    elif request.method == 'PUT':
        request.data['id'] = loaiduan_id
        serializer = LoaiduanSerializer(loaiduan, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        loaiduan.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

#Xem, Them, Sua, Xoa Duan
@api_view(['GET', 'POST'])
@views.token_required
def list_duan(request, current_admin):
    if request.META['REQUEST_METHOD'] == 'GET':
        duans = Duan.objects.all()
        if duans:
	        serializer = DuanSerializer(duans, many=True)
        	return Response(serializer.data)
        return JsonResponse({'message': 'No Duan!!!'})

    if request.method == 'POST':
        serializer = DuanSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
@views.token_required
def detail_duan(request, current_admin, duan_id):
    try:
        duan =Duan.objects.get(id=duan_id)
    except Duan.DoesNotExist:
        return JsonResponse({'message': 'Not found!!!'})

    if request.method == 'GET':
        serializer = DuanSerializer(duan)
        return Response(serializer.data)

    elif request.method == 'PUT':
        request.data['id'] = duan_id
        serializer = DuanSerializer(duan, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        duan.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

#Xem, Them, Sua, Xoa Typeservice
@api_view(['GET', 'POST'])
@views.token_required
def list_typeservice(request, current_admin):
    if request.META['REQUEST_METHOD'] == 'GET':
        typeservices = Typeservice.objects.all()
        if typeservices:
	        serializer = TypeserviceSerializer(typeservices, many=True)
        	return Response(serializer.data)
        return JsonResponse({'message': 'No Typeservice!!!'})

    if request.method == 'POST':
        serializer = TypeserviceSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
@views.token_required
def detail_typeservice(request, current_admin, typeservice_id):
    try:
        typeservice =Typeservice.objects.get(id=typeservice_id)
    except Typeservice.DoesNotExist:
        return JsonResponse({'message': 'Not found!!!'})

    if request.method == 'GET':
        serializer = TypeserviceSerializer(typeservice)
        return Response(serializer.data)

    elif request.method == 'PUT':
        request.data['id'] = typeservice_id
        serializer = TypeserviceSerializer(typeservice, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        typeservice.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

#Xem, Them, Sua, Xoa Servicenode
@api_view(['GET', 'POST'])
@views.token_required
def list_servicenode(request, current_admin):
    if request.META['REQUEST_METHOD'] == 'GET':
        servicenodes = Servicenode.objects.all()
        if servicenodes:
	        serializer = ServicenodeSerializer(servicenodes, many=True)
        	return Response(serializer.data)
        return JsonResponse({'message': 'No Servicenode!!!'})

    if request.method == 'POST':
        serializer = ServicenodeSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
@views.token_required
def detail_servicenode(request, current_admin, servicenode_id):
    try:
        servicenode =Servicenode.objects.get(id=servicenode_id)
    except Servicenode.DoesNotExist:
        return JsonResponse({'message': 'Not found!!!'})

    if request.method == 'GET':
        serializer = ServicenodeSerializer(servicenode)
        return Response(serializer.data)

    elif request.method == 'PUT':
        request.data['id'] = servicenode_id
        serializer = ServicenodeSerializer(servicenode, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        servicenode.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

#Xem, Them, Sua, Xoa Groupnode
@api_view(['GET', 'POST'])
@views.token_required
def list_groupnode(request, current_admin):
    if request.META['REQUEST_METHOD'] == 'GET':
        groupnodes = Groupnode.objects.all()
        if groupnodes:
	        serializer = GroupnodeSerializer(groupnodes, many=True)
        	return Response(serializer.data)
        return JsonResponse({'message': 'No groupnode!!!'})

    if request.method == 'POST':
        serializer = GroupnodeSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
@views.token_required
def detail_groupnode(request, current_admin, groupnode_id):
    try:
        groupnode =Groupnode.objects.get(id=groupnode_id)
    except Groupnode.DoesNotExist:
        return JsonResponse({'message': 'Not found!!!'})

    if request.method == 'GET':
        serializer = GroupnodeSerializer(groupnode)
        return Response(serializer.data)

    elif request.method == 'PUT':
        request.data['id'] = groupnode_id
        serializer = GroupnodeSerializer(groupnode, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        groupnode.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

#Thay doi coin cua User
@api_view(['PUT'])
@views.token_required
def change_coin(request, current_admin):
	try:
		user = User.objects.get(id=request.data['user_id'])
	except User.DoesNotExist:
		return JsonResponse({'message': 'Not found!!!'})
	if request.method == 'PUT':
		request.data['id'] = user.id
		request.data['username'] = user.username
		request.data['password'] = user.password
		request.data['email'] = user.email
		request.data['coin'] = int(user.coin) + int(request.data['coin'])
		serializer = UserSerializer(user, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

##################################################################################

##NGUOI dung chua Dang Nhap
#1. Them User
@api_view(['POST'])
def create_user(request):
    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))
        if 'password' not in data or 'name' not in data or 'phone' not in data or 'email' not in data:
            return JsonResponse({'message': 'No result!!!'}, status=status.HTTP_400_BAD_REQUEST)

        list_id = User.objects.all().values_list('id', flat=True)

        #sinh id cua user
        data['id'] = str(uuid.uuid4().get_hex().upper()[0:10])
        while data['id'] in list_id:
            data['id'] = str(uuid.uuid4().get_hex().upper()[0:10])
        
        hashed_password = generate_password_hash(data['password'], method='sha256')
        data['password']=hashed_password
        data['status'] = False
        data['rank'] = 1
        data['coin'] = 0

        captcha = {'g-recaptcha-response': data['g-recaptcha-response']}
        recaptcha = requests.post('http://mappy.com.vn:8000/user/recaptcha/', data=captcha).json()

        if recaptcha['status'] == False:
            return JsonResponse({'message': 'No result!!!'}, status=status.HTTP_400_BAD_REQUEST)

        serializer = UserSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            uid = str(uuid.uuid4())
            token = rest_framework_jwt.utils.jwt_encode_handler({'id': data['id'], 'exp': datetime.datetime.now() + datetime.timedelta(minutes=120), 'jti': uid})
            message = 'Nhấp vào link:        http://mappy.com.vn/confirm-email/'+token+'.'

            send_mail('360 land confirm Account', message, 'hienhdt32@gmail.com',[data['email']])

            return Response({'message': 'OK!!!'}, status=200)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#1.9 Check captcha
@api_view(['POST'])
def grecaptcha_verify(request):
    if request.method == 'POST':
        response = {}
        data=json.loads(json.dumps(request.data))
        captcha_rs = data.get('g-recaptcha-response')
        url = "https://www.google.com/recaptcha/api/siteverify"
        params = {
            'secret': settings.RECAPTCHA_SECRET_KEY,
            'response': captcha_rs
        }
        verify_rs = requests.get(url, params=params, verify=True)
        verify_rs = verify_rs.json()
        response["status"] = verify_rs.get("success", False)
        response['message'] = verify_rs.get('error-codes', None) or "Unspecified error."
        return Response(response)

#1.5. Confirm email
@api_view(['GET'])
def confirm_user(request, token):
    if request.method == 'GET':
        try:
            data = rest_framework_jwt.utils.jwt_decode_handler(token)
        except:
            return JsonResponse({'data': 'error'}, status=401)

        try:
            current_user = User.objects.get(id=data['id'], status=False)
        except:
            return JsonResponse({'data': 'error'}, status=401)

        if not current_user or current_user.status == True:
            return JsonResponse({'data': 'error'}, status=401)

        user = {}
        user['id'] = current_user.id
        user['username'] = current_user.username
        user['password'] = current_user.password
        user['email'] = current_user.email
        user['phone'] = current_user.phone
        user['address'] = current_user.address
        user['company'] = current_user.company
        user['sex'] = current_user.sex
        user['birthday'] = current_user.birthday
        user['coin'] = current_user.coin
        user['status'] = True
        user['rank'] = current_user.rank
        user['name'] = current_user.name
        user['avatar'] = current_user.avatar

        serializer = UserSerializer(current_user, data=user)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'data': 'OK'}, status=200)

        return JsonResponse({'data': 'error'}, status=401)

### Doi mat khau
#1.4 Check mail khi reset password
@api_view(['POST'])
def check_mail(request):
    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))
        try:
            user = User.objects.get(email=data['email'], status=True)
        except User.DoesNotExist:
            return JsonResponse({'data': []})

        #send mail
        uid = str(uuid.uuid4())
        token = rest_framework_jwt.utils.jwt_encode_handler({'id': user.id, 'exp': datetime.datetime.now() + datetime.timedelta(minutes=120), 'jti': uid})
        message = 'Nhấp vào link để đặt lại mật khẩu:        http://mappy.com.vn/reset-password/'+token+'.'
        
        try:
            send_mail('360 land confirm Account', message, 'hienhdt32@gmail', [user.email])
        except:
            return JsonResponse({'data': []})
        return JsonResponse({'data': []})

#1.5 Reset password / OK thi dua pass de dat lai pass.
@api_view(['GET'])
def resetpassword(request, token):
    if request.method == 'GET':
        try:
            data = rest_framework_jwt.utils.jwt_decode_handler(token)
        except:
            return JsonResponse({'data': 'error'}, status=401)

        user = User.objects.get(id=data['id'], status=True)
        if not user:
            JsonResponse({'data': 'error'})

        uid = str(uuid.uuid4())
        token = rest_framework_jwt.utils.jwt_encode_handler({'id': user.id, 'exp': datetime.datetime.now() + datetime.timedelta(minutes=2880), 'jti': uid})
        return JsonResponse({'token': token.decode('UTF-8')})

#1.7 Dat lai pass
@api_view(['PUT'])
@views.token_required_user
def setpassword(request, current_user):
    if request.method == 'PUT':
        data=json.loads(json.dumps(request.data))
        data['id'] = current_user.id
        data['username'] = current_user.username
        data['password'] = generate_password_hash(data['password'], method='sha256')
        data['email'] = current_user.email
        data['phone'] = current_user.phone
        data['address'] = current_user.address
        data['company'] = current_user.company
        data['sex'] = current_user.sex
        data['birthday'] = current_user.birthday
        data['coin'] = current_user.coin
        data['status'] = current_user.status
        data['rank'] = current_user.rank
        data['name'] = current_user.name
        data['avatar'] = current_user.avatar
        
        serializer = UserSerializer(current_user, data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'data':'OK'})
        else:
            return JsonResponse({'data':'error'})

#NGuoi dung binh thuong xem thong tin cua SALES
@api_view(['POST'])
def profile(request):
    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))

        try:
            user = User.objects.get(username=data['name'])
        except:
            return JsonResponse({'data': 'error'})

        user.password = ''
        user.status = ''
        user.rank = 0
        user.coin = ''
        serializer = UserSerializer(user)
        serializer = serializer.data
        
        return JsonResponse({'data': serializer})     

#########TIM KIEM DIA DIEM
#3. Tim service quanh node theo ban kinh
def caculator(lat1, lon1, lat2, lon2, radius):
    lon1, lat1, lon2, lat2 = map(radians, [lon1, lat1, lon2, lat2])
    dlon = lon2 - lon1
    dlat = lat2 - lat1
    a = sin(dlat/2)**2 + cos(lat1) * cos(lat2) * sin(dlon/2)**2
    c = 2 * asin(sqrt(a))
    r = 6371 # Radius of earth in kilometers. Use 3956 for miles
    
    if (c * r) <= radius:
        return True
    else:
        return False

@api_view(['POST'])
def find_service(request):
    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))
        servicenodes = Servicenode.objects.all()

        latitude = data['latitude']
        longitude = data['longitude']
        radius = data['radius']

        result = []
        for servicenode in servicenodes:
            if caculator(lat1, lon1, servicenode.latitude, servicenode.longitude, radius):
                result.append(servicenode)

        if result:
            return JsonResponse({'message': result})
        return JsonResponse({'message': 'No Servicenode!!!'})

#6. Doc service node
@api_view(['GET'])
def list_servicenode(request):
    if request.META['REQUEST_METHOD'] == 'GET':
        servicenodes = Servicenode.objects.all()
        if servicenodes:
            serializer = ServicenodeSerializer(servicenodes, many=True)
            return Response(serializer.data)
        return JsonResponse({'message': 'No Servicenode!!!'})

#7.Doc TypeRealestateNode
@api_view(['GET'])
def list_typerealestate(request):
    if request.META['REQUEST_METHOD'] == 'GET':
        typerealestates = Typerealestate.objects.all()
        if typerealestates:
            serializer = TyperealestateSerializer(typerealestates, many=True)
            return Response(serializer.data)
        return JsonResponse({'message': 'No Typerealestate!!!'})

#8. Doc TypeService
@api_view(['GET'])
def list_typeservice(request):
    if request.META['REQUEST_METHOD'] == 'GET':
        typeservices = Typeservice.objects.all()
        if typeservices:
            serializer = TypeserviceSerializer(typeservices, many=True)
            return Response(serializer.data)
        return JsonResponse({'message': 'No Typeservice!!!'})

#9. Doc GroupNode
@api_view(['GET'])
def list_groupnode(request):
    if request.META['REQUEST_METHOD'] == 'GET':
        groupnodes = Groupnode.objects.all()
        if groupnodes:
            serializer = GroupnodeSerializer(groupnodes, many=True)
            return Response(serializer.data)
        return JsonResponse({'message': 'No groupnode!!!'})

#9.3 Doc tat ca du an
@api_view(['GET'])
def tatcaduan(request):
    if request.META['REQUEST_METHOD'] == 'GET':
        duans = Duan.objects.filter(status=True)
        if duans:
            serializer = DuanSerializer(duans, many=True)
            return Response(serializer.data)
        return JsonResponse({'message': 'No duan!!!'})

#9.5 Doc chi tiet duan
@api_view(['POST'])
def chitietduan(request):
    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))
        try:
            duan = Duan.objects.get(id=data['id'])
        except:
            return JsonResponse({'message': 'No duan!!!'})

        result = {}
        if duan or duan.status==True:
            serializer = DuanSerializer(duan)
            result = serializer.data
            result['status'] = ''
#            if result['thumbs'] != 'null' and result['thumbs'] != '' and result['thumbs'] != 'NULL' and result['thumbs'] != 'None' and result['thumbs'] != None:
#               result['thumbs'] = result['thumbs'].split(',')
            return Response(result)

        return JsonResponse({'message': 'No duan!!!'})

#9.7 Doc chi tiet node
@api_view(['POST'])
def chitietnode(request):
    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))
        try:
            realestatenode =Realestatenode.objects.get(id=data['id'])
        except:
            return JsonResponse({'message': 'No node!!!'})

        result = {}
        if realestatenode or realestatenode.status==True:
            serializer = RealestatenodeSerializer(realestatenode)
            result = serializer.data
            result['modid'] = ''
            result['timeto'] = ''
            result['status'] = ''
#            if result['thumbs'] != 'null' and result['thumbs'] != '' and result['thumbs'] != 'NULL' and result['thumbs'] != 'None' and result['thumbs'] != None:
#                result['thumbs'] = result['thumbs'].split(',')
            return Response(result)

        return JsonResponse({'message': 'No node!!!'})

def indexd(distric, province):
    #read csv, and split on "," the line
    csv_file = csv.reader(open('VNM_adm2.csv', "rb"), delimiter=str(u','))
    for row in csv_file:
        if row[11] == distric and row[5] == province:
            return str(row[6])

def indexdpro(province):
    #read csv, and split on "," the line
    csv_file = csv.reader(open('VNM_adm2.csv', "rb"), delimiter=str(u','))
    for row in csv_file:
        if row[5] == province:
            return str(row[4])

#10. Xac dinh bound cho quan
@api_view(['POST'])
def bound_distric(request):
    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))

        if data['distric'] != 'CN':
            i = indexd(data['distric'], data['province'])

        if data['distric'] == 'CN':
            i = indexdpro(data['province'])
            root = ET.parse("VNM_adm1.kml", parser=ET.XMLParser(encoding='utf-8') )
            root = root.find('.//{http://earth.google.com/kml/2.2}Document')
            root = root.findall('.//{http://earth.google.com/kml/2.2}Placemark')
            for con in root:
                style = con.find('.//{http://earth.google.com/kml/2.2}styleUrl')
                if style.text == '#'+str(i):
                    con = con.find('.//{http://earth.google.com/kml/2.2}MultiGeometry')
                    con = con.findall('.//{http://earth.google.com/kml/2.2}Polygon')
                    distric = []
                    for con in con:
                        con = con.find('.//{http://earth.google.com/kml/2.2}outerBoundaryIs')
                        con = con.find('.//{http://earth.google.com/kml/2.2}LinearRing')
                        con = con.find('.//{http://earth.google.com/kml/2.2}coordinates')
                        a = {'outerBoundaryIs': con.text}
                        distric.append(a)
                    return JsonResponse({'message': distric})
            return JsonResponse({'message': 'None result!!!'})            
        else:
            if data['distric'] == "Bac Tu Liem" and data['province'] == "Ha Noi":
                root = ET.parse("BTL.kml", parser=ET.XMLParser(encoding='utf-8') )
                root = root.find('.//{http://earth.google.com/kml/2.1}Document')
                root = root.find('.//{http://earth.google.com/kml/2.1}Placemark')
                root = root.find('.//{http://earth.google.com/kml/2.1}Polygon')
                root = root.find('.//{http://earth.google.com/kml/2.1}LinearRing')
                con = root.find('.//{http://earth.google.com/kml/2.1}coordinates')
                a = {'outerBoundaryIs': con.text}
                return JsonResponse({'message': a})

            if data['distric'] == "Nam Tu Liem" and data['province'] == "Ha Noi":
                root = ET.parse("NTL.kml", parser=ET.XMLParser(encoding='utf-8') )
                root = root.find('.//{http://earth.google.com/kml/2.1}Document')
                root = root.find('.//{http://earth.google.com/kml/2.1}Placemark')
                root = root.find('.//{http://earth.google.com/kml/2.1}Polygon')
                root = root.find('.//{http://earth.google.com/kml/2.1}LinearRing')
                con = root.find('.//{http://earth.google.com/kml/2.1}coordinates')
                a = {'outerBoundaryIs': con.text}
                return JsonResponse({'message': a})

            root = ET.parse("VNM_adm2.kml", parser=ET.XMLParser(encoding='utf-8'))
            root = root.find('.//{http://earth.google.com/kml/2.2}Document')
            root = root.findall('.//{http://earth.google.com/kml/2.2}Placemark')
            for con in root:
                style = con.find('.//{http://earth.google.com/kml/2.2}styleUrl')
                if style.text == '#'+str(i):
                    con = con.find('.//{http://earth.google.com/kml/2.2}MultiGeometry')
                    con = con.findall('.//{http://earth.google.com/kml/2.2}Polygon')
                    distric = []
                    for con in con:
                        con = con.find('.//{http://earth.google.com/kml/2.2}outerBoundaryIs')
                        con = con.find('.//{http://earth.google.com/kml/2.2}LinearRing')
                        con = con.find('.//{http://earth.google.com/kml/2.2}coordinates')
                        a = {'outerBoundaryIs': con.text}
                        distric.append(a)
                    return JsonResponse({'message': distric})
            return JsonResponse({'message': 'None result!!!'})


#10.2 Xac dinh bound cho xa/phuong
@api_view(['POST'])
def bound_ward(request):
    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))
        
        i = indexd(data['commune'], data['distric'], data['province'])

        if data['distric'] == "Bac Tu Liem" and data['province'] == "Ha Noi":
            root = ET.parse("BTL.kml", parser=ET.XMLParser(encoding='utf-8') )
            root = root.find('.//{http://earth.google.com/kml/2.1}Document')
            root = root.find('.//{http://earth.google.com/kml/2.1}Placemark')
            root = root.find('.//{http://earth.google.com/kml/2.1}Polygon')
            root = root.find('.//{http://earth.google.com/kml/2.1}LinearRing')
            con = root.find('.//{http://earth.google.com/kml/2.1}coordinates')
            a = {'outerBoundaryIs': con.text}
            return JsonResponse({'message': a})

        if data['distric'] == "Nam Tu Liem" and data['province'] == "Ha Noi":
            root = ET.parse("NTL.kml", parser=ET.XMLParser(encoding='utf-8') )
            root = root.find('.//{http://earth.google.com/kml/2.1}Document')
            root = root.find('.//{http://earth.google.com/kml/2.1}Placemark')
            root = root.find('.//{http://earth.google.com/kml/2.1}Polygon')
            root = root.find('.//{http://earth.google.com/kml/2.1}LinearRing')
            con = root.find('.//{http://earth.google.com/kml/2.1}coordinates')
            a = {'outerBoundaryIs': con.text}
            return JsonResponse({'message': a})

        root = ET.parse("VNM_adm3.kml", parser=ET.XMLParser(encoding='utf-8') )
        root = root.find('.//{http://earth.google.com/kml/2.2}Document')
        root = root.findall('.//{http://earth.google.com/kml/2.2}Placemark')
        for con in root:
            style = con.find('.//{http://earth.google.com/kml/2.2}styleUrl')
            if style.text == '#'+str(i):
                con = con.find('.//{http://earth.google.com/kml/2.2}MultiGeometry')
                con = con.findall('.//{http://earth.google.com/kml/2.2}Polygon')
                distric = []
                for con in con:
                    con = con.find('.//{http://earth.google.com/kml/2.2}outerBoundaryIs')
                    con = con.find('.//{http://earth.google.com/kml/2.2}LinearRing')
                    con = con.find('.//{http://earth.google.com/kml/2.2}coordinates')
                    a = {'outerBoundaryIs': con.text}
                    distric.append(a)
                return JsonResponse({'message': distric})
        return JsonResponse({'message': 'None result!!!'})

#########################TIM KIEM#######################################

#typenode: nguoi dang la nguoi can mua/thue (False), nguoi dang la nguoi can ban/cho thue(True)
#danh cho nguoi cho mua, thue nha
#10. Search node can mua
@api_view(['GET'])
def searchnodebuy(request):
    if request.method == 'GET':
        typereal = Typerealestate.objects.filter(type=True).values('id') #loai node ban
        realestatenodes = Realestatenode.objects.filter(typenode=False, type__in=typereal, status=True)
        if realestatenodes:
            serializer = RealestatenodeSerializer(realestatenodes, many=True)
            return Response(serializer.data)
        return JsonResponse({'message': 'No node!!!'})

#11. Search node can thue
@api_view(['GET'])
def searchnodehire(request):
    if request.method == 'GET':
        typereal = Typerealestate.objects.filter(type=False).values('id') #loai node ban
        realestatenodes = Realestatenode.objects.filter(typenode=False, status=True, type__in=typereal)
        if realestatenodes:
            serializer = RealestatenodeSerializer(realestatenodes, many=True)
            return Response(serializer.data)
        return JsonResponse({'message': 'No node!!!'})

#################TIM KIEM CHUNG
@api_view(['POST'])
def searchall(request):
    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))
        result = {}

        if data['type_search'] == "1":
            resultnode = {}
            if data['area'] == 'CN'  :
                data['areamin'] = 0
                data['areamax'] = 1000000
            elif data['area'] == '1'  :
                data['areamin'] = 0
                data['areamax'] = 30
            elif data['area'] == '2'  :
                data['areamin'] = 30
                data['areamax'] = 50                
            elif data['area'] == '3'  :
                data['areamin'] = 50
                data['areamax'] = 80
            elif data['area'] == '4'  :
                data['areamin'] = 80
                data['areamax'] = 100
            elif data['area'] == '5'  :
                data['areamin'] = 100
                data['areamax'] = 150                
            elif data['area'] == '6'  :
                data['areamin'] = 150
                data['areamax'] = 200
            elif data['area'] == '7'  :
                data['areamin'] = 200
                data['areamax'] = 250
            elif data['area'] == '8'  :
                data['areamin'] = 250
                data['areamax'] = 300               
            elif data['area'] == '9'  :
                data['areamin'] = 350
                data['areamax'] = 500
            elif data['area'] == '10'  :
                data['areamin'] = 500
                data['areamax'] = 1000000
                    
            if data['price'] == '-1'  :
                data['pricemin'] = 0
                data['pricemax'] = 1000000
            elif data['price'] == 'CN'  :
                data['pricemin'] = 0
                data['pricemax'] = 0
            elif data['price'] == '1'  :
                data['pricemin'] = 0
                data['pricemax'] = 0.5
            elif data['price'] == '2'  :
                data['pricemin'] = 0.5
                data['pricemax'] = 0.8               
            elif data['price'] == '3'  :
                data['pricemin'] = 0.8
                data['pricemax'] = 1
            elif data['price'] == '4'  :
                data['pricemin'] = 1
                data['pricemax'] = 2
            elif data['price'] == '5'  :
                data['pricemin'] = 2
                data['pricemax'] = 3
            elif data['price'] == '6'  :
                data['pricemin'] = 3
                data['pricemax'] = 5
            elif data['price'] == '7'  :
                data['pricemin'] = 5
                data['pricemax'] = 7
            elif data['price'] == '8'  :
                data['pricemin'] = 7
                data['pricemax'] = 10
            elif data['price'] == '9'  :
                data['pricemin'] = 10
                data['pricemax'] = 20
            elif data['price'] == '10'  :
                data['pricemin'] = 20
                data['pricemax'] = 30
            elif data['price'] == '11'  :
                data['pricemin'] = 0
                data['pricemax'] = 1000000

        # Chuyen tu id sang ten --city--
            datapostion = json.loads(open('mapcity1.json').read().decode('utf-8-sig'))
            if data['city'] == 'CN':
                data['city'] = ''
                data['district'] = 'CN'
                data['ward'] = 'CN'
                data['street'] = 'CN'
            else:
                for c in datapostion:
                    if c['code'] == data['city']:
                        data['city'] = c['name']
                        break
        
            if data['district'] == 'CN':
                data['district'] = ''
                data['ward'] = 'CN'
                data['street'] = 'CN'
            else:
                d = c['district']
                for x in d:
                    if x['id'] == int(data['district']):
                        data['district'] = x['name']
                        break

            if data['ward'] == 'CN':
                data['ward'] = ''
            else:
                w = x['ward']
                for wx in w:
                    if wx['id'] == int(data['ward']):
                        data['ward'] = wx['name']
                        break

            if data['street'] == 'CN':
                data['street'] = ''
            else:
                s = x['street']
                for sx in s:
                    if sx['id'] == int(data['street']):
                        data['street'] = sx['name']
                        break

            if data['direction'] == 'CN':
                data['direction'] = ''
            elif data['direction'] == 'e':
                data['direction'] = 'Đông'
            elif data['direction'] == 'en':
                data['direction'] = 'Đông Bắc'
            elif data['direction'] == 'es':
                data['direction'] = 'Đông Nam'
            elif data['direction'] == 'w':
                data['direction'] = 'Tây'
            elif data['direction'] == 'wn':
                data['direction'] = 'Tây Bắc'
            elif data['direction'] == 'ws':
                data['direction'] = 'Tây Nam'

            if data['room'] == 'CN':
                data['room'] = ''

            if 'minLat' not in data and 'minLng' not in data:
                data['minLat'] = -1000000
                data['minLng'] = -1000000

            if 'maxLat' not in data and 'maxLng' not in data:
                data['maxLat'] = 1000000
                data['maxLng'] = 1000000

            if data['type'] == 'CN':
                if data['type_action'] == '0':
                    realestatenodes = Realestatenode.objects.filter(status=True).filter(tinh__icontains=data['city'], huyen__icontains=data['district'], xa__icontains=data['ward'] , duong__icontains=data['street'], huong__icontains=data['direction']).filter(sophongngu__icontains=data['room']).filter(price__gte=data['pricemin'], price__lte=data['pricemax']).filter(area__gte=data['areamin'], area__lte=data['areamax']).filter(longitude__gte=data['minLng'] ,longitude__lte=data['maxLng'], latitude__gte=data['minLat'] ,latitude__lte=data['maxLat'], timefrom__lte=datetime.datetime.now(), timeto__gte=datetime.datetime.now()).order_by('rank').order_by('-timeto')
            
                elif data['type_action'] == '1' or data['type_action'] == '2':
                    realestatenodes = Realestatenode.objects.filter(type__type=int(data['type_action'])-1, status=True).filter(tinh__icontains=data['city'], huyen__icontains=data['district'], xa__icontains=data['ward'] , duong__icontains=data['street'], huong__icontains=data['direction']).filter(sophongngu__icontains=data['room']).filter(price__gte=data['pricemin'], price__lte=data['pricemax']).filter(area__gte=data['areamin'], area__lte=data['areamax']).filter(longitude__gte=data['minLng'] ,longitude__lte=data['maxLng'], latitude__gte=data['minLat'] ,latitude__lte=data['maxLat'], timefrom__lte=datetime.datetime.now(), timeto__gte=datetime.datetime.now()).order_by('rank').order_by('-timeto')
                    
                else:
                    resultnode = {'node': []}
                    return Response({'node': resultnode['node'], 'project': []})

            else:
                if data['type_action'] == '0':
                    realestatenodes = Realestatenode.objects.filter(type=data['type'], status=True).filter(tinh__icontains=data['city'], huyen__icontains=data['district'], xa__icontains=data['ward'] , duong__icontains=data['street'], huong__icontains=data['direction']).filter(sophongngu__icontains=data['room']).filter(price__gte=data['pricemin'], price__lte=data['pricemax']).filter(area__gte=data['areamin'], area__lte=data['areamax']).filter(longitude__gte=data['minLng'] ,longitude__lte=data['maxLng'], latitude__gte=data['minLat'] ,latitude__lte=data['maxLat'], timefrom__lte=datetime.datetime.now(), timeto__gte=datetime.datetime.now()).order_by('rank').order_by('-timeto')
            
                elif data['type_action'] == '1' or data['type_action'] == '2':
                    realestatenodes = Realestatenode.objects.filter(type__type=int(data['type_action'])-1, type=data['type'], status=True).filter(tinh__icontains=data['city'], huyen__icontains=data['district'], xa__icontains=data['ward'] , duong__icontains=data['street'], huong__icontains=data['direction']).filter(sophongngu__icontains=data['room']).filter(price__gte=data['pricemin'], price__lte=data['pricemax']).filter(area__gte=data['areamin'], area__lte=data['areamax']).filter(longitude__gte=data['minLng'] ,longitude__lte=data['maxLng'], latitude__gte=data['minLat'] ,latitude__lte=data['maxLat'], timefrom__lte=datetime.datetime.now(), timeto__gte=datetime.datetime.now()).order_by('rank').order_by('-timeto')

                else:
                    resultnode = {'node': []}
                    return Response({'node': resultnode['node'], 'project': []})

            if realestatenodes:
                serializer = RealestatenodeSerializer(realestatenodes, many=True)
                
                resultnode = {'node': serializer.data}
                return Response({'node': resultnode['node'], 'project': []})
            resultnode = {'node': []}
            return Response({'node': resultnode['node'], 'project': []})

        elif data['type_search'] == "2":
            datapostion = json.loads(open('mapcity1.json').read().decode('utf-8-sig'))
            if data['city'] == 'CN':
                data['city'] = ''
                data['district'] = 'CN'
                data['ward'] = 'CN'
                data['street'] = 'CN'
            else:
                for c in datapostion:
                    if c['code'] == data['city']:
                        data['city'] = c['name']
                        break
                #print data['city']
        
            if data['district'] == 'CN':
                data['district'] = ''
                data['ward'] = 'CN'
                data['street'] = 'CN'
            else:
                d = c['district']
                for x in d:
                    if x['id'] == int(data['district']):
                        data['district'] = x['name']
                        break

            if data['pricefrom'] == 'CN':
                data['pricefrom'] = 0

            if 'minLat' not in data and 'minLng' not in data:
                data['minLat'] = -1000000
                data['minLng'] = -1000000

            if 'maxLat' not in data and 'maxLng' not in data:
                data['maxLat'] = 1000000
                data['maxLng'] = 1000000

            duans = Duan.objects.filter(name__icontains=data['input'], tinh__icontains=data['city'], huyen__icontains=data['district'], pricefrom__gte=float(data['pricefrom']), status=True).filter(longitude__gte=data['minLng'] ,longitude__lte=data['maxLng'], latitude__gte=data['minLat'] ,latitude__lte=data['maxLat']).order_by('pricefrom')

            if duans:
                serializer = DuanSerializer(duans, many=True)
                result = {"node": [], "project": serializer.data}
                return Response(result)

            result = {"node": [], "project": []}
            return Response(result)

        elif data['type_search'] == "0":
            data=json.loads(json.dumps(request.data))
            resultnode = {}
            if data['area'] == 'CN'  :
                data['areamin'] = 0
                data['areamax'] = 1000000
            elif data['area'] == '1'  :
                data['areamin'] = 0
                data['areamax'] = 30
            elif data['area'] == '2'  :
                data['areamin'] = 30
                data['areamax'] = 50                
            elif data['area'] == '3'  :
                data['areamin'] = 50
                data['areamax'] = 80
            elif data['area'] == '4'  :
                data['areamin'] = 80
                data['areamax'] = 100
            elif data['area'] == '5'  :
                data['areamin'] = 100
                data['areamax'] = 150                
            elif data['area'] == '6'  :
                data['areamin'] = 150
                data['areamax'] = 200
            elif data['area'] == '7'  :
                data['areamin'] = 200
                data['areamax'] = 250
            elif data['area'] == '8'  :
                data['areamin'] = 250
                data['areamax'] = 300               
            elif data['area'] == '9'  :
                data['areamin'] = 350
                data['areamax'] = 500
            elif data['area'] == '10'  :
                data['areamin'] = 500
                data['areamax'] = 1000000
                    
            if data['price'] == '-1'  :
                data['pricemin'] = 0
                data['pricemax'] = 1000000
            elif data['price'] == 'CN'  :
                data['pricemin'] = 0
                data['pricemax'] = 0
            elif data['price'] == '1'  :
                data['pricemin'] = 0
                data['pricemax'] = 0.5
            elif data['price'] == '2'  :
                data['pricemin'] = 0.5
                data['pricemax'] = 0.8               
            elif data['price'] == '3'  :
                data['pricemin'] = 0.8
                data['pricemax'] = 1
            elif data['price'] == '4'  :
                data['pricemin'] = 1
                data['pricemax'] = 2
            elif data['price'] == '5'  :
                data['pricemin'] = 2
                data['pricemax'] = 3
            elif data['price'] == '6'  :
                data['pricemin'] = 3
                data['pricemax'] = 5
            elif data['price'] == '7'  :
                data['pricemin'] = 5
                data['pricemax'] = 7
            elif data['price'] == '8'  :
                data['pricemin'] = 7
                data['pricemax'] = 10
            elif data['price'] == '9'  :
                data['pricemin'] = 10
                data['pricemax'] = 20
            elif data['price'] == '10'  :
                data['pricemin'] = 20
                data['pricemax'] = 30
            elif data['price'] == '11'  :
                data['pricemin'] = 0
                data['pricemax'] = 1000000

        # Chuyen tu id sang ten --city--
            datapostion = json.loads(open('mapcity1.json').read().decode('utf-8-sig'))
            if data['city'] == 'CN':
                data['city'] = ''
                data['district'] = 'CN'
                data['ward'] = 'CN'
                data['street'] = 'CN'
            else:
                for c in datapostion:
                    if c['code'] == data['city']:
                        data['city'] = c['name']
                        break
        
            if data['district'] == 'CN':
                data['district'] = ''
                data['ward'] = 'CN'
                data['street'] = 'CN'
            else:
                d = c['district']
                for x in d:
                    if x['id'] == int(data['district']):
                        data['district'] = x['name']
                        break

            if data['ward'] == 'CN':
                data['ward'] = ''
            else:
                w = x['ward']
                for wx in w:
                    if wx['id'] == int(data['ward']):
                        data['ward'] = wx['name']
                        break

            if data['street'] == 'CN':
                data['street'] = ''
            else:
                s = x['street']
                for sx in s:
                    if sx['id'] == int(data['street']):
                        data['street'] = sx['name']
                        break

            if data['direction'] == 'CN':
                data['direction'] = ''
            elif data['direction'] == 'e':
                data['direction'] = 'Đông'
            elif data['direction'] == 'en':
                data['direction'] = 'Đông Bắc'
            elif data['direction'] == 'es':
                data['direction'] = 'Đông Nam'
            elif data['direction'] == 'w':
                data['direction'] = 'Tây'
            elif data['direction'] == 'wn':
                data['direction'] = 'Tây Bắc'
            elif data['direction'] == 'ws':
                data['direction'] = 'Tây Nam'

            if data['room'] == 'CN':
                data['room'] = ''

            if 'minLat' not in data and 'minLng' not in data:
                data['minLat'] = -1000000
                data['minLng'] = -1000000

            if 'maxLat' not in data and 'maxLng' not in data:
                data['maxLat'] = 1000000
                data['maxLng'] = 1000000

            if data['type'] == 'CN':
                if data['type_action'] == '0':
                    realestatenodes = Realestatenode.objects.filter(status=True).filter(tinh__icontains=data['city'], huyen__icontains=data['district'], xa__icontains=data['ward'] , duong__icontains=data['street'], huong__icontains=data['direction']).filter(sophongngu__icontains=data['room']).filter(price__gte=data['pricemin'], price__lte=data['pricemax']).filter(area__gte=data['areamin'], area__lte=data['areamax']).filter(longitude__gte=data['minLng'] ,longitude__lte=data['maxLng'], latitude__gte=data['minLat'] ,latitude__lte=data['maxLat'], timefrom__lte=datetime.datetime.now(), timeto__gte=datetime.datetime.now()).order_by('rank').order_by('-timeto')
            
                elif data['type_action'] == '1' or data['type_action'] == '2':
                    realestatenodes = Realestatenode.objects.filter(type__type=int(data['type_action'])-1, status=True).filter(tinh__icontains=data['city'], huyen__icontains=data['district'], xa__icontains=data['ward'] , duong__icontains=data['street'], huong__icontains=data['direction']).filter(sophongngu__icontains=data['room']).filter(price__gte=data['pricemin'], price__lte=data['pricemax']).filter(area__gte=data['areamin'], area__lte=data['areamax']).filter(longitude__gte=data['minLng'] ,longitude__lte=data['maxLng'], latitude__gte=data['minLat'] ,latitude__lte=data['maxLat'], timefrom__lte=datetime.datetime.now(), timeto__gte=datetime.datetime.now()).order_by('rank').order_by('-timeto')
                    
                else:
                    resultnode = {'node': []}

            else:
                if data['type_action'] == '0':
                    realestatenodes = Realestatenode.objects.filter(type=data['type'], status=True).filter(tinh__icontains=data['city'], huyen__icontains=data['district'], xa__icontains=data['ward'] , duong__icontains=data['street'], huong__icontains=data['direction']).filter(sophongngu__icontains=data['room']).filter(price__gte=data['pricemin'], price__lte=data['pricemax']).filter(area__gte=data['areamin'], area__lte=data['areamax']).filter(longitude__gte=data['minLng'] ,longitude__lte=data['maxLng'], latitude__gte=data['minLat'] ,latitude__lte=data['maxLat'], timefrom__lte=datetime.datetime.now(), timeto__gte=datetime.datetime.now()).order_by('rank').order_by('-timeto')
            
                elif data['type_action'] == '1' or data['type_action'] == '2':
                    realestatenodes = Realestatenode.objects.filter(type__type=int(data['type_action'])-1, type=data['type'], status=True).filter(tinh__icontains=data['city'], huyen__icontains=data['district'], xa__icontains=data['ward'] , duong__icontains=data['street'], huong__icontains=data['direction']).filter(sophongngu__icontains=data['room']).filter(price__gte=data['pricemin'], price__lte=data['pricemax']).filter(area__gte=data['areamin'], area__lte=data['areamax']).filter(longitude__gte=data['minLng'] ,longitude__lte=data['maxLng'], latitude__gte=data['minLat'] ,latitude__lte=data['maxLat'], timefrom__lte=datetime.datetime.now(), timeto__gte=datetime.datetime.now()).order_by('rank').order_by('-timeto')
                    
                else:
                    resultnode = {'node': []}

            if realestatenodes:
                serializer = RealestatenodeSerializer(realestatenodes, many=True)
                
                resultnode = {'node': serializer.data}
            else:
                resultnode = {'node': []}

            if data['pricefrom'] == 'CN':
                data['pricefrom'] = 0

            if 'minLat' not in data and 'minLng' not in data:
                data['minLat'] = -1000000
                data['minLng'] = -1000000

            if 'maxLat' not in data and 'maxLng' not in data:
                data['maxLat'] = 1000000
                data['maxLng'] = 1000000

            duans = Duan.objects.filter(name__icontains=data['input'], tinh__icontains=data['city'], huyen__icontains=data['district'], pricefrom__gte=float(data['pricefrom']), status=True).filter(longitude__gte=data['minLng'] ,longitude__lte=data['maxLng'], latitude__gte=data['minLat'] ,latitude__lte=data['maxLat']).order_by('pricefrom')

            if duans:
                serializer = DuanSerializer(duans, many=True)
                result = {"node": [], "project": serializer.data}
            else:
                result = {"node": [], "project": []}
            
            resultall = {"node": resultnode['node'], "project": result['project']}
            return Response(resultall)

        resultall = {"node": [], "project": []}
        return Response(resultall)

#11.9.5 Tim du an nang cao = input
@api_view(['POST'])
def searchproject(request):
    #data['ward'] bo sung sau
    data=json.loads(json.dumps(request.data))
    
    # Chuyen tu id sang ten --city--
    datapostion = json.loads(open('mapcity1.json').read().decode('utf-8-sig'))
    if data['city'] == 'CN':
        data['city'] = ''
        data['district'] = 'CN'
        data['ward'] = 'CN'
        data['street'] = 'CN'
    else:
        for c in datapostion:
            if c['code'] == data['city']:
                data['city'] = c['name']
                break
    #print data['city']
        
    if data['district'] == 'CN':
        data['district'] = ''
        data['ward'] = 'CN'
        data['street'] = 'CN'
    else:
        d = c['district']
        for x in d:
            if x['id'] == int(data['district']):
                data['district'] = x['name']
                break

    if data['pricefrom'] == 'CN':
        data['pricefrom'] = 0

    if 'minLat' not in data and 'minLng' not in data:
        data['minLat'] = -1000000
        data['minLng'] = -1000000

    if 'maxLat' not in data and 'maxLng' not in data:
        data['maxLat'] = 1000000
        data['maxLng'] = 1000000

    duans = Duan.objects.filter(name__icontains=data['input'], tinh__icontains=data['city'], huyen__icontains=data['district'], pricefrom__gte=float(data['pricefrom']), status=True).filter(longitude__gte=data['minLng'] ,longitude__lte=data['maxLng'], latitude__gte=data['minLat'] ,latitude__lte=data['maxLat']).order_by('pricefrom')
    #import pdb; pdb.set_trace();
    if duans:
        serializer = DuanSerializer(duans, many=True)
        #return Response(serializer.data)
        return JsonResponse({'project': serializer.data})
    return JsonResponse({'project': []})

#################TIM KIEM NODE
@api_view(['POST'])
def searchnode(request):
    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))
        
        if data['area'] == 'CN'  :
            data['areamin'] = 0
            data['areamax'] = 1000000
        elif data['area'] == '1'  :
            data['areamin'] = 0
            data['areamax'] = 30
        elif data['area'] == '2'  :
            data['areamin'] = 30
            data['areamax'] = 50
        elif data['area'] == '3'  :
            data['areamin'] = 50
            data['areamax'] = 80
        elif data['area'] == '4'  :
            data['areamin'] = 80
            data['areamax'] = 100
        elif data['area'] == '5'  :
            data['areamin'] = 100
            data['areamax'] = 150                
        elif data['area'] == '6'  :
            data['areamin'] = 150
            data['areamax'] = 200
        elif data['area'] == '7'  :
            data['areamin'] = 200
            data['areamax'] = 250
        elif data['area'] == '8'  :
            data['areamin'] = 250
            data['areamax'] = 300               
        elif data['area'] == '9'  :
            data['areamin'] = 350
            data['areamax'] = 500
        elif data['area'] == '10'  :
            data['areamin'] = 500
            data['areamax'] = 1000000
                    
        if data['price'] == '-1'  :
            data['pricemin'] = 0
            data['pricemax'] = 1000000
        elif data['price'] == 'CN'  :
            data['pricemin'] = 0
            data['pricemax'] = 0
        elif data['price'] == '1'  :
            data['pricemin'] = 0
            data['pricemax'] = 0.5
        elif data['price'] == '2'  :
            data['pricemin'] = 0.5
            data['pricemax'] = 0.8               
        elif data['price'] == '3'  :
            data['pricemin'] = 0.8
            data['pricemax'] = 1
        elif data['price'] == '4'  :
            data['pricemin'] = 1
            data['pricemax'] = 2
        elif data['price'] == '5'  :
            data['pricemin'] = 2
            data['pricemax'] = 3
        elif data['price'] == '6'  :
            data['pricemin'] = 3
            data['pricemax'] = 5
        elif data['price'] == '7'  :
            data['pricemin'] = 5
            data['pricemax'] = 7
        elif data['price'] == '8'  :
            data['pricemin'] = 7
            data['pricemax'] = 10
        elif data['price'] == '9'  :
            data['pricemin'] = 10
            data['pricemax'] = 20
        elif data['price'] == '10'  :
            data['pricemin'] = 20
            data['pricemax'] = 30
        elif data['price'] == '11'  :
            data['pricemin'] = 0
            data['pricemax'] = 1000000

        # Chuyen tu id sang ten --city--
        datapostion = json.loads(open('mapcity1.json').read().decode('utf-8-sig'))
        if data['city'] == 'CN':
            data['city'] = ''
            data['district'] = 'CN'
            data['ward'] = 'CN'
            data['street'] = 'CN'
        else:
            for c in datapostion:
                if c['code'] == data['city']:
                    data['city'] = c['name']
                    break
        #print data['city']
        
        if data['district'] == 'CN':
            data['district'] = ''
            data['ward'] = 'CN'
            data['street'] = 'CN'
        else:
            d = c['district']
            for x in d:
                if x['id'] == int(data['district']):
                    data['district'] = x['name']
                    break
        #print data['district'] 

        if data['ward'] == 'CN':
            data['ward'] = ''
        else:
            w = x['ward']
            for wx in w:
                if wx['id'] == int(data['ward']):
                    data['ward'] = wx['name']
                    break

        if data['street'] == 'CN':
            data['street'] = ''
        else:
            s = x['street']
            for sx in s:
                    if sx['id'] == int(data['street']):
                        data['street'] = sx['name']
                        break

        if data['direction'] == 'CN':
            data['direction'] = ''
        elif data['direction'] == 'e':
            data['direction'] = 'Đông'
        elif data['direction'] == 'en':
            data['direction'] = 'Đông Bắc'
        elif data['direction'] == 'es':
            data['direction'] = 'Đông Nam'
        elif data['direction'] == 'w':
            data['direction'] = 'Tây'
        elif data['direction'] == 'wn':
            data['direction'] = 'Tây Bắc'
        elif data['direction'] == 'ws':
            data['direction'] = 'Tây Nam'

        if data['room'] == 'CN':
            data['room'] = ''
#        print data['direction']

        if 'minLat' not in data and 'minLng' not in data:
            data['minLat'] = -1000000
            data['minLng'] = -1000000

        if 'maxLat' not in data and 'maxLng' not in data:
            data['maxLat'] = 1000000
            data['maxLng'] = 1000000

        if data['type'] == 'CN':
            if data['type_action'] == '0':
                realestatenodes = Realestatenode.objects.filter(status=True).filter(tinh__icontains=data['city'], huyen__icontains=data['district'], xa__icontains=data['ward'] , duong__icontains=data['street'], huong__icontains=data['direction']).filter(sophongngu__icontains=data['room']).filter(price__gte=data['pricemin'], price__lte=data['pricemax']).filter(area__gte=data['areamin'], area__lte=data['areamax']).filter(longitude__gte=data['minLng'] ,longitude__lte=data['maxLng'], latitude__gte=data['minLat'] ,latitude__lte=data['maxLat'],timefrom__lte=datetime.datetime.now(), timeto__gte=datetime.datetime.now()).order_by('rank').order_by('-timeto')
            
            elif data['type_action'] == '1' or data['type_action'] == '2':
                realestatenodes = Realestatenode.objects.filter(type__type=int(data['type_action'])-1, status=True).filter(tinh__icontains=data['city'], huyen__icontains=data['district'], xa__icontains=data['ward'] , duong__icontains=data['street'], huong__icontains=data['direction']).filter(sophongngu__icontains=data['room']).filter(price__gte=data['pricemin'], price__lte=data['pricemax']).filter(area__gte=data['areamin'], area__lte=data['areamax']).filter(longitude__gte=data['minLng'] ,longitude__lte=data['maxLng'], latitude__gte=data['minLat'] ,latitude__lte=data['maxLat'],timefrom__lte=datetime.datetime.now(), timeto__gte=datetime.datetime.now()).order_by('rank').order_by('-timeto')

            else:
                return JsonResponse({'node': []})

        else:
            if data['type_action'] == '0':
                realestatenodes = Realestatenode.objects.filter(type=data['type'], status=True).filter(tinh__icontains=data['city'], huyen__icontains=data['district'], xa__icontains=data['ward'] , duong__icontains=data['street'], huong__icontains=data['direction']).filter(sophongngu__icontains=data['room']).filter(price__gte=data['pricemin'], price__lte=data['pricemax']).filter(area__gte=data['areamin'], area__lte=data['areamax']).filter(longitude__gte=data['minLng'] ,longitude__lte=data['maxLng'], latitude__gte=data['minLat'] ,latitude__lte=data['maxLat'], timefrom__lte=datetime.datetime.now(), timeto__gte=datetime.datetime.now()).order_by('rank').order_by('-timeto')
            
            elif data['type_action'] == '1' or data['type_action'] == '2':
                realestatenodes = Realestatenode.objects.filter(type__type=int(data['type_action'])-1, type=data['type'], status=True).filter(tinh__icontains=data['city'], huyen__icontains=data['district'], xa__icontains=data['ward'] , duong__icontains=data['street'], huong__icontains=data['direction']).filter(sophongngu__icontains=data['room']).filter(price__gte=data['pricemin'], price__lte=data['pricemax']).filter(area__gte=data['areamin'], area__lte=data['areamax']).filter(longitude__gte=data['minLng'] ,longitude__lte=data['maxLng'], latitude__gte=data['minLat'] ,latitude__lte=data['maxLat'], timefrom__lte=datetime.datetime.now(), timeto__gte=datetime.datetime.now()).order_by('rank').order_by('-timeto')

            else:
                return JsonResponse({'node': []})

        if realestatenodes:
            serializer = RealestatenodeSerializer(realestatenodes, many=True)
            
            return JsonResponse({'node': serializer.data})
        return JsonResponse({'node': []})

#Tim kiem service co khoanh vung
@api_view(['POST'])
def searchservicebound(request):
    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))

        servicenodes = Servicenode.objects.filter(longitude__gte=data['minLng'] ,longitude__lte=data['maxLng'], latitude__gte=data['minLat'] ,latitude__lte=data['maxLat'])
        
        if servicenodes:
            serializer = RealestatenodeSerializer(servicenodes, many=True)
            return Response(serializer.data)
        return JsonResponse({'message': 'No servicenodes!!!'})


#################TIM KIEM PROJECT
#13.7 Tim du an co ban = input
@api_view(['POST'])
def searchduanbasic(request):
    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))
        
        duans = Duan.objects.filter(name__icontains=data['input'], status=True)
        duan1 = Duan.objects.filter(intro__icontains=data['input'], status=True)

        loaiduan = Loaiduan.objects.filter(name__icontains=data['input']).values('id')
        duan2 = Duan.objects.filter(type_id__in = loaiduan, status=True)

        duan3 = Duan.objects.filter(address__icontains=data['input'], status=True)

        if duans | duan1 | duan2 | duan3:
            serialized=[]
            for obj in duans:
                serialized.append(DuanSerializer(obj).data)

            for obj in duan1:
                if obj not in duans:
                    serialized.append(DuanSerializer(obj).data)

            for obj in duan2:
                if obj not in duans:
                    serialized.append(DuanSerializer(obj).data)

            for obj in duan3:
                if obj not in duan1:
                    serialized.append(DuanSerializer(obj).data)

            return Response(serialized)
        return JsonResponse({'message': 'No duan!!!'})

#13.3 Search node/duan lien quan theo duan
@api_view(['POST'])
def searchduantuongtu(request):
    if request.method == 'POST':
        #duanid
        data=json.loads(json.dumps(request.data))
        duan = Duan.objects.get(id=data['duanid'])
        if not duan:
            return JsonResponse({'message': 'No result!!!'})
        data['duan'] = duan.id
        data['pricefrom'] = duan.pricefrom

        serialized=[]
        realestatenodes = Realestatenode.objects.filter(duanid=data['duan'], timefrom__lte=datetime.datetime.now(), timeto__gte=datetime.datetime.now(), status=True)
        for obj in realestatenodes:
            serialized.append(RealestatenodeSerializer(obj).data)

        total = realestatenodes.count()
        if total < 10:
            x = 10 - total
            duans = Duan.objects.filter(pricefrom__gte=data['pricefrom'], status=True).order_by('pricefrom')[:x]
            for obj in duans:
                serialized.append(DuanSerializer(obj).data)
        return Response(serialized)

#13.6 Search node/duan lien quan theo node
@api_view(['POST'])
def searchnodenangcao(request):
    if request.method == 'POST':
        #nodeid
        data=json.loads(json.dumps(request.data))
        node = Realestatenode.objects.get(id=data['nodeid'], status=True)
        if not node:
            return JsonResponse({'message': 'No result!!!'})

        serialized=[]
        total = 0
        totalto = 0
        ###Truong hop khong thuoc du an nao.
        if node.duanid == 'null' or not node.duanid:
            realestatenodes = Realestatenode.objects.filter((~Q(id=node.id)), timefrom__lte=datetime.datetime.now(), timeto__gte=datetime.datetime.now(),status=True).filter(Q(price=node.price) | Q(pricem2=node.pricem2)).order_by('price').order_by('pricem2')[:10]
            for obj in realestatenodes:
                serialized.append(RealestatenodeSerializer(obj).data)
            total = realestatenodes.count()
            totalto = 1
            if total >= 10:
         #       serialized.thumbs = serialized.thumbs.split(',')
                return Response(serialized)

        ###Truong hop thuoc du an ma so node < 10
        if total == 0 and totalto !=1:  ## node thuoc duan
            realestatenodes = Realestatenode.objects.filter((~Q(id=node.id)), duanid=node.duanid, timefrom__lte=datetime.datetime.now(), timeto__gte=datetime.datetime.now(),status=True).order_by('price').order_by('pricem2')[:10]
            t = realestatenodes.count()
            if t > 0 and t < 10:
                for obj in realestatenodes:
                    serialized.append(RealestatenodeSerializer(obj).data)
                x = 10 -t
                realestatenodes = Realestatenode.objects.filter((~Q(id=node.id)), (~Q(duanid=node.duanid)), tinh__contains=node.tinh, huyen__contains=node.huyen, timefrom__lte=datetime.datetime.now(), timeto__gte=datetime.datetime.now(), status=True).order_by('price').order_by('pricem2')[:x]
                for obj in realestatenodes:
                    serialized.append(RealestatenodeSerializer(obj).data)

            elif t == 0:
                realestatenodes = Realestatenode.objects.filter((~Q(id=node.id)), (~Q(duanid=node.duanid)), tinh__contains=node.tinh, huyen__contains=node.huyen, timefrom__lte=datetime.datetime.now(), timeto__gte=datetime.datetime.now(), status=True).order_by('price').order_by('pricem2')[:10]
                for obj in realestatenodes:
                    serialized.append(RealestatenodeSerializer(obj).data)
        ## node khong thuoc duan nao
        else:
            t = 10 -total
            realestatenodes = Realestatenode.objects.filter(tinh__contains=node.tinh, huyen__contains=node.huyen, timefrom__lte=datetime.datetime.now(), timeto__gte=datetime.datetime.now(), status=True).order_by('price').order_by('pricem2')[:t]
            for obj in realestatenodes:
                serialized.append(RealestatenodeSerializer(obj).data)
        #serialized.thumbs = serialized.thumbs.split(',')
        return Response(serialized)

##### Tim kiem theo du an
def calcudistance(lat1, lon1, lat2, lon2):
    lon1, lat1, lon2, lat2 = map(radians, [lon1, lat1, lon2, lat2])
    dlon = lon2 - lon1
    dlat = lat2 - lat1
    a = sin(dlat/2)**2 + cos(lat1) * cos(lat2) * sin(dlon/2)**2
    c = 2 * asin(sqrt(a)) 
    r = 6371 # Radius of earth in kilometers. Use 3956 for miles
    
    return c * r

#13. List sales theo duan
@api_view(['POST'])
def nodeinduan(request):
    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))

        realestatenodes = Realestatenode.objects.filter(duanid=data['duan'], typenode=True, timefrom__lte=datetime.datetime.now(), timeto__gte=datetime.datetime.now(), status=True).order_by('-rank').order_by('-timeto').order_by('-vip')
        if realestatenodes:
            serializer = RealestatenodeSerializer(realestatenodes, many=True)
            return JsonResponse({'data': serializer.data})
        return JsonResponse({'data': []})

#15. Tien do du an
@api_view(['POST'])
def getTiendoduanbyID(request):
    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))
        duan_id = data['duan']
        tiendos = Tiendo.objects.filter(duanid=duan_id).order_by('time')
        if tiendos:
            serializer = TiendoSerializer(tiendos, many=True)
            return JsonResponse({'data': serializer.data})
        return JsonResponse({'data': []})

#17. Phan hoi ve cho mappy
@api_view(['POST'])
def guiphanhoi(request):
    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))
        data['time'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        serializer = PhanhoiSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'data': serializer.data})
        else:
            return JsonResponse({'data': []})

"""
#10.1 Xac dinh bound cho tinh,tp thuoc trung uoong
@api_view(['POST'])
def bound_province(request):
    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))

        i = indexdpro(data['province'])

        root = ET.parse("VNM_adm1.kml", parser=ET.XMLParser(encoding='utf-8') )
        root = root.find('.//{http://earth.google.com/kml/2.2}Document')
        root = root.findall('.//{http://earth.google.com/kml/2.2}Placemark')
        for con in root:
            style = con.find('.//{http://earth.google.com/kml/2.2}styleUrl')
            if style.text == '#'+str(i):
                con = con.find('.//{http://earth.google.com/kml/2.2}MultiGeometry')
                con = con.findall('.//{http://earth.google.com/kml/2.2}Polygon')
                distric = []
                for con in con:
                    con = con.find('.//{http://earth.google.com/kml/2.2}outerBoundaryIs')
                    con = con.find('.//{http://earth.google.com/kml/2.2}LinearRing')
                    con = con.find('.//{http://earth.google.com/kml/2.2}coordinates')
                    a = {'outerBoundaryIs': con.text}
                    distric.append(a)
                return JsonResponse({'message': distric})
        return JsonResponse({'message': 'None result!!!'})
"""