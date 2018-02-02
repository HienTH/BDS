from django.conf.urls import url
from . import views
urlpatterns= [
    #MOD
    #1./manager_mod/users/
    url(r'^users/$', views.list_user, name='list_user'),
    url(r'^users/(?P<user_id>.+)/$', views.detail_user, name='detail_user'),

    #2./manager_mod/userfalse/
    url(r'^userfalse/$', views.userfalse, name='userfalse'),

    #3.5./manager_mod/info/
    url(r'^info/$', views.info, name='info'),
    
    #3./manager_mod/edit/
    url(r'^edit/$', views.edit_mod, name='edit_mod'),

    #4./manager_mod/changepassword/
    url(r'^changepassword/$', views.changepass, name='changepass'),

    #6. /manager_mod/mods/
    url(r'^mods/$', views.list_mod, name='list_mod'),

    #7,8. /manager_mod/nodes/
    url(r'^nodes/$', views.list_node, name='list_node'),
    url(r'^nodes/(?P<node_id>.+)/$', views.detail_node, name='detail_node'),

    #9. /manager_mod/typerealestate/
    url(r'^typerealestates/$', views.list_typerealestate, name='list_typerealestate'),

    #10./manager_mod/confirm_node/
    url(r'^confirm_node/$', views.confirm_node, name='confirm_node'),
    
    #11./manager_mod/duans/
    url(r'^duans/$', views.list_duan, name='list_duan'),
    url(r'^duans/(?P<duan_id>.+)/$', views.detail_duan, name='detail_duan'),

    #12 /manager_mod/servicenodes/
    url(r'^servicenodes/$', views.list_servicenode, name='list_servicenode'),
    url(r'^servicenodes/(?P<servicenode_id>.+)/$', views.detail_servicenode, name='detail_servicenode'),

    #13./manager_mod/groupnode/
    url(r'^groupnodes/$', views.list_groupnode, name='list_groupnode'),
    url(r'^groupnodes/(?P<groupnode_id>.+)/$', views.detail_groupnode, name='detail_groupnode'), 

    #14./manager_mod/change_coin/
    url(r'^change_coin/$', views.change_coin, name='change_coin'),

    #15./manager_mod/historys/
    url(r'^historys/$', views.list_history, name='list_history'),

    #16./manager_mod/tiendoduans/
    url(r'^tiendoduans/$', views.list_tiendo, name='list_tiendo'),

    #17./manager_mod/tiendoduans/<id>/
    url(r'^tiendoduans/(?P<id>.+)/$', views.detail_tiendo, name='detail_tiendo'),



    #19./manager_mod/duyetcoin
    url(r'^duyetcoin/$', views.duyetcoin, name='duyetcoin'),

    #20./manager_mod/danhsachduyetcoin
    url(r'^danhsachduyetcoin/$', views.danhsachduyetcoin, name='danhsachduyetcoin'),



    ####Thong bao nguoi dung.
    #21./manager_mod/guithongbao/
    url(r'^guithongbao/$', views.guithongbao, name='guithongbao'),

    #22./manager_mod/themthongbaochinh/
    url(r'^themthongbaochinh/$', views.themthongbaochinh, name='themthongbaochinh'),

    #27./manager_mod/chitietthongbaochinh/<id>/
    url(r'^chitietthongbaochinh/(?P<thongbao_id>.+)/$', views.chitietthongbaochinh, name='chitietthongbaochinh'),

    #26./manager_mod/suathongbaochinh/<id>/
    url(r'^suathongbaochinh/(?P<thongbao_id>.+)/$', views.suathongbaochinh, name='suathongbaochinh'),

    #23./manager_mod/danhsachthongbaochinh/
    url(r'^danhsachthongbaochinh/$', views.danhsachthongbaochinh, name='danhsachthongbaochinh'),

    #24./manager_mod/danhsachthongbaodagui/
    url(r'^danhsachthongbaodagui/$', views.danhsachthongbaodagui, name='danhsachthongbaodagui'),

    #24./manager_mod/danhsachphanhoi/
    url(r'^danhsachphanhoi/$', views.danhsachphanhoi, name='danhsachphanhoi'),

]