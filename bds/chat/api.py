from __future__ import unicode_literals

from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet
from django.http import JsonResponse
from django.conf import settings
from django.utils import timezone
import uuid, datetime
import requests
import rest_framework_jwt
import json
from logins import views
from companies.models import Admin, User, Mod, Typerealestate, Realestatenode, Loaiduan, Duan, Typeservice, Servicenode, Groupnode, Phancong, Duanquantam, Tiendo, History, Thongbaouser, Coin, Message, Messagenode
from companies.serializers import AdminSerializer, UserSerializer, ModSerializer, TyperealestateSerializer, RealestatenodeSerializer, LoaiduanSerializer, DuanSerializer, TypeserviceSerializer, ServicenodeSerializer, GroupnodeSerializer, PhancongSerializer, DuanquantamSerializer, TiendoSerializer, HistorySerializer, ThongbaouserSerializer, CoinSerializer, MessageSerializer, MessagenodeSerializer

class MessageModelViewSet(ModelViewSet):

	queryset = Message.objects.all()
	serializer_class = MessageSerializer
	allowed_methods = ('GET', 'POST', 'HEAD', 'OPTIONS')

	def list(self, request, current_user, *args, **kwargs):
		
		self.queryset = self.queryset.filter(Q(recipient=current_user) | Q(user=current_user))
		target = self.request.query_params.get('target', None)
		if target is not None:
			self.queryset = self.queryset.filter(Q(recipient=request.user, user__username=target) | Q(recipient__username=target, user=request.user))
		return super(MessageModelViewSet, self).list(current_user, *args, **kwargs)

	def retrieve(self, request, *args, **kwargs):
		msg = get_object_or_404(self.queryset.filter(Q(recipient=request.user) | Q(user=request.user), Q(pk=kwargs['pk'])))
		serializer = self.get_serializer(msg)
		if msg:
			return JsonResponse({'data': serializer.data, 'status': 'success'})
		else:
			return JsonResponse({'data': serializer.data, 'status': 'error'})