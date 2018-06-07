from django.conf.urls import url, include
from django.contrib import admin
from companies import views
admin.autodiscover()

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^manager/', include('companies.urls')),
    url(r'^manager_smod/', include('smods.urls')),
    url(r'^manager_mod/', include('mods.urls')),
    url(r'^manager_user/', include('users.urls')),
    url(r'^chat/', include('chat.urls')),

    #nguoi dung chua dang nhap
    url(r'^user/', include('companies.urls')),
    url(r'^login/', include('logins.urls')),
    url(r'^search/', include('companies.urls')),
]