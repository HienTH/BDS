from django.conf.urls import url
from . import views
urlpatterns= [
    #/login/
    url(r'^admin/$', views.login_admin, name='login_admin'),
    url(r'^user/$', views.login_user, name='login_user'),
	url(r'^mod/$', views.login_mod, name='login_mod'),
	url(r'^smod/$', views.login_smod, name='login_smod'),
]