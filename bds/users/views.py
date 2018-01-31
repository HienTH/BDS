# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.http import JsonResponse
from werkzeug.security import generate_password_hash, check_password_hash
from django.contrib.auth import authenticate
import uuid, datetime
from functools import wraps
import rest_framework_jwt
from companies.models import Admin, User, Mod, Typerealestate, Realestatenode, Loaiduan, Duan, Typeservice, Servicenode, Groupnode, Phancong, Duanquantam, Tiendo, History
from companies.serializers import AdminSerializer, UserSerializer, ModSerializer, TyperealestateSerializer, RealestatenodeSerializer, LoaiduanSerializer, DuanSerializer, TypeserviceSerializer, ServicenodeSerializer, GroupnodeSerializer, PhancongSerializer, DuanquantamSerializer, TiendoSerializer, HistorySerializer
import json
from logins import views 

#1.Xem USER
@api_view(['GET'])
@views.token_required_user
def info(request, current_user):
    if request.META['REQUEST_METHOD'] == 'GET':
        current_user.password = ''
        serializer = UserSerializer(current_user)
        return Response(serializer.data)

#2. Doi thong tin ca nhan
@api_view(['PUT'])
@views.token_required_user
def edit_user(request, current_user):
    if request.method == 'PUT':
        data=json.loads(json.dumps(request.data))
        data['id'] = current_user.id
        data['name'] = current_user.name
        data['username'] = current_user.username
        data['password'] = current_user.password
        data['rank'] = current_user.rank
        data['status'] = current_user.status
        data['coin'] = current_user.coin
        serializer = UserSerializer(current_user, data=data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#2.5 Refresh token
@api_view(['POST'])
@views.token_required_user
def refresh_token(request, current_user):
    if request.method == 'POST':
        uid = str(uuid.uuid4())
        token = rest_framework_jwt.utils.jwt_encode_handler({'id': current_user.id, 'exp': datetime.datetime.now() + datetime.timedelta(minutes=120), 'jti': uid})
        if token:
            return JsonResponse({'data': token.decode('UTF-8')})
        return JsonResponse({'data': 'error'})

def phanchiamod(province, district):
    phancongs = Phancong.objects.filter(province=province)
    for phancong in phancongs:
        list_district = phancong.district.split(',')
        if district in list_district:
            return phancong.mod_id
    return ""

def phanchiamodduan(duanid, province, district):
    duan = Duan.objects.get(id=duanid)
    modname = duan.modname
    return modname

#3.Xem Node da dang
@api_view(['GET', 'POST'])
@views.token_required_user
def list_node(request, current_user):
    if request.META['REQUEST_METHOD'] == 'GET':
        realestatenodes = Realestatenode.objects.filter(userid = current_user.id, status=True).order_by('timecreate')
        if realestatenodes:
            serializer = RealestatenodeSerializer(realestatenodes, many=True)
            return Response(serializer.data)
        return JsonResponse({'data': []})

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
        data['coin'] = 0
        data['rank'] = 0
        data['timecreate'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        data['timemodify'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        #Kiem tra timefrom va timeto.
        if (timeto - datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S') < 0) | (timeto - timefrom < 0):
            return JsonResponse({'data': []})

        #Phan chia khu vuc cho mod
        if duanid:
            #kiem tra chinh xac id du an.
            list_duanid = Duan.objects.filter(status=True).values_list('id', flat=True)
            if duanid not in list_duanid:
                return JsonResponse({'data': []})

            data['modid'] = str(phanchiamodduan(duanid, province, district))
        else:
            data['modid'] = str(phanchiamod(data['province'], data['district']))
            if data['modid'] == "":
                return JsonResponse({'data': []})
        
        serializer = RealestatenodeSerializer(data=data)
        
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'data': 'OK'})
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    else:
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

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

        data['id'] = node_id
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
        data['panorama_image'] = realestatenode.panorama_image
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

        data['coin'] = coin.coin

        serializer = RealestatenodeSerializer(realestatenode, data=data)
        if serializer.is_valid():
            serializer.save()
            request.data={}
            request.data['coin'] = int(current_user.coin) - int(data['coin'])
            request.data['id'] = current_user.id
            request.data['username'] = current_user.username
            request.data['password'] = current_user.password
            serializer = UserSerializer(current_user, data=request.data)
            if serializer.is_valid():
                serializer.save()
                return JsonResponse({'data': 'OK'})
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#4. Sua Node cua minh
@api_view(['PUT'])
@views.token_required_user
def detail_node(request, current_user, node_id):
    try:
        realestatenode = Realestatenode.objects.get(id=node_id, userid=current_user.id, status=True)
    except:
        return JsonResponse({'message': 'Not found!!!'})

    if request.method == 'PUT':
        request.data['id'] = node_id
        request.data['status'] = realestatenode.status
        request.data['rank'] = realestatenode.rank
        request.data['timefrom'] = realestatenode.timefrom
        request.data['timeto'] = realestatenode.timeto
        request.data['type'] = realestatenode.type
        request.data['duanid'] = realestatenode.duanid
        request.data['modid'] = realestatenode.modid

        serializer = RealestatenodeSerializer(realestatenode, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#15. Doi mat khau
@api_view(['PUT'])
@views.token_required_user
def changepass(request, current_user):
    if request.method == 'PUT':
        data=json.loads(json.dumps(request.data))
        data['oldpassword'] = str(data['oldpassword'])
        data['password'] = str(data['password'])

        if check_password_hash(current_mod.password, data['oldpassword']) and data['password']!= '':
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

            serializer = UserSerializer(current_user, data=data)
            if serializer.is_valid():
                serializer.save()
                return JsonResponse({'data':serializer.data})
            else:
                return JsonResponse({'data': []})
        return JsonResponse({'data': []})

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
            return JsonResponse({'data':serializer.data})
        return JsonResponse({'data': []})

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

    	data['coin'] = int(data['coin'])
        data['type'] = True
    	data['user'] = current_user.id
        data['staff'] = ''
        data['status'] = False
        data['date'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        
        serializer = HistorySerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'data': 'OK'})
        else:
            return JsonResponse({'data': []})


#15.Doc, Them Duanquantam
@api_view(['GET', 'POST'])
@views.token_required_user
def duanquantam(request, current_user):
    if request.META['REQUEST_METHOD'] == 'GET':
        duanquantams = Duanquantam.objects.filter(status=True, user=current_user)
        if duanquantams:
            serializer = DuanquantamSerializer(duanquantams, many=True)
            return JsonResponse({'data':serializer.data})
        return JsonResponse({'data': []})

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
            return JsonResponse({'data': []})

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