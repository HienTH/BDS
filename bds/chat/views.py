# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.http import JsonResponse
from django.views.decorators.http import require_POST
from werkzeug.security import generate_password_hash, check_password_hash
from django.contrib.auth import authenticate
from django.conf import settings
from django.utils import timezone
from django.db.models import Q
import uuid, datetime
import requests
import rest_framework_jwt
from companies.models import Admin, User, Mod, Typerealestate, Realestatenode, Loaiduan, Duan, Typeservice, Servicenode, Groupnode, Phancong, Duanquantam, Tiendo, History, Thongbaouser, Coin, Message, Messagenode
from companies.serializers import AdminSerializer, UserSerializer, ModSerializer, TyperealestateSerializer, RealestatenodeSerializer, LoaiduanSerializer, DuanSerializer, TypeserviceSerializer, ServicenodeSerializer, GroupnodeSerializer, PhancongSerializer, DuanquantamSerializer, TiendoSerializer, HistorySerializer, ThongbaouserSerializer, CoinSerializer, MessageSerializer, MessagenodeSerializer
import json
import csv
import re
import os
import random
from logins import views

# Create your views here.
@api_view(['GET'])
@views.token_required_user
def list(request, current_user):
	if request.META['REQUEST_METHOD'] == 'GET':
		message = Message.objects.filter(Q(user=current_user.id) | Q(recipient=current_user.id))
		serializer = MessageSerializer(message, many=True)
		return JsonResponse({"data": serializer.data, "status": "success"})

@api_view(['POST'])
@views.token_required_user
def send(request, current_user):
	if request.method == 'POST':
		data=json.loads(json.dumps(request.data))
		data['user'] = current_user.id
		data['datetime'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
		serializer = MessageSerializer(data=data)
		if serializer.is_valid():
			serializer.save()
			return JsonResponse({"status": "success"})

		return JsonResponse({"message": "Du lieu khong hop le", "status": "error"})

@api_view(['GET'])
@views.token_required_user
def getMessageById(request, current_user, message_id):
	if request.META['REQUEST_METHOD'] == 'GET':
		try:
			message = Message.objects.get(Q(id=message_id), (Q(recipient=current_user.id) | Q(user=current_user.id)))
		except:
			return JsonResponse({"message": "Du lieu khong hop le", "status": "error"})

		serializer = MessageSerializer(message)
		return JsonResponse({'data': serializer.data, 'status': 'success'})



