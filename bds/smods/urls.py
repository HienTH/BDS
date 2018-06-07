from django.conf.urls import url
from . import views
urlpatterns= [
    #SMOD
    #1./manager_smod/users/
    url(r'^users/$', views.list_user, name='list_user'),
    url(r'^users/(?P<user_id>.+)/$', views.detail_user, name='detail_user'),

    #2./manager_smod/userfalse/
    url(r'^userfalse/$', views.userfalse, name='userfalse'),

    #3.5./manager_smod/info/
    url(r'^info/$', views.info, name='info'),

    #3./manager_smod/edit/
    url(r'^edit/$', views.edit_smod, name='edit_smod'),

    #4./manager_smod/changepassword/
    url(r'^changepassword/$', views.changepass, name='changepass'),

    #6./manager_smod/mods/
    url(r'^mods/$', views.list_mod, name='list_mod'),

    #6.5 /manager_smod/allmod/
    url(r'^allmod/$', views.allmod, name='allmod'),

    #7./manager_smod/mods/id/
    url(r'^mods/(?P<mod_id>.+)/$', views.detail_mod, name='detail_mod'),

    #/manager_smod/allnode/
    url(r'^allnode/$', views.allnode, name='allnode'),

    #/manager_smod/nodefalse/ Node chua duyet
    url(r'^nodefalse/$', views.list_nodefalse, name='list_nodefalse'),

    #11,12,13, 14./manager_smod/nodes/
    url(r'^nodes/$', views.list_node, name='list_node'),
    url(r'^nodes/(?P<node_id>.+)/$', views.detail_node, name='detail_node'),

    #15,16 /manager_smod/servicenodes/
    url(r'^servicenodes/$', views.list_servicenode, name='list_servicenode'),
    url(r'^servicenodes/(?P<servicenode_id>.+)/$', views.detail_servicenode, name='detail_servicenode'),

    #17. /manager_smod/typeservices/
    url(r'^typeservices/$', views.list_typeservice, name='list_typeservice'),

    #18./manager_smod/typerealestate/
    url(r'^typerealestates/$', views.list_typerealestate, name='list_typerealestate'),

    #19./manager_smod/groupnode/
    url(r'^groupnodes/$', views.list_groupnode, name='list_groupnode'),
    url(r'^groupnodes/(?P<groupnode_id>.+)/$', views.detail_groupnode, name='detail_groupnode'),

    #20./manager_smod/confirm_node/
    url(r'^confirm_node/$', views.confirm_node, name='confirm_node'),

    #21./manager_smod/duan/
    url(r'^duans/$', views.list_duan, name='list_duan'),
    url(r'^duans/(?P<duan_id>.+)/$', views.detail_duan, name='detail_duan'),

    #22./manager_smod/change_coin/
    url(r'^change_coin/$', views.change_coin, name='change_coin'),

    ###./manager_smod/historys/
    url(r'^historys/$', views.list_history, name='list_history'),



    ###./manager_smod/tiendoduans/
    url(r'^tiendoduans/$', views.list_tiendo, name='list_tiendo'),

    ###./manager_smod/tiendoduans/<id>/
    url(r'^tiendoduans/(?P<id>.+)/$', views.detail_tiendo, name='detail_tiendo'),


    #19./manager_smod/duyetcoin
    url(r'^duyetcoin/$', views.duyetcoin, name='duyetcoin'),

    #20./manager_smod/danhsachduyetcoin
    url(r'^danhsachduyetcoin/$', views.danhsachduyetcoin, name='danhsachduyetcoin'),

    #31./manager_mod/uploadpanorama/
    url(r'^uploadpanorama/$', views.upload_panorama, name='upload_panorama'),

    #32./manager_mod/uploadanh360/
    url(r'^uploadanh360/$', views.upload_anh360, name='upload_anh360'),

    #34./manager_mod/uploadthumbnail/
    url(r'^uploadthumbnail/$', views.upload_thumbnail, name='upload_thumbnail'),
]