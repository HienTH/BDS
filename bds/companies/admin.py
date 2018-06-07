# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin

# Register your models here.
from .models import Duan, Mod, User, Typerealestate, Loaiduan, Duanquantam, Realestatenode, Typeservice, Servicenode, Groupnode, Coin, History, Tiendo, Phancong

admin.site.register(Duan)
admin.site.register(Mod)
admin.site.register(User)
admin.site.register(Typerealestate)
admin.site.register(Loaiduan)
admin.site.register(Duanquantam)
admin.site.register(Realestatenode)
admin.site.register(Typeservice)
admin.site.register(Servicenode)
admin.site.register(Groupnode)
admin.site.register(Coin)
admin.site.register(History)
admin.site.register(Tiendo)
admin.site.register(Phancong)
