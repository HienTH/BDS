# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.decorators import parser_classes
from django.core.files.storage import default_storage
from django.http import JsonResponse
from django.views.decorators.http import require_POST
from werkzeug.security import generate_password_hash, check_password_hash
from django.contrib.auth import authenticate
from django.conf import settings
from django.utils import timezone
import uuid, datetime
import requests
from functools import wraps
import rest_framework_jwt
from companies.models import Admin, User, Mod, Typerealestate, Realestatenode, Loaiduan, Duan, Typeservice, Servicenode, Groupnode, Phancong, Duanquantam, Tiendo, History, Thongbaouser, Coin, Message, Messagenode
from companies.serializers import AdminSerializer, UserSerializer, ModSerializer, TyperealestateSerializer, RealestatenodeSerializer, LoaiduanSerializer, DuanSerializer, TypeserviceSerializer, ServicenodeSerializer, GroupnodeSerializer, PhancongSerializer, DuanquantamSerializer, TiendoSerializer, HistorySerializer, ThongbaouserSerializer, CoinSerializer, MessageSerializer, MessagenodeSerializer
import json
import csv
import re
import os
import random
from logins import views

#1.Xem USER
@api_view(['GET'])
@views.token_required_user
def info(request, current_user):
    if request.META['REQUEST_METHOD'] == 'GET':
        current_user.password = ''
        serializer = UserSerializer(current_user)
        result = serializer.data
        return Response(result)

#2. Doi thong tin ca nhan
@api_view(['PUT'])
@views.token_required_user
def edit_user(request, current_user):
    if request.method == 'PUT':
        data=json.loads(json.dumps(request.data))
        data['id'] = current_user.id
        data['name'] = current_user.name
        data['username'] = current_user.username
        data['email'] = current_user.email
        data['password'] = current_user.password
        data['rank'] = current_user.rank
        data['status'] = current_user.status
        data['coin'] = current_user.coin
        data['avatar'] = current_user.avatar
        
        serializer = UserSerializer(current_user, data=data)
        if serializer.is_valid():
            serializer.save()
            serializer.data['password'] = ''
            return JsonResponse({'data': serializer.data})
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#2.2. Doi avatar
@api_view(['POST'])
@views.token_required_user
@require_POST
def edit_avataruser(request, current_user):
    if request.method == 'POST':
        if not request.FILES:
            return JsonResponse({'data': 'Không có dữ liệu','status': 'error'})

        matches = re.search('\w+\.(jpg|gif|png|jpeg)',request.FILES['avatar'].name)
        if not matches:
            return JsonResponse({'data': 'Không đúng định dạng ảnh', 'status': 'error'})
        Y = str(datetime.datetime.now().year)
        m = str(datetime.datetime.now().month)
        d = str(datetime.datetime.now().day)
        
        name = request.FILES['avatar'].name.split('.')
        request.FILES['avatar'].name = current_user.id + '.' + name[len(name)-1]
        save_path = os.path.join(settings.MEDIA_ROOT, 'profile/'+current_user.id+'/'+Y+'/'+m+'/'+d+'/', request.FILES['avatar'].name)
#        if default_storage.exists(save_path):
#                default_storage.delete(save_path)
        path = default_storage.save(save_path, request.FILES['avatar'])
 
        data={}
        data['id'] = current_user.id
        data['username'] = current_user.username
        data['password'] = current_user.password
        data['name'] = current_user.name
        data['email'] = current_user.email
        data['phone'] = current_user.phone
        data['address'] = current_user.address
        data['company'] = current_user.company
        data['sex'] = current_user.sex
        data['birthday'] = current_user.birthday
        data['coin'] = current_user.coin
        data['status'] = current_user.status
        data['rank'] = current_user.rank
        data['details'] = current_user.details
        data['avatar'] = 'https://www.mappy.com.vn/media/profile/'+current_user.id+'/'+Y+'/'+m+'/'+d+'/' + path.split('/')[10]
        data['social'] = current_user.social

        serializer = UserSerializer(current_user, data=data)
        if serializer.is_valid():
            serializer.save()
            serializer.data['password'] = ''
            return JsonResponse({'data': data['avatar'], 'status': 'success'})
        else:
            return JsonResponse({'data': 'Lỗi hệ thống! Vui lòng liên hệ với quản trị viên để được hỗ trợ sớm nhất!', 'status': 'error'})

#2.5 Refresh token
@api_view(['POST'])
@views.token_required_user
def refresh_token(request, current_user):
    if request.method == 'POST':
        uid = str(uuid.uuid4())
        token = rest_framework_jwt.utils.jwt_encode_handler({'id': current_user.id, 'exp': datetime.datetime.now() + datetime.timedelta(minutes=180), 'jti': uid})
        if token:
            return JsonResponse({'data': token.decode('UTF-8')})
        return JsonResponse({'data': 'error'})

#3.Xem Node da dang
#cho duyet
@api_view(['GET'])
@views.token_required_user
def list_nodewait(request, current_user):
    if request.META['REQUEST_METHOD'] == 'GET':
        realestatenodes = Realestatenode.objects.filter(userid = current_user.id, status=False, typenode=True).order_by('timecreate')
        if realestatenodes:
            serializer = RealestatenodeSerializer(realestatenodes, many=True)
            return JsonResponse({'data': serializer.data, 'status': 'success'})
        return JsonResponse({'data': [], 'status': 'success'})

#het han
@api_view(['GET'])
@views.token_required_user
def list_nodefalse(request, current_user):
    if request.META['REQUEST_METHOD'] == 'GET':
        realestatenodes = Realestatenode.objects.filter(userid = current_user.id, status=True, timefrom__gte=datetime.datetime.now(), typenode=True).order_by('timecreate')
        serialized=[]
        if realestatenodes:
            serializer = RealestatenodeSerializer(realestatenodes, many=True)
            serializer = serializer.data
            for s in serializer:
                serialized.append(s)

        realestates = Realestatenode.objects.filter(userid = current_user.id, status=True, timeto__lte=datetime.datetime.now(), typenode=True).order_by('timecreate')
        if realestates:
            serializer = RealestatenodeSerializer(realestates, many=True)
            serializer = serializer.data
            for s in serializer:
                serialized.append(s)

        return JsonResponse({'data': serialized, 'status': 'success'})

def phanchiamod(province, district):
    phancongs = Phancong.objects.filter(province=province)
    for phancong in phancongs:
        list_district = phancong.district.split(',')
        if district in list_district:
            return phancong.modname
    return '16B651'

def phanchiamodduan(duanid, province, district):
    duan = Duan.objects.get(id=duanid)
    modname = duan.modname
    return modname

#Up load anh thumbnail
@api_view(['POST'])
@views.token_required_user
def upload_thumbnail(request, current_user):
    if request.method == 'POST':
        if 'thumbnail' in request.FILES:
            Y = str(datetime.datetime.now().year)
            m = str(datetime.datetime.now().month)
            d = str(datetime.datetime.now().day)
            if request.FILES['thumbnail'].size > 51200000:
                return JsonResponse({'data': 'Sai kích cỡ', 'status': 'error'})

            matches = re.search('\w+\.(jpg|gif|png|jpeg)',request.FILES['thumbnail'].name)
            if not matches:
                return JsonResponse({'data': 'Không đúng định dạng ảnh', 'status': 'error'})

            namethumbnail = request.FILES['thumbnail'].name.split('.')
            request.FILES['thumbnail'].name = current_user.id + '.' + namethumbnail[len(namethumbnail)-1]

            save_path = os.path.join(settings.MEDIA_ROOT, 'thumbnail/'+current_user.id+'/'+Y+'/'+m+'/'+d+'/', request.FILES['thumbnail'].name)

            path = default_storage.save(save_path, request.FILES['thumbnail'])

            url_thumbnail ='https://www.mappy.com.vn/media/thumbnail/'+current_user.id+'/'+Y+'/'+m+'/'+d+'/' + path.split('/')[11]
            
            return JsonResponse({'data': url_thumbnail, 'status': 'success'})
        return JsonResponse({'data': 'Lỗi hệ thống! Vui lòng liên hệ với quản trị viên để được hỗ trợ sớm nhất!', 'status': 'error'})

#Up load anh panorama
@api_view(['POST'])
@views.token_required_user
def upload_panorama(request, current_user):
    if request.method == 'POST':
        if request.FILES['panorama']:
            Y = str(datetime.datetime.now().year)
            m = str(datetime.datetime.now().month)
            d = str(datetime.datetime.now().day)
            matches = re.search('\w+\.(jpg|gif|png|jpeg)',request.FILES['panorama'].name)
            if not matches:
                return JsonResponse({'data': 'Không đúng định dạng ảnh', 'status': 'error'})

            namepanorama = request.FILES['panorama'].name.split('.')
            request.FILES['panorama'].name = current_user.id + '.' + namepanorama[len(namepanorama)-1]

            save_path = os.path.join(settings.MEDIA_ROOT, 'panorama/'+current_user.id+'/'+Y+'/'+m+'/'+d+'/', request.FILES['panorama'].name)
            path = default_storage.save(save_path, request.FILES['panorama'])

            url_panorama ='https://www.mappy.com.vn/media/panorama/'+current_user.id+'/'+Y+'/'+m+'/'+d+'/' + request.FILES['panorama'].name
            return JsonResponse({'data': url_panorama, 'status': 'success'})
        return JsonResponse({'data': 'Lỗi hệ thống! Vui lòng liên hệ với quản trị viên để được hỗ trợ sớm nhất!','status': 'error'})

#Up load anh 360
@api_view(['POST'])
@views.token_required_user
def upload_anh360(request, current_user):
    if request.method == 'POST':
        if request.FILES['anh_360']:
            Y = str(datetime.datetime.now().year)
            m = str(datetime.datetime.now().month)
            d = str(datetime.datetime.now().day)

            matches = re.search('\w+\.(jpg|gif|png|jpeg)',request.FILES['anh_360'].name)
            if not matches:
                return JsonResponse({'data': 'Không đúng định dạng ảnh', 'status': 'error'})

            nameanh360 = request.FILES['anh_360'].name.split('.')
            request.FILES['anh_360'].name = current_user.id + '.' + nameanh360[len(nameanh360)-1]

            save_path = os.path.join(settings.MEDIA_ROOT, 'anh360/'+current_user.id+'/'+Y+'/'+m+'/'+d+'/', request.FILES['anh_360'].name)
            path = default_storage.save(save_path, request.FILES['anh_360'])

            url_anh360 ='https://www.mappy.com.vn/media/anh360/'+current_user.id+'/'+Y+'/'+m+'/'+d+'/' + request.FILES['anh_360'].name
            return JsonResponse({'data': url_anh360, 'status': 'success'})
        return JsonResponse({'data': 'Lỗi hệ thống! Vui lòng liên hệ với quản trị viên để được hỗ trợ sớm nhất!', 'status': 'error'})

#Up load video
@api_view(['POST'])
@views.token_required_user
def upload_video(request, current_user):
    if request.method == 'POST':
        if request.FILES['video']:
            Y = str(datetime.datetime.now().year)
            m = str(datetime.datetime.now().month)
            d = str(datetime.datetime.now().day)

            matchesvideo = re.search('\w+\.(mp4|mkv)',request.FILES['video'].name)
            if not matchesvideo:
                return JsonResponse({'data': 'Không đúng định dạng video', 'status': 'error'})

            namevideo = request.FILES['video'].name.split('.')
            request.FILES['video'].name = current_user.id + '.' + namevideo[len(namevideo)-1]

            save_path = os.path.join(settings.MEDIA_ROOT, 'video/'+current_user.id+'/'+Y+'/'+m+'/'+d+'/', request.FILES['video'].name)
            path = default_storage.save(save_path, request.FILES['video'])

            url_video ='https://www.mappy.com.vn/media/video/'+current_user.id+'/'+Y+'/'+m+'/'+d+'/' + request.FILES['video'].name
            return JsonResponse({'data': url_video, 'status': 'success'})
        return JsonResponse({'data': 'Lỗi hệ thống! Vui lòng liên hệ với quản trị viên để được hỗ trợ sớm nhất!', 'status': 'error'})

def indexd(distric, province):
    #read csv, and split on "," the line
    csv_file = csv.reader(open('VNM_adm2.csv', "rb"), delimiter=str(u','))
    for row in csv_file:
        if row[11] == str(distric) and row[5] == str(province):
            return str(row[6])

def indexdpro(province):
    #read csv, and split on "," the line
    csv_file = csv.reader(open('VNM_adm2.csv', "rb"), delimiter=str(u','))
    for row in csv_file:
        if row[5] == province:
            return str(row[4])

#con han
@api_view(['GET', 'POST'])
@views.token_required_user
def list_node(request, current_user):
    if request.META['REQUEST_METHOD'] == 'GET':
        realestatenodes = Realestatenode.objects.filter(userid = current_user.id, status=True, timefrom__lte=datetime.datetime.now(), timeto__gte=datetime.datetime.now(), typenode=True).order_by('timecreate')
        if realestatenodes:
            serializer = RealestatenodeSerializer(realestatenodes, many=True)
            return JsonResponse({'data': serializer.data, 'status': 'success'})
        return JsonResponse({'data': [], 'status': 'success'})

    # Dang bai moi
    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))

        #sinh id
        list_id = Realestatenode.objects.all().values_list('id', flat=True)
        data['id'] = str(uuid.uuid4().get_hex().upper()[0:20])
        while data['id'] in list_id:
            data['id'] = str(uuid.uuid4().get_hex().upper()[0:20])

    	data['userid'] = current_user.id
    	data['status'] = False
        data['rank'] = 0
        data['timecreate'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        data['timemodify'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        #Kiem tra timefrom va timeto.
        timef = datetime.datetime.strptime(data['timefrom'], '%Y-%m-%d %H:%M:%S')
        timet = datetime.datetime.strptime(data['timeto'], '%Y-%m-%d %H:%M:%S')
        if ((timet - datetime.datetime.now()).days <= 0) or ((timet - timef).days <= 0):
            return JsonResponse({'data': 'Thời gian sai', 'status': 'error'})

        #kiem tra coin
        coin = Coin.objects.get(vip=data['vip'])
        realcoins = coin.coin * (timet - timef).days
        if current_user.coin < realcoins:
            return JsonResponse({'data': 'Không đủ coin', 'status': 'error'})

        #Phan chia khu vuc cho mod
        duanid = ''
        if data['duanid'] != '':
            duanid = Duan.objects.get(id=data['duanid'])
        if duanid != '': #node thuoc duan
            list_duanid = Duan.objects.filter(status=True).values_list('id', flat=True)
            if duanid.id not in list_duanid:
                return JsonResponse({'data': 'Lỗi hệ thống! Vui lòng liên hệ với quản trị viên để được hỗ trợ sớm nhất!', 'status': 'error'})

            data['rongtien']= 0
            data['rongduong']= 0
            data['latitude'] = duanid.latitude
            data['longitude'] = duanid.longitude

            data['modid'] = str(phanchiamodduan(duanid.id, duanid.tinh, duanid.huyen))
        else:#node rieng
            data['modid'] = '16B651'
            #data['modid'] = str(phanchiamod(indexdpro(data['tinh']),indexd(data['tinh'], data['huyen'])))
            #if data['modid'] == "":
            #    return JsonResponse({'data': 'Lỗi hệ thống! Vui lòng liên hệ với quản trị viên để được hỗ trợ sớm nhất!', 'status': 'error'})
        
        serializer = RealestatenodeSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'status': 'success'})
        else:
            return JsonResponse({'data': 'Lỗi hệ thống! Vui lòng liên hệ với quản trị viên để được hỗ trợ sớm nhất!', 'status': 'error'})
    else:
        return JsonResponse({'data': 'Lỗi hệ thống! Vui lòng liên hệ với quản trị viên để được hỗ trợ sớm nhất!', 'status': 'error'})

#Dang bai tim kiem
@api_view(['POST'])
@views.token_required_user
def dangbaitimkiem(request, current_user):
    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))

        #sinh id
        list_id = Realestatenode.objects.all().values_list('id', flat=True)
        data['id'] = str(uuid.uuid4().get_hex().upper()[0:20])
        while data['id'] in list_id:
            data['id'] = str(uuid.uuid4().get_hex().upper()[0:20])

        data['typenode'] = True
        data['latitude'] = 0
        data['longitude'] = 0
        data['userid'] = current_user.id

        data['status'] = False
        data['rank'] = 0
        data['vip'] = 0
        data['modname'] = ''
        data['modid'] = ''

        data['timecreate'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        data['timemodify'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        data['timefrom'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        data['timeto'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        data['tenlienhe'] = current_user.name
        data['diachi'] = current_user.address
        data['dienthoai'] = current_user.phone
        data['email'] = current_user.email

        data['thumbs'] = ''
        data['video'] = ''
        data['anh360'] = ''
        data['panorama_image'] = ''
        
        serializer = RealestatenodeSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'status': 'success'})
        else:
            return JsonResponse({'data': serializer.errors, 'status': 'error'})
    else:
        return JsonResponse({'data': 'Lỗi hệ thống! Vui lòng liên hệ với quản trị viên để được hỗ trợ sớm nhất!', 'status': 'error'})

#Dang bai tim kiem
@api_view(['GET'])
@views.token_required_user
def danhsachtimkiem(request, current_user):
    if request.method == 'GET':
        data=json.loads(json.dumps(request.data))
        nodes = Realestatenode.objects.filter(status=True, typenode=False, userid=current_user.id).order_by('-timecreate')
        serializer = RealestatenodeSerializer(nodes, many=True)
        return JsonResponse({'data': serializer.data, 'status': 'success'})

#3.5 Dang lai bai cu cua minh
@api_view(['POST'])
@views.token_required_user
def postagain(request, current_user, node_id):
    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))
        realestatenode = Realestatenode.objects.get(id=node_id, userid=current_user.id)
        if not realestatenode:
            return JsonResponse({'data': []})

        #Tinh gia data['vip']
        coin = Coin.objects.get(vip=data['vip'])

        timef = datetime.datetime.strptime(data['timefrom'], '%Y-%m-%d %H:%M:%S')
        timet = datetime.datetime.strptime(data['timeto'], '%Y-%m-%d %H:%M:%S')

        if (timet - timef).days <= 0 or (timet - realestatenode.timeto).days <= 0:
            return JsonResponse({'data':'Sai thoi gian'})

        if (timef - realestatenode.timeto).days > 0:
            realcoins = coin.coin * (timet - timef).days
        else:
            realcoins = coin.coin * (timet - realestatenode.timeto).days

        if current_user.coin < realcoins:
            return JsonResponse({'data': 'Khong du coin'})

        data['id'] = realestatenode.id
        data['title'] = realestatenode.title
        data['latitude'] = realestatenode.latitude
        data['longitude'] = realestatenode.longitude
        data['price'] = realestatenode.price
        data['pricem2'] = realestatenode.pricem2
        data['area'] = realestatenode.area
        data['tinh'] = realestatenode.tinh
        data['huyen'] = realestatenode.huyen
        data['xa'] = realestatenode.xa
        data['duong'] = realestatenode.duong
        data['details_address'] = realestatenode.details_address
        data['address'] = realestatenode.address
        data['huong'] = realestatenode.huong
        data['sophongngu'] = realestatenode.sophongngu
        data['tang'] = realestatenode.tang
        data['sotang'] = realestatenode.sotang
        data['rongtien'] = realestatenode.rongtien
        data['rongduong'] = realestatenode.rongduong
        data['details'] = realestatenode.details
        data['status'] = realestatenode.status
        data['thumbs'] = realestatenode.thumbs
        data['anh360'] = realestatenode.anh360
        data['panorama_image'] = realestatenode.panorama_image
        data['video'] = realestatenode.video
        data['tenduan'] = realestatenode.tenduan
        data['tenlienhe'] = realestatenode.tenlienhe
        data['diachi'] = realestatenode.diachi
        data['dienthoai'] = realestatenode.dienthoai
        data['email'] = realestatenode.email
        data['rank'] = realestatenode.rank
        data['typenode'] = realestatenode.typenode
        data['modname'] = realestatenode.modname
        data['timecreate'] = realestatenode.timecreate
        data['timemodify'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        data['duanid'] = realestatenode.duanid
        data['modid'] = realestatenode.modid
        data['type'] = realestatenode.type
        data['userid'] = realestatenode.userid

        serializer = RealestatenodeSerializer(realestatenode, data=data)
        if serializer.is_valid():
            serializer.save()
            data={}
            data['id'] = current_user.id
            data['username'] = current_user.username
            data['password'] = current_user.password
            data['name'] = current_user.name
            data['email'] = current_user.email
            data['phone'] = current_user.phone
            data['address'] = current_user.address
            data['company'] = current_user.company
            data['details'] = current_user.details
            data['sex'] = current_user.sex
            data['birthday'] = current_user.birthday
            data['coin'] = int(current_user.coin) - realcoins
            data['avatar'] = current_user.avatar
            data['status'] = current_user.status
            data['rank'] = current_user.rank
            data['social'] = current_user.social
            serializer = UserSerializer(current_user, data=data)
            if serializer.is_valid():
                serializer.save()
                return JsonResponse({'data': 'OK'})
        return JsonResponse({'data': 'error'})

#4. Sua Node cua minh
@api_view(['PUT'])
@views.token_required_user
def detail_node(request, current_user, node_id):
    try:
        realestatenode = Realestatenode.objects.get(id=node_id, userid=current_user.id)
    except:
        return JsonResponse({'data': 'Không tìm thấy bài đăng','status': 'error'})

    if request.method == 'PUT':
        data=json.loads(json.dumps(request.data))
        data['id'] = node_id
        data['title'] = realestatenode.title
        data['latitude'] = realestatenode.latitude
        data['longitude'] = realestatenode.longitude
        data['area'] = realestatenode.area
        data['tinh'] = realestatenode.tinh
        data['huyen'] = realestatenode.huyen
        data['xa'] = realestatenode.xa
        data['duong'] = realestatenode.duong
        data['details_address'] = realestatenode.details_address
        data['address'] = realestatenode.address
        data['huong'] = realestatenode.huong
        data['sophongngu'] = realestatenode.sophongngu
        data['tang'] = realestatenode.tang
        data['sotang'] = realestatenode.sotang
        data['rongtien'] = realestatenode.rongtien
        data['rongduong'] = realestatenode.rongduong
        data['status'] = realestatenode.status
        data['tenduan'] = realestatenode.tenduan
        data['tenlienhe'] = realestatenode.tenlienhe
        data['diachi'] = realestatenode.diachi
        data['dienthoai'] = realestatenode.dienthoai
        data['email'] = realestatenode.email
        data['rank'] = realestatenode.rank
        data['timefrom'] = realestatenode.timefrom
        data['timeto'] = realestatenode.timeto
        data['typenode'] = realestatenode.typenode
        data['vip'] = realestatenode.vip
        data['modname'] = realestatenode.modname
        data['timecreate'] = realestatenode.timecreate
        data['timemodify'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        data['duanid'] = realestatenode.duanid
        data['modid'] = realestatenode.modid
        data['type'] = realestatenode.type
        data['userid'] = realestatenode.userid

        serializer = RealestatenodeSerializer(realestatenode, data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'data': serializer.data, 'status': 'success'})
        else:
            return JsonResponse({'data': 'Lỗi hệ thống! Vui lòng liên hệ với quản trị viên để được hỗ trợ sớm nhất!', 'status': 'error'})

#4.5 Xoa Node cua minh
@api_view(['DELETE'])
@views.token_required_user
def delete_node(request, current_user, node_id):
    try:
        realestatenode = Realestatenode.objects.get(id=node_id, userid=current_user.id)
    except:
        return JsonResponse({'data': 'Không tìm thấy bài đăng', 'status': 'error'})

    if request.method == 'DELETE':
        realestatenode.delete()
        return JsonResponse({'status': 'success'})

#15. Doi mat khau   
@api_view(['PUT'])
@views.token_required_user
def changepass(request, current_user):
    if request.method == 'PUT':
        data=json.loads(json.dumps(request.data))
        data['oldpassword'] = str(data['oldpassword'])
        data['password'] = str(data['password'])

        if check_password_hash(current_user.password, data['oldpassword']) and data['password']!= '':
            data['id'] = current_user.id
            data['username'] = current_user.username
            data['password'] = generate_password_hash(data['password'], method='sha256')
            data['name'] = current_user.name
            data['email'] = current_user.email
            data['phone'] = current_user.phone
            data['address'] = current_user.address
            data['company'] = current_user.company
            data['sex'] = current_user.sex
            data['birthday'] = current_user.birthday
            data['coin'] = current_user.coin
            data['avatar'] = current_user.avatar
            data['status'] = current_user.status
            data['rank'] = current_user.rank
            data['details'] = current_user.details
            data['social'] = current_user.social

            response = {}
            captcha_rs = data['g-recaptcha-response'].encode("utf-8")
            url = "https://www.google.com/recaptcha/api/siteverify"
            params = {
                'secret': settings.RECAPTCHA_SECRET_KEY,
                'response': captcha_rs
            }
            verify_rs = requests.get(url, params=params, verify=True)
            verify_rs = verify_rs.json()
            response["status"] = verify_rs.get("success", False)
            response['message'] = verify_rs.get('error-codes', None) or "Unspecified error."

            if response['status'] == False:
                return JsonResponse({'message': 'Lỗi', 'status': 'error'})

            serializer = UserSerializer(current_user, data=data)
            if serializer.is_valid():
                serializer.save()
                return JsonResponse({'data':serializer.data, 'status': 'success'})
            else:
                return JsonResponse({'message': 'Lỗi', 'status': 'error'})
        return JsonResponse({'message': 'Lỗi', 'status': 'error'})

#14. Xem lich su giao dich cua users
@api_view(['GET'])
@views.token_required_user
def lichsugiaodich(request, current_user):
    if request.META['REQUEST_METHOD'] == 'GET':
        histories = History.objects.filter(user=current_user, status=True).order_by('date')
        if histories:
            for history in histories:
                history.staff = ''

            serializer = HistorySerializer(histories, many=True)
            return JsonResponse({'data':serializer.data, 'status': 'success'})
        return JsonResponse({'data': [], 'status': 'success'})

#5. Xem node khac
@api_view(['GET'])
@views.token_required_user
def allnode(request, current_user):
    if request.META['REQUEST_METHOD'] == 'GET':
        realestatenodes = Realestatenode.objects.filter(status=True).order_by('rank')
        if realestatenodes:
            serializer = RealestatenodeSerializer(realestatenodes, many=True)
            return Response(serializer.data)
        return JsonResponse({'message': 'No Node!!!'})

#6. Doc service node
@api_view(['GET'])
@views.token_required_user
def list_servicenode(request, current_user):
    if request.META['REQUEST_METHOD'] == 'GET':
        servicenodes = Servicenode.objects.all()
        if servicenodes:
            serializer = ServicenodeSerializer(servicenodes, many=True)
            return Response(serializer.data)
        return JsonResponse({'message': 'No Servicenode!!!'})

#7.Doc TypeRealestateNode
@api_view(['GET'])
@views.token_required_user
def list_typerealestate(request, current_user):
    if request.META['REQUEST_METHOD'] == 'GET':
        typerealestates = Typerealestate.objects.all()
        if typerealestates:
            serializer = TyperealestateSerializer(typerealestates, many=True)
            return Response(serializer.data)
        return JsonResponse({'message': 'No Typerealestate!!!'})     

#8. Doc TypeService
@api_view(['GET'])
@views.token_required_user
def list_typeservice(request, current_user):
    if request.META['REQUEST_METHOD'] == 'GET':
        typeservices = Typeservice.objects.all()
        if typeservices:
            serializer = TypeserviceSerializer(typeservices, many=True)
            return Response(serializer.data)
        return JsonResponse({'message': 'No Typeservice!!!'})

#9. Doc GroupNode
@api_view(['GET'])
@views.token_required_user
def list_groupnode(request, current_user):
    if request.META['REQUEST_METHOD'] == 'GET':
        groupnodes = Groupnode.objects.all()
        if groupnodes:
            serializer = GroupnodeSerializer(groupnodes, many=True)
            return Response(serializer.data)
        return JsonResponse({'message': 'No groupnode!!!'})

#10. Tu dong mua coin
@api_view(['POST'])
@views.token_required_user
def buycoin(request, current_user):
    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))

        list_id = History.objects.all().values_list('id', flat=True)
        data['id'] = random.getrandbits(24)
        while data['id'] in list_id:
            data['id'] = random.getrandbits(24)

    	data['coin'] = int(data['coin'])
        data['type'] = True
    	data['user'] = current_user.id
        data['staff'] = ''
        data['status'] = False
        data['date'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        #import pdb; pdb.set_trace();
        serializer = HistorySerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'message': '', 'status': 'success', 'data': data['id']})
        else:
            return JsonResponse({'message': 'L  ^ i', 'data': 'error'})
    else:
            return JsonResponse({'message': 'L  ^ i', 'data': 'error'})

#danh sach cho giao dich
@api_view(['GET'])
@views.token_required_user
def giaodichcho(request, current_user):
    if request.META['REQUEST_METHOD'] == 'GET':
        historys = History.objects.filter(user=current_user.id, status=False)
        if historys:
            serializer = HistorySerializer(historys, many=True)
            return JsonResponse({'data':serializer.data})
        return JsonResponse({'data': []})

#15.Doc, Them Duanquantam
@api_view(['GET', 'POST'])
@views.token_required_user
def duanquantam(request, current_user):
    if request.META['REQUEST_METHOD'] == 'GET':
        duanquantams = Duanquantam.objects.filter(status=True, user=current_user)
        if duanquantams:
            serializer = DuanquantamSerializer(duanquantams, many=True)
            return JsonResponse({'data':serializer.data, 'status': 'success'})
        return JsonResponse({'data': [], 'status': 'success'})

    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))

        list_id = Duan.objects.all().values_list('id', flat=True)
        list_id_duanquantam = Duanquantam.objects.filter(user=current_user, status=True).values_list('duan', flat=True)

        if data['duan'] not in list_id or data['duan'] in list_id_duanquantam:
            return JsonResponse({'data': []})

        duanboquantam = Duanquantam.objects.filter(user=current_user, status=False)
        if duanboquantam:
            duanboquantam.delete()

        data['user'] = current_user
        data['status'] = True
        serializer = DuanquantamSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'data': serializer.data}, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#16. kiem tra du an quantam hay k
@api_view(['POST'])
@views.token_required_user
def kiemtraduanquantam(request, current_user):
    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))

        duan = Duanquantam.objects.filter(user=current_user, duan=data['duan'], status=True)

        if duan:
            return JsonResponse({'data': 'OK'})
        else:
            return JsonResponse({'data': 'error'})

#17. Bo quan tam 1 duan.
@api_view(['PUT'])
@views.token_required_user
def boduanquantam(request, current_user):
    if request.method == 'PUT':
        data=json.loads(json.dumps(request.data))

        duanquantam = Duanquantam.objects.filter(user=current_user, duan=data['duan'], status=True)

        if duanquantam:
            data['id'] = duanquantam[0].id
            data['duan'] = duanquantam[0].duan
            data['user'] = duanquantam[0].user
            data['status'] = False
            serializer = DuanquantamSerializer(duanquantam[0], data=data)
            if serializer.is_valid():
                serializer.save()
                return JsonResponse({'data': 'OK'})
            else:
                return JsonResponse({'data': []})

        return JsonResponse({'data': []})

@api_view(['GET'])
@views.token_required_user
def danhsachthongbao(request, current_user):
    if request.META['REQUEST_METHOD'] == 'GET':
        thongbaousers = Thongbaouser.objects.filter(user=current_user.id).order_by('-time')
        if thongbaousers:
            serializer = ThongbaouserSerializer(thongbaousers, many=True)
            return JsonResponse({'data': serializer.data, 'status': 'success'})
        return JsonResponse({'data': [], 'status': 'success'})

@api_view(['GET'])
@views.token_required_user
def chitietthongbao(request, current_user, thongbao_id):
    if request.META['REQUEST_METHOD'] == 'GET':
        chitietthongbao = Thongbaouser.objects.filter(Q(id=int(thongbao_id)), user=current_user.id)
        if chitietthongbao:
            serializer = ThongbaouserSerializer(chitietthongbao[0])
            return JsonResponse({'data': serializer.data})
        return JsonResponse({'message': []})

@api_view(['POST'])
@views.token_required_user
def add_messagenodes(request, current_user):
    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))

        try:
            node = Realestatenode.objects.get(id=data['node'], status=True)
            user = User.objects.get(id=data['user'], status=True)
        except:
            return JsonResponse({'message': 'Data is invalid', 'status': 'error'})
        
        if data['user'] == str(node.userid):
            return JsonResponse({'message': 'Data is invalid', 'status': 'error'})
        
        serializer = MessagenodeSerializer(data=data)
        if serializer.is_valid():
            try:
                serializer.save()
            except:
                return JsonResponse({'message': 'Data is invalid', 'status': 'error'})
                
            return JsonResponse({'data':serializer.data,'status': 'success'})
        else:
            return JsonResponse({'message': 'Data is invalid', 'status': 'error'})

"""
#Xoa anh moi up
@api_view(['DELETE'])
@views.token_required_user
def delete_thumbnail(request, current_user):
    if request.method == 'DELETE':
        data=json.loads(json.dumps(request.data))
        url = data['url_thumbnail'].split('/')[5]
        if not url or url != current_user.id:
            return JsonResponse({'data': 'error'})
        save_path = data['url_thumbnail']
        if default_storage.exists(save_path):
            default_storage.delete(save_path)
            return JsonResponse({'data': 'OK'})
        return JsonResponse({'data': 'error'})
"""