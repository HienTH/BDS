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
		value = serializer.data

		strmess = "var chatbox_messages = '"
		strend = "';"

		for i in value:
			try:
				target = User.objects.get(id=i['recipient'])
			except:
				return JsonResponse({"data": "Dữ liệu không hợp lệ", 'status': 'error'})

			date = i['datetime'][0:10]
			datetime = i['datetime'][0:19]
			datetime=datetime.replace(datetime[10]," ")

			if i['user'] == current_user.id:
				strp = "<p class=\"chatbox_row_1 clearfix\"> <span class=\" user-msg me\"><span class=\"user\"><a href=\"/%s\" onclick=\"return copy_user_name(\'%s" % (current_user.avatar, current_user.username)
				s = "\');\" target=\"_blank\"><span class=\"user-txt hidden\">%s</span><img class=\"user-avt\" src=\"%s\"/></a> </span><span class=\"msg\"><span style=\"color: #eeeeee\">%s</span></span> <span class=\"date-and-time me\" title=\"%s\">[%s]</span> </span></p>" % (current_user.name, target.avatar, i['details'], date, datetime)
				strp = strp + s
			else:
				strp = "<p class=\"chatbox_row_1 clearfix\"> <span class=\" user-msg\"><span class=\"user\"><a href=\"/%s\" onclick=\"return copy_user_name(\'%s" % (current_user.avatar, current_user.username)
				s = "\');\" target=\"_blank\"><span class=\"user-txt hidden\">%s</span><img class=\"user-avt\" src=\"%s\"/></a> </span><span class=\"msg\"><span style=\"color: #eeeeee\">%s</span></span> <span class=\"date-and-time\" title=\"%s\">[%s]</span> </span></p>" % (current_user.name, target.avatar, i['details'], date, datetime)
				strp = strp + s

			strmess = strmess + strp

		strall = strmess + strend
		return JsonResponse({"data": strall, "status": "success"})

@api_view(['POST'])
@views.token_required_user
def send(request, current_user):
	if request.method == 'POST':
		data=json.loads(json.dumps(request.data))

		if current_user.id == data['to_id']:
				return JsonResponse({"message": "Dữ liệu không hợp lệ", "status": "error"})

		k = 0
		try:
			nodeid = Realestatenode.objects.get(id=data['node_id'], status=True)
		except:
			return JsonResponse({"message": "Dữ liệu không hợp lệ", "status": "error"})

		#kiem tra xem co tao converid hay khong
		try:
			conver = Messagenode.objects.get(node=data['node_id'], user=data['to_id'])
		except:

			if nodeid.userid.id == data['to_id']:
				return JsonResponse({"message": "Dữ liệu không hợp lệ", "status": "error"})

			dataconver = {}
			dataconver['node'] = data['node_id']
			dataconver['user'] = data['to_id']

			serializer = MessagenodeSerializer(data=dataconver)
			if serializer.is_valid():
				serializer.save()
				conver = serializer.data
				k = 1
			else:
				return JsonResponse({"message": "Dữ liệu không hợp lệ", "status": "error"})

		data['user'] = current_user.id
		data['datetime'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
		if k == 0:
			data['converid'] = conver.id
		if k == 1:
			data['converid'] = conver['id']

		data['recipient'] = data['to_id']
		data['details'] = data['sent']


		serializer = MessageSerializer(data=data)
		if serializer.is_valid():
			serializer.save()
			return JsonResponse({"status": "success"})

		return JsonResponse({"message": "Dữ liệu không hợp lệ", "status": "error"})

@api_view(['GET'])
@views.token_required_user
def getMessageById(request, current_user, message_id):
	if request.META['REQUEST_METHOD'] == 'GET':
		try:
			message = Message.objects.get(Q(id=message_id), (Q(recipient=current_user.id) | Q(user=current_user.id)))
		except:
			return JsonResponse({"message": "Dữ liệu không hợp lệ", "status": "error"})

		serializer = MessageSerializer(message)
		return JsonResponse({'data': serializer.data, 'status': 'success'})