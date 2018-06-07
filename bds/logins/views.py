from __future__ import unicode_literals

from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.http import JsonResponse
from werkzeug.security import generate_password_hash, check_password_hash
import uuid, datetime
from functools import wraps
import rest_framework_jwt
from companies.models import Admin, User, Mod
from companies.serializers import AdminSerializer, UserSerializer, ModSerializer

def token_required(f):
    @wraps(f)
    def decorated(request, *args, **kwargs):
        token = None
        if 'HTTP_AUTHORIZATION' in request.META:
            token = request.META.get('HTTP_AUTHORIZATION')

        if not token:
            return JsonResponse({'message': 'Token is missing!'}, status=401)

        try:
            data = rest_framework_jwt.utils.jwt_decode_handler(token)
            current_admin = Admin.objects.get(id=data['id'])

            if not current_admin:
                return JsonResponse({'message': 'Token is invalid!'}, status=401)
        except:
            return JsonResponse({'message': 'Token is invalid!'}, status=401)
        return f(request, current_admin, *args, **kwargs)

    return decorated

@api_view(['POST'])
def login_admin(request):
    auth = request.data
    if not auth['username'] or not auth['password']:
        return JsonResponse({'message': 'Could not verify'}, status=401)

    try:
        admin = Admin.objects.get(username=auth['username'])
    except Admin.DoesNotExist:
        return JsonResponse({'message': 'Could not verify'}, status=401)

    if check_password_hash(admin.password, auth['password']):
        uid = str(uuid.uuid4())
        token = rest_framework_jwt.utils.jwt_encode_handler({'id': admin.id, 'exp': datetime.datetime.now() + datetime.timedelta(minutes=180), 'jti': uid})
        return JsonResponse({'token': token.decode('UTF-8')})

    return JsonResponse({'message': 'Could not verify'}, status=401)

def token_required_user(f):
    @wraps(f)
    def decorated(request, *args, **kwargs):
        token = None
        if 'HTTP_AUTHORIZATION' in request.META:
            token = request.META.get('HTTP_AUTHORIZATION')

        if not token:
            return JsonResponse({'message': 'Token is missing!'}, status=401)

        try:
            data = rest_framework_jwt.utils.jwt_decode_handler(token)
            current_user = User.objects.get(id=data['id'])

            if not current_user:
                return JsonResponse({'message': 'Token is invalid!'}, status=401)
        except:
            return JsonResponse({'message': 'Token is invalid!'}, status=401)
        return f(request, current_user, *args, **kwargs)

    return decorated

@api_view(['POST'])
def login_user(request):
    auth = request.data
    if not auth['username'] or not auth['password']:
        return JsonResponse({'message': 'Could not verify'}, status=200)

    try:
        user = User.objects.get(username=auth['username'])
    except User.DoesNotExist:
        return JsonResponse({'message': 'Could not verify'}, status=200)

    if check_password_hash(user.password, auth['password']) and user.status==True:
        uid = str(uuid.uuid4())
        token = rest_framework_jwt.utils.jwt_encode_handler({'id': user.id, 'exp': datetime.datetime.now() + datetime.timedelta(minutes=120), 'jti': uid})
        return JsonResponse({'token': token.decode('UTF-8')})

    return JsonResponse({'message': 'Could not verify'}, status=200)

@api_view(['POST'])
def login_mod(request):
    auth = request.data
    if not auth['username'] or not auth['password']:
        return JsonResponse({'message': 'Could not verify'}, status=200)

    try:
        mod = Mod.objects.get(username=auth['username'], rank=False)
    except Mod.DoesNotExist:
        return JsonResponse({'message': 'Could not verify'}, status=200)

    if check_password_hash(mod.password, auth['password']):
        uid = str(uuid.uuid4())
        token = rest_framework_jwt.utils.jwt_encode_handler({'id': mod.id, 'exp': datetime.datetime.now() + datetime.timedelta(minutes=120), 'jti': uid})
        return JsonResponse({'token': token.decode('UTF-8')})

    return JsonResponse({'message': 'Could not verify'}, status=200)

@api_view(['POST'])
def login_smod(request):
    auth = request.data
    if not auth['username'] or not auth['password']:
        return JsonResponse({'message': 'Could not verify'}, status=200)

    try:
        mod = Mod.objects.get(username=auth['username'], rank=True)
    except Mod.DoesNotExist:
        return JsonResponse({'message': 'Could not verify'}, status=200)

    if check_password_hash(mod.password, auth['password']):
        uid = str(uuid.uuid4())
        token = rest_framework_jwt.utils.jwt_encode_handler({'id': mod.id, 'exp': datetime.datetime.now() + datetime.timedelta(minutes=120), 'jti': uid})
        return JsonResponse({'token': token.decode('UTF-8')})

    return JsonResponse({'message': 'Could not verify'}, status=200)

def token_required_smod(f):
    @wraps(f)
    def decorated(request, *args, **kwargs):
        token = None
        if 'HTTP_AUTHORIZATION' in request.META:
            token = request.META.get('HTTP_AUTHORIZATION')

        if not token:
            return JsonResponse({'message': 'Token is missing!'}, status=401)

        try:
            data = rest_framework_jwt.utils.jwt_decode_handler(token)
            current_smod = Mod.objects.get(id=data['id'], rank=True)
            if not current_smod:
                return JsonResponse({'message': 'Token is invalid!'}, status=401)
        except:
            return JsonResponse({'message': 'Token is invalid!'}, status=401)
        return f(request, current_smod, *args, **kwargs)

    return decorated

def token_required_mod(f):
    @wraps(f)
    def decorated(request, *args, **kwargs):
        token = None
        if 'HTTP_AUTHORIZATION' in request.META:
            token = request.META.get('HTTP_AUTHORIZATION')

        if not token:
            return JsonResponse({'message': 'Token is missing!'}, status=401)

        try:
            data = rest_framework_jwt.utils.jwt_decode_handler(token)
            current_mod = Mod.objects.get(id=data['id'], rank=False)

            if not current_mod:
                return JsonResponse({'message': 'Token is invalid!'}, status=401)
        except:
            return JsonResponse({'message': 'Token is invalid!'}, status=401)
        return f(request, current_mod, *args, **kwargs)

    return decorated