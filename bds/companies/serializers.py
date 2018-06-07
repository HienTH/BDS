from __future__ import unicode_literals
from rest_framework import serializers
from django.db import models
from .models import Admin, User, Mod ,Typerealestate, Realestatenode, Loaiduan, Duan, Typeservice, Servicenode, Groupnode, History, Tiendo, Phancong, Duanquantam, Phanhoi, Thongbao, Thongbaouser, Coin, Message, Messagenode

class AdminSerializer(serializers.ModelSerializer):

	class Meta:
		model = Admin
		fields = '__all__'

class UserSerializer(serializers.ModelSerializer):

	class Meta:
		model = User
		fields = '__all__'

class ModSerializer(serializers.ModelSerializer):

	class Meta:
		model = Mod
		fields = '__all__'

class TyperealestateSerializer(serializers.ModelSerializer):

	class Meta:
		model = Typerealestate
		fields = '__all__'

class LoaiduanSerializer(serializers.ModelSerializer):

	class Meta:
		model = Loaiduan
		fields = '__all__'

class DuanSerializer(serializers.ModelSerializer):

	class Meta:
		model = Duan
		fields = '__all__'

class TypeserviceSerializer(serializers.ModelSerializer):

	class Meta:
		model = Typeservice
		fields = '__all__'

class ServicenodeSerializer(serializers.ModelSerializer):

	class Meta:
		model = Servicenode
		fields = '__all__'

class GroupnodeSerializer(serializers.ModelSerializer):

	class Meta:
		model = Groupnode
		fields = '__all__'

class RealestatenodeSerializer(serializers.ModelSerializer):

	class Meta:
		model = Realestatenode
		fields = '__all__'

class HistorySerializer(serializers.ModelSerializer):

	class Meta:
		model = History
		fields = '__all__'

class TiendoSerializer(serializers.ModelSerializer):

	class Meta:
		model = Tiendo
		fields = '__all__'

class PhancongSerializer(serializers.ModelSerializer):

	class Meta:
		model = Phancong
		fields = '__all__'

class DuanquantamSerializer(serializers.ModelSerializer):

	class Meta:
		model = Duanquantam
		fields = '__all__'

class PhanhoiSerializer(serializers.ModelSerializer):

	class Meta:
		model = Phanhoi
		fields = '__all__'

class ThongbaoSerializer(serializers.ModelSerializer):

	class Meta:
		model = Thongbao
		fields = '__all__'

class ThongbaouserSerializer(serializers.ModelSerializer):

	class Meta:
		model = Thongbaouser
		fields = '__all__'

class CoinSerializer(serializers.ModelSerializer):

	class Meta:
		model = Coin
		fields = '__all__'

class  MessageSerializer(serializers.ModelSerializer):

	class Meta:
		model = Message
		fields = '__all__'

class MessagenodeSerializer(serializers.ModelSerializer):
	
	class Meta:
		model = Messagenode
		fields = '__all__'


'''
	def create(self, validated_data):
		user = self.context['request'].user
		recipient = get_object_or_404(User, username=validated_data['recipient']['username'])
		msg = MessageModel(recipient=recipient, details=validated_data['body'], user=user)
		msg.save()
		return msg
'''
