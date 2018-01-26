from django.conf.urls import url
from . import views
urlpatterns= [
    #USER
    #1./manager_user/info/
    url(r'^info/$', views.info, name='info'),

    #2./manager_user/edit/
    url(r'^edit/$', views.edit_user, name='edit_user'),

    #2.5 REFRESH TOKEN
    url(r'^refresh_token/$', views.refresh_token, name='refresh_token'),

    #3./manager_user/nodes/
 #   url(r'^nodes/$', views.list_node, name='list_node'),

    #3.5 /manager_user/postnodes/node_id/
    url(r'^postnodes/(?P<node_id>.+)/$', views.postagain, name='postagain'),

    #4. /manager_user/nodes/node_id/
    url(r'^nodes/(?P<node_id>.+)/$', views.detail_node, name='detail_node'),

    #5. /manager_user/allnode/
    url(r'^allnode/$', views.allnode, name='allnode'),

    #6. /manager_user/servicenodes/
    url(r'^servicenodes/$', views.list_servicenode, name='list_servicenode'),

    #7. /manager_user/typerealestates/
    url(r'^typerealestates/$', views.list_typerealestate, name='list_typerealestate'),

    #8. /manager_user/typeservices/
    url(r'^typeservices/$', views.list_typeservice, name='list_typeservice'),
    
    #9. /manager_user/groupnodes/
    url(r'^groupnodes/$', views.list_groupnode, name='list_groupnode'),

    #9. /manager_user/buycoins/
    url(r'^buycoins/$', views.buycoin, name='buycoin'),
]