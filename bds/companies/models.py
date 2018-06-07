# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
import datetime
from channels import Group

class Admin(models.Model):
    
    id = models.CharField(max_length=20, primary_key=True)
    username = models.CharField(max_length=100, unique=True)
    password = models.CharField(max_length=100)
    name = models.CharField(max_length=100, default=None, null=True, blank=True)
    rank = models.IntegerField(default=1)

    class META:
        db_table = u'admin'

class Mod(models.Model):    

    id = models.CharField(max_length=20, primary_key=True)
    username = models.CharField(max_length=100, unique=True)
    password = models.CharField(max_length=100)
    name = models.CharField(max_length=100, default=None, null=True, blank=True)
    email = models.EmailField(max_length=100, blank=True, null=True)
    phone = models.CharField(max_length=20, blank=True, null=True)
    birthday = models.CharField(max_length=50, blank=True, null=True)
    status = models.BooleanField(default=True)
    sex = models.BooleanField(default=True, blank=True)
    address = models.CharField(max_length=200, blank=True, null=True)
    rank = models.BooleanField(default=True)
    type = models.ForeignKey('Mod', on_delete=models.CASCADE, default=None, blank=True, null=True)
    typemod = models.IntegerField(default=0)

    class META:
        db_table = u'mod'
    
    def __str__(self):
        return self.id	    

class User(models.Model):

    id = models.CharField(max_length=20, primary_key=True)
    username = models.CharField(max_length=100, unique=True)
    password = models.CharField(max_length=100)
    name = models.CharField(max_length=100, default=None)
    email = models.EmailField(max_length=100, unique=True)
    phone = models.CharField(max_length=20, blank=True, null=True)
    address = models.CharField(max_length=200, blank=True, null=True)
    company = models.CharField(max_length=200, blank=True, null=True)
    sex = models.BooleanField(default=True, blank=True)
    birthday = models.CharField(max_length=50, blank=True, null=True)
    coin = models.CharField(max_length=50)
    status = models.BooleanField(default=True)
    rank = models.IntegerField(default=1)
    details = models.TextField(default=None, blank=True)
    avatar = models.TextField(blank=True)
    social = models.TextField(blank=True)

    class META:
    	db_table = u'user'

    def __str__(self):
        return self.id

class Typerealestate(models.Model):
    id = models.CharField(max_length=20, primary_key=True)
    details = models.CharField(max_length=1000)
    icon = models.CharField(max_length=100, blank=True, null=True)
    type = models.BooleanField(default=True)
    
    class META:
        db_table = u'typerealestate'

    def __str__(self):
        return self.id

class Loaiduan(models.Model):
    id = models.CharField(max_length=20, primary_key=True)
    name = models.CharField(max_length=300)
    icon = models.CharField(max_length=100, blank=True, null=True)
    class META:
		db_table = u'loaiduan'
    def __str__(self):
        return self.id

class Duan(models.Model):
    id = models.CharField(max_length=20, primary_key=True)
    name = models.CharField(max_length=300)
    address = models.TextField(blank=True, null=False)
    tinh = models.CharField(max_length=200, blank=True, null=False)
    huyen = models.CharField(max_length=200, blank=True, null=False)
    xa = models.CharField(max_length=200, blank=True, null=False)
    details_address = models.TextField(null=True)
    intro = models.TextField(blank=True, null=True)
    type = models.ForeignKey('Loaiduan', on_delete=models.CASCADE)
    status = models.BooleanField(default=True)
    pricefrom = models.FloatField(blank=True, null=True)
    infoduan = models.TextField(blank=True, null=True)
    tiendo = models.CharField(max_length=300, blank=True, null=True)
    latitude = models.FloatField(blank=True, null=True)
    longitude = models.FloatField(blank=True, null=True)
    thumbs = models.TextField(blank=True, null=True)
    anh360 = models.TextField(blank=True, null=True)
    panorama_image = models.TextField(blank=True, null=True)
    video = models.TextField(blank=True, null=True)
    modname = models.ForeignKey('Mod', on_delete=models.CASCADE, blank=True, null=True)
    uutien = models.IntegerField(default=0)
    timecreate = models.DateTimeField()
    timemodify = models.DateTimeField()

    class META:
    	db_table = u'duan'
    
    def __str__(self):
        return self.id	

class Duanquantam(models.Model):

    duan = models.ForeignKey('Duan', on_delete=models.CASCADE, blank=True, null=True)
    user = models.ForeignKey('User', on_delete=models.CASCADE, blank=True, null=True)
    status = models.BooleanField(default=True)

    class META:
        db_table = u'duanquantam'

class Realestatenode(models.Model):
    id = models.CharField(max_length=20, primary_key=True)
    title = models.CharField(max_length=200)
    userid = models.ForeignKey('User', on_delete=models.CASCADE, blank=True, null=True)
    latitude = models.FloatField(blank=True)
    longitude = models.FloatField(blank=True)
    type = models.ForeignKey(Typerealestate, on_delete=models.CASCADE)
    price = models.FloatField(default=0)
    pricem2 = models.FloatField(default=0)
    area = models.FloatField(null=True)
    tinh = models.CharField(max_length=200)
    huyen = models.CharField(max_length=200)
    xa = models.CharField(max_length=200, blank=True, null=False)
    duong = models.CharField(max_length=200, blank=True, null=False)
    details_address = models.TextField(blank=True, null=True)
    address = models.TextField(blank=True, null=False)
    huong = models.CharField(max_length=200, blank=True)
    sophongngu = models.IntegerField(blank=True, null=True)
    tang = models.IntegerField(blank=True, null=True)
    sotang = models.IntegerField(blank=True, null=True)
    rongtien = models.FloatField(default=0)
    rongduong = models.FloatField(default=0)
    details = models.TextField(blank=True, null=True)
    status = models.BooleanField(default=True)
    thumbs = models.TextField(blank=True, null=True)
    anh360 = models.TextField(blank=True, null=True)
    panorama_image = models.CharField(max_length=2000, blank=True, null=True)
    video = models.TextField(blank=True, null=True)
    duanid = models.ForeignKey('Duan', on_delete=models.CASCADE, blank=True, null=True)
    tenduan = models.TextField(blank=True)
    tenlienhe = models.CharField(max_length=200)
    diachi = models.CharField(max_length=2000, blank=True)
    dienthoai = models.CharField(max_length=200)
    email = models.CharField(max_length=200)
    rank = models.IntegerField()
    timefrom = models.DateTimeField()
    timeto = models.DateTimeField()
    modid = models.ForeignKey('Mod', on_delete=models.CASCADE, blank=True, null=True)
    typenode = models.BooleanField(default=True)
    vip = models.IntegerField(default=0)
    modname = models.CharField(max_length=200, blank=True, null=True)
    timecreate = models.DateTimeField()
    timemodify = models.DateTimeField()
    
    class META:
        db_table = u'realestatenode'

class Typeservice(models.Model):

    id = models.CharField(max_length=20, primary_key=True)
    icon = models.CharField(max_length=100)
    name = models.CharField(max_length=1000, blank=True)

    class META:
        db_table = u'typeservice'

class Servicenode(models.Model):

    name = models.TextField()
    type = models.ForeignKey('Typeservice', on_delete=models.CASCADE)
    latitude = models.FloatField()
    longitude = models.FloatField()
    address = models.TextField(blank=True, null=True)
    details = models.TextField(blank=True, null=True)
    group = models.CharField(max_length=200)
    modname = models.CharField(max_length=200, blank=True, null=True)
    timecreate = models.DateTimeField()
    timemodify = models.DateTimeField()
    class META:
        db_table = u'servicenode'

class Groupnode(models.Model):

    id = models.CharField(max_length=20, primary_key=True)
    name = models.CharField(max_length=300)
    latitude = models.FloatField()
    longitude = models.FloatField()
    details = models.TextField()
    class META:
        db_table = u'servicenode'

class Coin(models.Model):

    coin = models.IntegerField(default=0)
    rank = models.IntegerField(default=1)
    vip  = models.IntegerField(default=0)
    typerealestate = models.ForeignKey('Typerealestate', on_delete=models.CASCADE, default=None, blank=True, null=True)
    class META:
        db_table = u'coin'

class History(models.Model):

    id = models.IntegerField(primary_key=True)
    coin = models.IntegerField(default=0)
    type = models.BooleanField(default=1)
    user = models.CharField(max_length=20)
    staff = models.CharField(max_length=20, blank=True)
    status = models.BooleanField(default=False)
    date = models.DateTimeField()
    class META:
        db_table = u'history'

class Tiendo(models.Model):

    duanid = models.CharField(max_length=20)
    thumbs = models.TextField(blank=True, null=True)
    title = models.TextField(blank=True)
    details = models.TextField(blank=True, null=True)
    modname = models.ForeignKey('Mod', on_delete=models.CASCADE, blank=True, null=True)
    time = models.DateTimeField()
    timemodify = models.DateTimeField()
    
    class META:
        db_table = u'tiendo'

class Phancong(models.Model):

    province = models.CharField(max_length=20)
    district = models.CharField(max_length=2000)
    modname = models.ForeignKey('Mod', on_delete=models.CASCADE, blank=True, null=True)
    timemodify = models.DateTimeField()
    
    class META:
        db_table = u'phancong'

class Phanhoi(models.Model):

    title = models.TextField()
    details = models.TextField()
    email = models.EmailField()
    time = models.DateTimeField()
    
    class META:
        db_table = u'phanhoi'

class Thongbaouser(models.Model):

    modname = models.TextField(blank=True, null=True)
    user = models.TextField(blank=True, null=True)
    details = models.TextField(blank=True, null=True)
    time = models.DateTimeField()
    thongbao = models.ForeignKey('Thongbao', on_delete=models.CASCADE, blank=True, null=True)
    
    class META:
        db_table = u'thongbaouser'

class Thongbao(models.Model):

    title = models.TextField()
    details = models.TextField()
    time = models.DateTimeField()
    
    class META:
        db_table = u'thongbao'

class Message(models.Model):

    converid = models.ForeignKey('Messagenode', on_delete=models.CASCADE)
    user = models.ForeignKey('User', on_delete=models.CASCADE, related_name='message_user')
    recipient = models.ForeignKey('User', on_delete=models.CASCADE, related_name='message_recipient')
    datetime = models.DateTimeField(auto_now_add=True)
    details = models.TextField(blank=True, null=True)

    def __str__(self):
        return str(self.id)

    def characters(self):
        return len(self.details)

    def notify_ws_client(self):
        notification = {'text': '%s' % self.id}
        Group('%s' % self.recipient).send(notification)
        Group('%s' % self.user).send(notification)

    def save(self, *args, **kwargs):
        new = self.id
        self.details = self.details.strip()
        super(Message, self).save(*args, **kwargs)
        if new is None:
            self.notify_ws_client()
            ordering = ('-datetime',)

    class META:
        db_table = u'message'
            
class Messagenode(models.Model):

    node = models.ForeignKey('Realestatenode', on_delete=models.CASCADE, related_name='+')
    user = models.ForeignKey('User', on_delete=models.CASCADE)

    class META:
        db_table = u'messagenode'