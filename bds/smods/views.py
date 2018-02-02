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
from companies.models import Admin, User, Mod, Typerealestate, Realestatenode, Loaiduan, Duan, Typeservice, Servicenode, Groupnode, History
from companies.serializers import AdminSerializer, UserSerializer, ModSerializer, TyperealestateSerializer, RealestatenodeSerializer, LoaiduanSerializer, DuanSerializer, TypeserviceSerializer, ServicenodeSerializer, GroupnodeSerializer, HistorySerializer

from logins import views
import json

#1.xem, them, sua, xoa USER
@api_view(['GET', 'POST'])
@views.token_required_smod
def list_user(request, current_smod):
    if request.META['REQUEST_METHOD'] == 'GET':
        users = User.objects.all()
        if users: 	       	
        	serializer = UserSerializer(users, many=True)
        	return JsonResponse({'data': serializer.data})
        return JsonResponse({'data': []})

@api_view(['GET', 'PUT', 'DELETE'])
@views.token_required_smod
def detail_user(request, current_smod, user_id):
    try:
        user = User.objects.get(id=user_id)
    except User.DoesNotExist:
        return JsonResponse({'message': 'Not found!!!'})

    if request.method == 'GET':
        serializer = UserSerializer(user)
        return JsonResponse({'data': serializer.data})

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

#3.5 Xem thong tin ca nhan
@api_view(['GET'])
@views.token_required_smod
def info(request, current_smod):
    if request.META['REQUEST_METHOD'] == 'GET':
        serializer = ModSerializer(current_smod)
        return JsonResponse({'data': serializer.data})

#3. Doi thong tin ca nhan
@api_view(['PUT'])
@views.token_required_smod
def edit_smod(request, current_smod):
    if request.method == 'PUT':
        data=json.loads(json.dumps(request.data))

        data['id'] = current_smod.id
        data['username'] = current_smod.username
        data['password'] = current_smod.password
        data['status'] = current_smod.status
        data['type'] = current_smod.type
        data['rank'] = current_smod.rank
        data['typemod'] = current_smod.typemod
        data['name'] = current_smod.name

        data['email'] = data['email']
        data['phone'] = data['phone']
        data['birthday'] = data['birthday']
        data['sex'] = data['sex']
        data['address'] = data['address']

        serializer = ModSerializer(current_smod, data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'data': serializer.data})
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#4. Doi mat khau
@api_view(['PUT'])
@views.token_required_smod
def changepass(request, current_smod):
    if request.method == 'PUT':
        data=json.loads(json.dumps(request.data))
        data['oldpassword'] = generate_password_hash(data['oldpassword'], method='sha256')
        if data['oldpassword'] == current_mod.password and data['password']:
            data['id'] = current_smod.id
            data['username'] = current_smod.username
            data['password'] = generate_password_hash(data['password'], method='sha256')
            data['name'] = current_smod.name
            data['email'] = current_smod.email
            data['phone'] = current_smod.phone
            data['birthday'] = current_smod.birthday
            data['status'] = current_smod.status
            data['sex'] = current_smod.sex
            data['address'] = current_smod.address
            data['typemod'] = current_smod.typemod
            data['type'] = current_smod.type
            data['rank'] = current_smod.rank

            serializer = ModSerializer(current_smod, data=data)
            if serializer.is_valid():
                serializer.save()
                return JsonResponse({'data':serializer.data})
            else:
                return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#6. Xem, Them MOD thuoc quyen
@api_view(['GET', 'POST'])
@views.token_required_smod
def list_mod(request, current_smod):
    if request.META['REQUEST_METHOD'] == 'GET':
        mods = Mod.objects.filter(type=current_smod.id, rank=False)
        if mods:
            serializer = ModSerializer(mods, many=True)
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
        data['type'] = current_smod.id
        data['typemod'] = current_smod.typemod
        data['rank'] = False

        serializer = ModSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'data': serializer.data})
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#6.5 Xem tat ca ca MOD
@api_view(['GET'])
@views.token_required_smod
def allmod(request, current_smod):
    if request.META['REQUEST_METHOD'] == 'GET':
        mods = Mod.objects.filter(rank=False)
        if mods:
            serializer = ModSerializer(mods, many=True)
            return JsonResponse({'data': serializer.data})
        return JsonResponse({'data': []})

#7. Xem Sua, Xoa MOD thuoc quyen
@api_view(['GET', 'PUT', 'DELETE'])
@views.token_required_smod
def detail_mod(request, current_smod, mod_id):
    try:
        mod = Mod.objects.get(id=mod_id)
    except Mod.DoesNotExist:
        return JsonResponse({'data': []})

    #import pdb; pdb.set_trace();
    if str(mod.type) != str(current_smod.id) or mod.rank == True:
        return JsonResponse({'data': []})

    if request.method == 'GET':
        serializer = ModSerializer(mod)
        return JsonResponse({'data': serializer.data})

    if request.method == 'PUT':
        data=json.loads(json.dumps(request.data))
        
        data['id'] = mod.id
        data['username'] = mod.username
        data['password'] = mod.password
        data['rank'] = mod.rank
        data['type'] = mod.type
        data['typemod'] = mod.typemod

        serializer = ModSerializer(mod, data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'data': serializer.data})
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        mod.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

#10.Xac thuc RealEstatenode dang thuoc quyen
@api_view(['PUT'])
@views.token_required_smod
def confirm_node(request, current_smod):
    data=json.loads(json.dumps(request.data))
    try:
        ktra = Mod.objects.filter(type=current_smod.id)
        realestatenode = Realestatenode.objects.get(id=data['realestatenode_id'], modid__in=ktra, status=False)
    except:
        return JsonResponse({'message': 'Not result!!!'})

    current_user = User.objects.get(id=realestatenode.userid)

    coin = Coin.objects.get(vip=realestatenode.vip)
    realcoins = coin.coin * int(realestatenode.timeto - realestatenode.timefrom)
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
        data['panorama_image'] = realestatenode.panorama_image
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

            serializer = UserSerializer(current_user, data=data)
            if serializer.is_valid():
                serializer.save()
                return JsonResponse({'message': 'OK'})
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#Xem, Them, Sua, Xoa Duan
@api_view(['GET', 'POST'])
@views.token_required_smod
def list_duan(request, current_smod):
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
        
        list_idmod = Mod.objects.filter(rank=0, status=True).values_list('id', flat=True)
        if data['modname'] not in list_idmod:
            return JsonResponse({'data': []})

        data['timecreate'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        data['timemodify'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        serializer = DuanSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'data': serializer.data})
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
@views.token_required_smod
def detail_duan(request, current_smod, duan_id):
    try:
        duan =Duan.objects.get(id=duan_id)
    except Duan.DoesNotExist:
        return JsonResponse({'data': []})

    if request.method == 'GET':
        serializer = DuanSerializer(duan)
        return JsonResponse({'data': serializer.data})

    elif request.method == 'PUT':
        data=json.loads(json.dumps(request.data))
        
        data['id'] = duan.id
        data['modname'] = duan.modname
        data['timemodify'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        serializer = DuanSerializer(duan, data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'data': serializer.data})
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        duan.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

#11. Doc Node thuoc quyen
@api_view(['GET'])
@views.token_required_smod
def allnode(request, current_smod):
    if request.META['REQUEST_METHOD'] == 'GET':
        ktra = Mod.objects.filter(type=current_smod.id)
        realestatenodes = Realestatenode.objects.filter(modid__in=ktra)
        if realestatenodes:
            serializer = RealestatenodeSerializer(realestatenodes, many=True)
            return JsonResponse({'data':serializer.data})
        return JsonResponse({'data': []})

#11,12. Doc Node, Them Node thuoc quyen
@api_view(['GET', 'POST'])
@views.token_required_smod
def list_node(request, current_smod):
    if request.META['REQUEST_METHOD'] == 'GET':
        realestatenodes = Realestatenode.objects.all()
        if realestatenodes:
            serializer = RealestatenodeSerializer(realestatenodes, many=True)
            return JsonResponse({'data':serializer.data})
        return JsonResponse({'data': []})

    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))

        #sinh id
        list_id = Realestatenode.objects.all().values_list('id', flat=True)
        data['id'] = str(uuid.uuid4().get_hex().upper()[0:20])
        while data['id'] in list_id:
            data['id'] = str(uuid.uuid4().get_hex().upper()[0:20])

        mod = Mod.objects.filter(id=data['modid'], rank=False, type=current_smod.id)
        if not mod:
            return JsonResponse({"data": []})

        data['status'] = False
        data['coin'] = 0
        data['rank'] = data['rank']
        data['timefrom'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        data['timemodify'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        data['timecreate'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        serializer = RealestatenodeSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#13,14. Sua Node, Xoa Node
@api_view(['GET', 'PUT', 'DELETE'])
@views.token_required_smod
def detail_node(request, current_smod, node_id):
    try:
        realestatenode = Realestatenode.objects.get(id=node_id)
    except:
        return JsonResponse({'data': []})

    if request.method == 'GET':
        serializer = RealestatenodeSerializer(realestatenode)
        return JsonResponse({'data': serializer.data})

    if request.method == 'PUT':
        data=json.loads(json.dumps(request.data))

        mod = Mod.objects.filter(id=realestatenode.modid, rank=False, type=current_smod)
        if not mod:
            return JsonResponse({"data": []})
        
        serializer = RealestatenodeSerializer(realestatenode, data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({"data": serializer.data})
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        realestatenode.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


#Thay doi coin cua User - SMOD kinh doanh moi lam duoc.
@api_view(['PUT'])
@views.token_required_smod
def change_coin(request, current_smod):
    if request.method == 'PUT':
        data=json.loads(json.dumps(request.data))
        
        if current_smod.typemod == 0:
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
            history['staff'] = current_smod.id
            history['status'] = True

            serializer = HistorySerializer(data=history)
            if serializer.is_valid():
                serializer.save()

            return Response({'message': 'OK'})
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

### Xem lich su giao dich
@api_view(['GET'])
@views.token_required_smod
def list_history(request, current_smod):
    if request.META['REQUEST_METHOD'] == 'GET':
        historys = History.objects.all()
        if historys:
            serializer = HistorySerializer(historys, many=True)
            return JsonResponse({'data':serializer.data})
        return JsonResponse({'data': []})

#12.Xem, Them, Sua, Xoa Servicenode
@api_view(['GET', 'POST'])
@views.token_required_smod
def list_servicenode(request, current_smod):
    if request.META['REQUEST_METHOD'] == 'GET':
        servicenodes = Servicenode.objects.all()
        if servicenodes:
            serializer = ServicenodeSerializer(servicenodes, many=True)
            return JsonResponse({'data':serializer.data})
        return JsonResponse({'data': []})

    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))
        data['modname'] = current_smod.id
        data['timecreate'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        data['timemodify'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        serializer = ServicenodeSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'data':serializer.data})
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
@views.token_required_smod
def detail_servicenode(request, current_smod, servicenode_id):
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
        data['modname'] = servicenode.modname
        data['timemodify'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        
        serializer = ServicenodeSerializer(servicenode, data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'data':serializer.data})
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        servicenode.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

# Doc Typeservice
@api_view(['GET'])
@views.token_required_smod
def list_typeservice(request, current_smod):
    if request.META['REQUEST_METHOD'] == 'GET':
        typeservices = Typeservice.objects.all()
        if typeservices:
            serializer = TypeserviceSerializer(typeservices, many=True)
            return Response(serializer.data)
        return JsonResponse({'message': 'No Typeservice!!!'})

#Doc TypeRealestateNode
@api_view(['GET'])
@views.token_required_smod
def list_typerealestate(request, current_smod):
    if request.META['REQUEST_METHOD'] == 'GET':
        typerealestates = Typerealestate.objects.all()
        if typerealestates:
            serializer = TyperealestateSerializer(typerealestates, many=True)
            return Response(serializer.data)
        return JsonResponse({'message': 'No Typerealestate!!!'})        

#Doc, Them Sua Xoa Group Node
@api_view(['GET', 'POST'])
@views.token_required_smod
def list_groupnode(request, current_smod):
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
@views.token_required_smod
def detail_groupnode(request, current_smod, groupnode_id):
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
@views.token_required_smod
def list_tiendo(request, current_smod):
    if request.META['REQUEST_METHOD'] == 'GET':
        tiendos = Tiendo.objects.all()
        if tiendos:
            serializer = TiendoSerializer(tiendos, many=True)
            return JsonResponse({'data':serializer.data})
        return JsonResponse({'data': []})

    if request.method == 'POST':
        data=json.loads(json.dumps(request.data))
        
        data['modname'] = current_smod.id
        data['time'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        data['timemodify'] = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        serializer = TiendoSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse({'data': serializer.data}, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET', 'PUT', 'DELETE'])
@views.token_required_smod
def detail_tiendo(request, current_smod, id):
    try:
        tiendo = Tiendo.objects.get(id=id)
    except Tiendo.DoesNotExist:
        return JsonResponse({'data': []})

    if request.method == 'GET':
        serializer = TiendoSerializer(tiendo)
        return JsonResponse({'data': serializer.data})

    elif request.method == 'PUT':
        data=json.loads(json.dumps(request.data))
        
        data['id'] = id
        data['duanid'] = tiendo.duanid
        data['modname'] = current_smod.id
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

#19.Duyet coin khi user nap
@api_view(['PUT'])
@views.token_required_smod
def duyetcoin(request, current_smod):
    if request.method == 'PUT':
        data=json.loads(json.dumps(request.data))

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

        serializer = UserSerializer(current_user, data=data)
        if serializer.is_valid():
            serializer.save()

            data['id'] = history.id
            data['coin'] = history.coin
            data['type'] = history.type
            data['user'] = history.user
            data['staff'] = current_smod.id
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
@views.token_required_smod
def danhsachduyetcoin(request, current_smod):
    if request.method == 'GET':
        historys = History.objects.filter(status=False)
        serializer = HistorySerializer(historys, many=True)
        if serializer:
            return JsonResponse({'data': serializer.data})
        return JsonResponse({'data': []})