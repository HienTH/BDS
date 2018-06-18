# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.http import JsonResponse
from werkzeug.security import generate_password_hash, check_password_hash
from django.contrib.auth import authenticate
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.decorators import parser_classes
from django.core.files.storage import default_storage
from django.conf import settings
import uuid, datetime
from functools import wraps
import rest_framework_jwt
from companies.models import Admin, User, Mod, Typerealestate, Realestatenode, Loaiduan, Duan, Typeservice, Servicenode, Groupnode, History, Tiendo, Thongbao, Thongbaouser, Phanhoi, Coin, Phancong
from companies.serializers import AdminSerializer, UserSerializer, ModSerializer, TyperealestateSerializer, RealestatenodeSerializer, LoaiduanSerializer, DuanSerializer, TypeserviceSerializer, ServicenodeSerializer, GroupnodeSerializer, HistorySerializer, TiendoSerializer, ThongbaoSerializer, ThongbaouserSerializer, PhanhoiSerializer, CoinSerializer, PhancongSerializer

import json
from logins import views
import re
import os

#1.xem USER
@api_view(['GET'])
@views.token_required_mod
def list_user(request, current_mod):
    if request.META['REQUEST_METHOD'] == 'GET':
        users = User.objects.filter(status=True)
        if users:
        	serializer = UserSerializer(users, many=True)
        	return JsonResponse({"data": serializer.data})
        return JsonResponse({'data': []})

#2.xem USER false
@api_view(['GET'])
@views.token_required_mod
def userfalse(request, current_mod):
    if request.META['REQUEST_METHOD'] == 'GET':
        users = User.objects.filter(status=False)
        if users:
            serializer = UserSerializer(users, many=True)
            return JsonResponse({"data": serializer.data})
        return JsonResponse({'data': []})


@api_view(['GET', 'PUT', 'DELETE'])
@views.token_required_mod
def detail_user(request, current_mod, user_id):
    try:
        user = User.objects.get(id=user_id)
    except User.DoesNotExist:
        return JsonResponse({'message': 'Not found!!!'})

    if request.method == 'GET':
        serializer = UserSerializer(user)
        return JsonResponse({"data": serializer.data})

    elif request.method == 'PUT':
        data=json.loads(json.dumps(request.data))
    	data['id'] = user_id
        data['password'] = user.password
        data['username'] = user.username
        data['email'] = user.email
        data['coin'] = user.coin
        data['sex'] = user.sex
        serializer = UserSerializer(user, data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({"data": serializer.data})
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        user.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

#3.5 Xem thong tin
@api_view(['GET'])
@views.token_required_mod
def info(request, current_mod):
    if request.META['REQUEST_METHOD'] == 'GET':
        serializer = ModSerializer(current_mod)
        return JsonResponse({"data": serializer.data})

#3. Sua thong tin
@api_view(['PUT'])
@views.token_required_mod
def edit_mod(request, current_mod):
    if request.method == 'PUT':
        data=json.loads(json.dumps(request.data))
        data['id'] = current_mod.id
        data['username'] = current_mod.username
        data['password'] = current_mod.password
        data['type'] = current_mod.type
        data['typemod'] = current_mod.typemod
        data['rank'] = current_mod.rank
        data['status'] = current_mod.status
        data['sex'] = current_mod.sex
        serializer = ModSerializer(current_mod, data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'data': serializer.data})
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#4. Doi mat khau
@api_view(['PUT'])
@views.token_required_mod
def changepass(request, current_mod):
    if request.method == 'PUT':
        data=json.loads(json.dumps(request.data))
        data['oldpassword'] = str(data['oldpassword'])
        data['password'] = str(data['password'])
#        import pdb; pdb.set_trace();
        if check_password_hash(current_mod.password, data['oldpassword']) and data['password']!= '':
            data['id'] = current_mod.id
            data['username'] = current_mod.username
            data['password'] = generate_password_hash(data['password'], method='sha256')
            data['name'] = current_mod.name
            data['email'] = current_mod.email
            data['phone'] = current_mod.phone
            data['birthday'] = current_mod.birthday
            data['status'] = current_mod.status
            data['sex'] = current_mod.sex
            data['address'] = current_mod.address
            data['typemod'] = current_mod.typemod
            data['type'] = current_mod.type
            data['rank'] = current_mod.rank

            serializer = ModSerializer(current_mod, data=data)
            if serializer.is_valid():
                serializer.save()
                return JsonResponse({'data':serializer.data})
            else:
                return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        return JsonResponse({'data': []})


#6. Doc MOD
@api_view(['GET'])
@views.token_required_mod
def list_mod(request, current_mod):
    if request.META['REQUEST_METHOD'] == 'GET':
        mods = Mod.objects.filter(rank=False)
        if mods:
            output = []
            for mod in mods:
                admin_data = {}
                admin_data['name'] = mod.name
                admin_data['email'] = mod.email
                admin_data['phone'] = mod.phone
                admin_data['sex'] = mod.sex
                admin_data['address'] = mod.address
                output.append(admin_data)

            return Response({'data':output})
        return JsonResponse({'message': 'No Smod!!!'})

#Danh sach nodefalse.
@api_view(['GET'])
@views.token_required_mod
def list_nodefalse(request, current_mod):
    if request.META['REQUEST_METHOD'] == 'GET':
        realestatenodes = Realestatenode.objects.filter(modid=current_mod.id, status=False)
        if realestatenodes:
            serializer = RealestatenodeSerializer(realestatenodes, many=True)
            return JsonResponse({'data': serializer.data})
        return JsonResponse({'data': []})

#7 Doc Node, Them Node thuoc quyen
@api_view(['GET', 'POST'])
@views.token_required_mod
def list_node(request, current_mod):
    if request.META['REQUEST_METHOD'] == 'GET':
        realestatenodes = Realestatenode.objects.filter(modid=current_mod.id, status=True)
        if realestatenodes:
            serializer = RealestatenodeSerializer(realestatenodes, many=True)
            return JsonResponse({'data': serializer.data})
        return JsonResponse({'data': []})

    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))

        #sinh id
        list_id = Realestatenode.objects.all().values_list('id', flat=True)
        data['id'] = str(uuid.uuid4().get_hex().upper()[0:20])
        while data['id'] in list_id:
            data['id'] = str(uuid.uuid4().get_hex().upper()[0:20])

        data['userid'] = current_mod.id
        data['status'] = False
        data['coin'] = 0
        data['rank'] = data['rank']
        data['timefrom'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        data['timemodify'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        data['timecreate'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        serializer = RealestatenodeSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({"data": serializer.data})
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#8 Sua Node thuoc quyen, Xoa Node thuoc quyen
@api_view(['GET', 'PUT', 'DELETE'])
@views.token_required_mod
def detail_node(request, current_mod, node_id):
    try:
        realestatenode = Realestatenode.objects.get(id=node_id, modid=current_mod.id)
    except:
        return JsonResponse({'message': 'Not found!!!'})
    
    if request.method == 'GET':
        serializer = RealestatenodeSerializer(realestatenode)
        return Response({'data': serializer.data})

    if request.method == 'PUT':
        data=json.loads(json.dumps(request.data))

        if realestatenode.modid != current_mod.id:
            return JsonResponse({"data": []})
            
        data['id'] = node_id
        data['modid'] = realestatenode.modid
        data['timemodify'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        serializer = RealestatenodeSerializer(realestatenode, data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({"data": serializer.data})
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        realestatenode.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

#9. Doc TypeRealestateNode
@api_view(['GET'])
@views.token_required_mod
def list_typerealestate(request, current_mod):
    if request.META['REQUEST_METHOD'] == 'GET':
        typerealestates = Typerealestate.objects.all()
        if typerealestates:
            serializer = TyperealestateSerializer(typerealestates, many=True)
            return Response(serializer.data)
        return JsonResponse({'message': 'No Typerealestate!!!'}) 

#10.Xac thuc RealEstatenode dang thuoc quyen
@api_view(['PUT'])
@views.token_required_mod
def confirm_node(request, current_mod):
    data=json.loads(json.dumps(request.data))
    try:
        realestatenode = Realestatenode.objects.get(id=data['realestatenode_id'], status=False)
    except:
        return JsonResponse({'message': 'Not result!!!'})

    if str(realestatenode.modid) != current_mod.id:
        return JsonResponse({'message': 'Not result!!!'})

    current_user = User.objects.get(id=realestatenode.userid)

    coin = Coin.objects.get(vip=realestatenode.vip)
    realcoins = coin.coin * (realestatenode.timeto - realestatenode.timefrom).days
    if current_user.coin < realcoins:
        return JsonResponse({'data': 'Khong du coin'})

    if request.method == 'PUT':
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
        data['status'] = True
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
        data['timefrom'] = realestatenode.timefrom
        data['timeto'] = realestatenode.timeto
        data['typenode'] = realestatenode.typenode
        data['vip'] = realestatenode.vip
        data['modname'] = realestatenode.modname
        data['timecreate'] = realestatenode.timecreate
        data['timemodify'] = realestatenode.timemodify
        data['duanid'] = realestatenode.duanid
        data['modid'] = realestatenode.modid
        data['type'] = realestatenode.type
        data['userid'] = realestatenode.userid

        serializer = RealestatenodeSerializer(realestatenode, data=data)
        if serializer.is_valid():
            serializer.save()

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
            data['coin'] = int(current_user.coin) - realcoins
            data['avatar'] = current_user.avatar
            data['status'] = current_user.status
            data['rank'] = current_user.rank
            data['details'] = current_user.details
            data['social'] = current_user.social

            serializer = UserSerializer(current_user, data=data)
            if serializer.is_valid():
                serializer.save()
                return JsonResponse({'message': 'OK'})

        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#11.Xem Duan truc thuoc mod
@api_view(['GET'])
@views.token_required_mod
def list_duanmod(request, current_mod):
    if request.META['REQUEST_METHOD'] == 'GET':
        duans = Duan.objects.filter(modname=current_mod.id, status=True)
        if duans:
            serializer = DuanSerializer(duans, many=True)
            return JsonResponse({'data': serializer.data})
        return JsonResponse({'data': []})

#Up load anh thumbnail
@api_view(['POST'])
@views.token_required_mod
def upload_thumbnail(request, current_mod):
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
            request.FILES['thumbnail'].name = current_mod.id + '.' + namethumbnail[len(namethumbnail)-1]

            save_path = os.path.join(settings.MEDIA_ROOT, 'thumbnail/'+current_mod.id+'/'+Y+'/'+m+'/'+d+'/', request.FILES['thumbnail'].name)
            path = default_storage.save(save_path, request.FILES['thumbnail'])

            url_thumbnail ='https://www.mappy.com.vn/media/thumbnail/'+current_mod.id+'/'+Y+'/'+m+'/'+d+'/' + path.split('/')[11]
            return JsonResponse({'data': url_thumbnail, 'status': 'success'})
        return JsonResponse({'data': 'Lỗi hệ thống! Vui lòng liên hệ với quản trị viên để được hỗ trợ sớm nhất!', 'status': 'error'})

#Up load anh panorama
@api_view(['POST'])
@views.token_required_mod
def upload_panorama(request, current_mod):
    if request.method == 'POST':
        if request.FILES['panorama']:
            Y = str(datetime.datetime.now().year)
            m = str(datetime.datetime.now().month)
            d = str(datetime.datetime.now().day)
            matches = re.search('\w+\.(jpg|gif|png|jpeg)',request.FILES['panorama'].name)
            if not matches:
                return JsonResponse({'data': 'Không đúng định dạng ảnh', 'status': 'error'})

            namepanorama = request.FILES['panorama'].name.split('.')
            request.FILES['panorama'].name = current_mod.id + '.' + namepanorama[len(namepanorama)-1]

            save_path = os.path.join(settings.MEDIA_ROOT, 'panorama/'+current_mod.id+'/'+Y+'/'+m+'/'+d+'/', request.FILES['panorama'].name)
            path = default_storage.save(save_path, request.FILES['panorama'])

            url_panorama ='https://www.mappy.com.vn/media/panorama/'+current_mod.id+'/'+Y+'/'+m+'/'+d+'/' + request.FILES['panorama'].name
            return JsonResponse({'data': url_panorama, 'status': 'success'})
        return JsonResponse({'data': 'Lỗi hệ thống! Vui lòng liên hệ với quản trị viên để được hỗ trợ sớm nhất!', 'status': 'error'})

#Up load anh 360
@api_view(['POST'])
@views.token_required_mod
def upload_anh360(request, current_mod):
    if request.method == 'POST':
        if request.FILES['anh_360']:
            Y = str(datetime.datetime.now().year)
            m = str(datetime.datetime.now().month)
            d = str(datetime.datetime.now().day)

            matches = re.search('\w+\.(jpg|gif|png|jpeg)',request.FILES['anh_360'].name)
            if not matches:
                return JsonResponse({'data': 'Không đúng định dạng ảnh', 'status': 'error'})

            nameanh360 = request.FILES['anh_360'].name.split('.')
            request.FILES['anh_360'].name = current_mod.id + '.' + nameanh360[len(nameanh360)-1]

            save_path = os.path.join(settings.MEDIA_ROOT, 'anh360/'+current_mod.id+'/'+Y+'/'+m+'/'+d+'/', request.FILES['anh_360'].name)
            path = default_storage.save(save_path, request.FILES['anh_360'])

            url_anh360 ='https://www.mappy.com.vn/media/anh360/'+current_mod.id+'/'+Y+'/'+m+'/'+d+'/' + request.FILES['anh_360'].name
            return JsonResponse({'data': url_anh360, 'status': 'success'})
        return JsonResponse({'data': 'Lỗi hệ thống! Vui lòng liên hệ với quản trị viên để được hỗ trợ sớm nhất!', 'status': 'error'})

#11.Xem, Them, Sua, Xoa Duan
@api_view(['GET', 'POST'])
@views.token_required_mod
def list_duan(request, current_mod):
    if request.META['REQUEST_METHOD'] == 'GET':
        duans = Duan.objects.all()
        if duans:
            serializer = DuanSerializer(duans, many=True)
            return JsonResponse({'data': serializer.data})
        return JsonResponse({'data': []})

    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))

        #sinh id
        list_id = Duan.objects.all().values_list('id', flat=True)
        data['id'] = str(uuid.uuid4().get_hex().upper()[0:16])
        while data['id'] in list_id:
            data['id'] = str(uuid.uuid4().get_hex().upper()[0:16])
        
        data['modname'] = current_mod.id
        data['timecreate'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        data['timemodify'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        serializer = DuanSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'status': 'success'})
        else:
            return JsonResponse({'data': 'Lỗi hệ thống! Vui lòng liên hệ với quản trị viên để được hỗ trợ sớm nhất!', 'status':'error'})

@api_view(['GET', 'PUT', 'DELETE'])
@views.token_required_mod
def detail_duan(request, current_mod, duan_id):
    try:
        duan =Duan.objects.get(id=duan_id)
    except Duan.DoesNotExist:
        return JsonResponse({'data': [], 'message': 'error'})

    if request.method == 'GET':
        serializer = DuanSerializer(duan)
        return JsonResponse({'data': serializer.data})

    elif request.method == 'PUT':
        data=json.loads(json.dumps(request.data))
        
        if duan.modname != current_mod:
            return JsonResponse({'data': []})            

        data['id'] = duan.id
        data['modname'] = duan.modname
        data['timecreate'] = duan.timecreate
        data['timemodify'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        
        serializer = DuanSerializer(duan, data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'data': serializer.data})
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        if duan.modname != current_mod:
            return JsonResponse({'data': []})

        duan.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

#Thay doi coin cua User - MOD kinh doanh moi lam duoc.
@api_view(['PUT'])
@views.token_required_mod
def change_coin(request, current_mod):
    if request.method == 'PUT':
        data=json.loads(json.dumps(request.data))
        
        if current_mod.typemod == 0:
            return JsonResponse({'message': 'Not found!!!'})

        try:
            user = User.objects.get(id=data['user_id'])
        except User.DoesNotExist:
            return JsonResponse({'message': 'Not found!!!'})

        history = {}
        check = 0
        if data['coin'] > 0:
            check = 1

        data['id'] = user.id
        data['username'] = user.username
        data['password'] = user.password
        data['name'] = user.name
        data['email'] = user.email
        data['phone'] = user.phone
        data['address'] = user.address
        data['company'] = user.company
        data['sex'] = user.sex
        data['birthday'] = user.birthday
        data['avatar'] = user.avatar
        data['status'] = user.status
        data['details'] = user.details
        data['social'] = user.social
        data['rank'] = user.rank
        history['coin'] = abs(data['coin'])
        data['coin'] = int(user.coin) + int(data['coin'])

        serializer = UserSerializer(user, data=data)
        if serializer.is_valid():
            serializer.save()

            if check == 1:
                history['type'] = 1
            else:
                history['type'] = 0

            history['user'] = user.id
            history['staff'] = current_mod.id
            history['status'] = True

            serializer = HistorySerializer(data=history)
            if serializer.is_valid():
                serializer.save()

            return Response({'message': 'OK'})
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#19.Duyet coin khi user nap
@api_view(['PUT'])
@views.token_required_mod
def duyetcoin(request, current_mod):
    if request.method == 'PUT':
        data=json.loads(json.dumps(request.data))

        if current_mod.typemod == 0 and current_mod.rank == 0:
            return JsonResponse({'data': []})

        history = History.objects.get(id=data['historyid'])
        if not history or history.status == True:
            return JsonResponse({'data': []})
        
        current_user = User.objects.get(id=history.user)
        if not current_user or current_user.status == False:
            return JsonResponse({'data': []})

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
        data['coin'] = int(current_user.coin) + int(history.coin)
        data['avatar'] = current_user.avatar
        data['status'] = current_user.status
        data['rank'] = current_user.rank
        data['details'] = current_user.details
        data['social'] = current_user.social

        serializer = UserSerializer(current_user, data=data)
        if serializer.is_valid():
            serializer.save()

            data['id'] = history.id
            data['coin'] = history.coin
            data['type'] = history.type
            data['user'] = history.user
            data['staff'] = current_mod.id
            data['date'] = history.date
            data['status'] = True
            
            serializer = HistorySerializer(history, data=data)
            if serializer.is_valid():
                serializer.save()
                return JsonResponse({'data': 'OK'})
            else:
                return JsonResponse({'data': []})
        else:
            return JsonResponse({'data': []})

#20.Danh sach duyet coin khi user nap
@api_view(['GET'])
@views.token_required_mod
def danhsachduyetcoin(request, current_mod):
    if request.method == 'GET':
        historys = History.objects.filter(status=False)
        serializer = HistorySerializer(historys, many=True)
        if serializer:
            return JsonResponse({'data': serializer.data})
        return JsonResponse({'data': []})

### Xem lich su giao dich
@api_view(['GET'])
@views.token_required_mod
def list_history(request, current_mod):
    if request.META['REQUEST_METHOD'] == 'GET':
        historys = History.objects.all()
        if historys:
            serializer = HistorySerializer(historys, many=True)
            return JsonResponse({'data':serializer.data})
        return JsonResponse({'data': []})

#12.Xem, Them, Sua, Xoa Servicenode
@api_view(['GET', 'POST'])
@views.token_required_mod
def list_servicenode(request, current_mod):
    if request.META['REQUEST_METHOD'] == 'GET':
        servicenodes = Servicenode.objects.all()
        if servicenodes:
            serializer = ServicenodeSerializer(servicenodes, many=True)
            return JsonResponse({'data':serializer.data})
        return JsonResponse({'data': []})

    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))
        data['modname'] = current_mod.id
        data['timecreate'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        data['timemodify'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        serializer = ServicenodeSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'data':serializer.data})
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
@views.token_required_mod
def detail_servicenode(request, current_mod, servicenode_id):
    try:
        servicenode =Servicenode.objects.get(id=servicenode_id)
    except Servicenode.DoesNotExist:
        return JsonResponse({'data': []})

    if request.method == 'GET':
        serializer = ServicenodeSerializer(servicenode)
        return JsonResponse({'data':serializer.data})

    elif request.method == 'PUT':
        data=json.loads(json.dumps(request.data))
        data['id'] = servicenode.id
        data['modname'] = current_mod.id
        data['timemodify'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        data['timecreate'] = servicenode.timecreate
        
        serializer = ServicenodeSerializer(servicenode, data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'data':serializer.data})
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        servicenode.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


#13.Doc, Them Sua Xoa Group Node
@api_view(['GET', 'POST'])
@views.token_required_mod
def list_groupnode(request, current_mod):
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
@views.token_required_mod
def detail_groupnode(request, current_mod, groupnode_id):
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


#15.Doc, Them Tien Do Du an
@api_view(['GET', 'POST'])
@views.token_required_mod
def list_tiendo(request, current_mod):
    if request.META['REQUEST_METHOD'] == 'GET':
        tiendos = Tiendo.objects.all()
        if tiendos:
            serializer = TiendoSerializer(tiendos, many=True)
            return JsonResponse({'data':serializer.data})
        return JsonResponse({'data': []})

    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))
        
        data['modname'] = current_mod.id
        data['time'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        data['timemodify'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        serializer = TiendoSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'data': serializer.data}, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET', 'PUT', 'DELETE'])
@views.token_required_mod
def detail_tiendo(request, current_mod, id):
    try:
        tiendo = Tiendo.objects.get(id=id)
    except Tiendo.DoesNotExist:
        return JsonResponse({'data': []})

    if request.method == 'GET':
        serializer = TiendoSerializer(tiendo)
        return JsonResponse({'data': serializer.data})

    elif request.method == 'PUT':
        data=json.loads(json.dumps(request.data))
        
        duan = Duan.objects.get(id=data['duanid'])
        list_id = Mod.objects.filter(rank=True).values_list('id', flat=True)

        if (duan and duan.modname != current_mod.id) or (duan.modname not in list_id):
            return JsonResponse({'data':[]})

        data['id'] = id
        data['duanid'] = tiendo.duanid
        data['modname'] = current_mod.id
        data['time'] = tiendo.time
        data['timemodify'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        serializer = TiendoSerializer(tiendo, data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'data': serializer.data})
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        tiendo.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


@api_view(['GET'])
@views.token_required_mod
def danhsachthongbaodagui(request, current_mod):
    if request.method == 'GET':
        thongbaousers = Thongbaouser.objects.all()
        if thongbaousers:
            serializer = ThongbaouserSerializer(thongbaousers, many=True)
            return JsonResponse({'data':serializer.data})
        return JsonResponse({'data': []})


@api_view(['GET'])
@views.token_required_mod
def danhsachphanhoi(request, current_mod):
    if request.method == 'GET':
        phanhois = Phanhoi.objects.all()
        if phanhois:
            serializer = PhanhoiSerializer(phanhois, many=True)
            return JsonResponse({'data':serializer.data})
        return JsonResponse({'data': []})

###thong bao chinh
@api_view(['GET'])
@views.token_required_mod
def danhsachthongbaochinh(request, current_mod):
    if request.method == 'GET':
        thongbaos = Thongbao.objects.all()
        if thongbaos:
            serializer = ThongbaoSerializer(thongbaos, many=True)
            return JsonResponse({'data':serializer.data})
        return JsonResponse({'data': []})

@api_view(['GET'])
@views.token_required_mod
def chitietthongbaochinh(request, current_mod, thongbao_id):
    if request.method == 'GET':
        thongbaos = Thongbao.objects.get(id=thongbao_id)
        if thongbaos:
            serializer = ThongbaoSerializer(thongbaos)
            return JsonResponse({'data':serializer.data})
        return JsonResponse({'data': []})

@api_view(['PUT'])
@views.token_required_mod
def suathongbaochinh(request, current_mod, thongbao_id):
    if request.method == 'PUT':
        data=json.loads(json.dumps(request.data))
        data['time'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        thongbao = Thongbao.objects.get(id=thongbao_id)
        if not thongbao:
            return JsonResponse({'data': []})

        serializer = ThongbaoSerializer(thongbao, data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'data':serializer.data})
        return JsonResponse({'data': []})

@api_view(['POST'])
@views.token_required_mod
def themthongbaochinh(request, current_mod):
    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))
        
        data['time'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        serializer = ThongbaoSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'data': serializer.data})
        else:
            return JsonResponse({'data': 'error'})


@api_view(['POST'])
@views.token_required_mod
def guithongbao(request, current_mod):
    if request.method == 'POST':
        list_to = request.POST.getlist('to')
        seen_all = int(request.POST['seen_all'])
        details = request.POST['details']
        thongbao = int(request.POST['thongbao'])

        if seen_all == 1:
            if thongbao != '':          
                thongbaos = Thongbao.objects.get(id=thongbao)

                if not thongbaos:
                    return JsonResponse({'data': 'error'})

                data = {'details':'', 'modname': '', 'time': '', 'thongbao': '', 'user': ''}
                data['details'] = thongbaos.details
                data['modname'] = current_mod.id
                data['time'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
                data['thongbao'] = thongbao
                import pdb; pdb.set_trace();

                user = User.objects.filter(status=True)
                for u in user:
                    data['user'] = u.id
                    serializer = ThongbaouserSerializer(data=data)
                    if serializer.is_valid():
                        serializer.save()
            else:
                data = {'details':'', 'modname': '', 'time': '', 'thongbao': '', 'user': ''}
                data['details'] = details
                data['modname'] = current_mod.id
                data['time'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
                data['thongbao'] = ''

                user = User.objects.filter(status=True)
                for u in user:
                    data['user'] = u.id
                    serializer = ThongbaouserSerializer(data=data)
                    if serializer.is_valid():
                        serializer.save()
        
        else:
            if not list_to:
                return JsonResponse({'data': 'error'})

            if thongbao != '':
                thongbaos = Thongbao.objects.get(id=thongbao)
                if not thongbaos:
                    return JsonResponse({'data': 'error'})
                data = {'details':'', 'modname': '', 'time': '', 'thongbao': '', 'user': ''}
                data['details'] = thongbaos.details
                data['modname'] = current_mod.id
                data['time'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
                data['thongbao'] = thongbao

                for u in list_to:
                    data['user'] = u.id
                    serializer = ThongbaouserSerializer(data=data)
                    if serializer.is_valid():
                        serializer.save()
            else:
                data = {'details':'', 'modname': '', 'time': '', 'thongbao': '', 'user': ''}
                data['details'] = details
                data['modname'] = current_mod.id
                data['time'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
                data['thongbao'] = ''

                user = User.objects.filter(status=True)
                for u in list_to:
                    data['user'] = u.id
                    serializer = ThongbaouserSerializer(data=data)
                    if serializer.is_valid():
                        serializer.save()
        return JsonResponse({'data': 'OK'})


###Xem phan cong bai dang.
@api_view(['GET'])
@views.token_required_mod
def xemphancong(request, current_mod):
    if request.method == 'GET':
        phancongs = Phancong.objects.all()
        if phancongs:
            serializer = PhancongSerializer(phancongs, many=True)
            return JsonResponse({'data':serializer.data})
        return JsonResponse({'data': []})