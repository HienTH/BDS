from django.conf.urls import url
from . import views
urlpatterns= [
    #ADMIN
    
    #1./manager/admins/
    url(r'^admins/$', views.list_admin, name='list_admin'),
    url(r'^admins/(?P<admin_id>.+)/$', views.detail_admin, name='detail_admin'),

    #2./manager/users/
    url(r'^users/$', views.list_user, name='list_user'),
    url(r'^users/(?P<user_id>.+)/$', views.detail_user, name='detail_user'),

    #3./manager/mods/
    url(r'^mods/$', views.list_mod, name='list_mod'),
    url(r'^mods/(?P<mod_id>.+)/$', views.detail_mod, name='detail_mod'),

    #4./manager/smods/
    url(r'^smods/$', views.list_smod, name='list_smod'),
    url(r'^smods/(?P<smod_id>.+)/$', views.detail_smod, name='detail_smod'),

    #5./manager/typerealestate/
    url(r'^typerealestates/$', views.list_typerealestate, name='list_typerealestate'),
    url(r'^typerealestates/(?P<typerealestate_id>.+)/$', views.detail_typerealestate, name='detail_typerealestate'),

    #6./manager/realestatenode/
    url(r'^realestatenodes/$', views.list_realestatenode, name='list_realestatenode'),
    url(r'^realestatenodes/(?P<realestatenode_id>.+)/$', views.detail_realestatenode, name='detail_realestatenode'),

    #7./manager/loaiduan/
    url(r'^loaiduans/$', views.list_loaiduan, name='list_loaiduan'),
    url(r'^loaiduans/(?P<loaiduan_id>.+)/$', views.detail_loaiduan, name='detail_loaiduan'),

    #8./manager/duan/
    url(r'^duans/$', views.list_duan, name='list_duan'),
    url(r'^duans/(?P<duan_id>.+)/$', views.detail_duan, name='detail_duan'),

    #9./manager/typeservice/
    url(r'^typeservices/$', views.list_typeservice, name='list_typeservice'),
    url(r'^typeservices/(?P<typeservice_id>.+)/$', views.detail_typeservice, name='detail_typeservice'),

    #10./manager/servicenode/
    url(r'^servicenodes/$', views.list_servicenode, name='list_servicenode'),
    url(r'^servicenodes/(?P<servicenode_id>.+)/$', views.detail_servicenode, name='detail_servicenode'),

    #11./manager/groupnode/
    url(r'^groupnodes/$', views.list_groupnode, name='list_groupnode'),
    url(r'^groupnodes/(?P<groupnode_id>.+)/$', views.detail_groupnode, name='detail_groupnode'),

    #13./manager/change_coin/
    url(r'^change_coin/$', views.change_coin, name='change_coin'),



##########################################################################
    #Nguoi dung chua dang nhap
    #1. /user/create/
    url(r'^create/$', views.create_user, name='create_user'),

    #1.4 /user/check-mail/
    url(r'^check_mail/$', views.check_mail, name='check_mail'),
    
    #1.5 /user/confirm-email/<token>/
    #([a-zA-Z0-9\-_]+?\.[a-zA-Z0-9\-_]+?\.([a-zA-Z0-9\-_]+)?)
    url(r'^confirm-email/(?P<token>[\w\.-]+)/$', views.confirm_user, name='confirm_user'),

    #1.6 /user/reset-password/<token>/
    url(r'^reset-password/(?P<token>[\w\.-]+)/$', views.resetpassword, name='resetpassword'),

    #1.7 /user/set-password/
    url(r'^set-password/$', views.setpassword, name='setpassword'),

    #1.9 /user/recaptcha/
    url(r'^recaptcha/$', views.grecaptcha_verify, name='grecaptcha_verify'),


##############Tim DIA DIEM
    #3. /user/find-service/
    url(r'^find_service/$', views.find_service, name='find_service'),


##########NGuoi dung binh thuong xem thong tin cua SALES
    #4. /user/profile
    url(r'^profile/$', views.profile, name='profile'),

#########Xem thong tin chi tiet
    #6. /user/servicenodes/
    url(r'^servicenodes/$', views.list_servicenode, name='list_servicenode'),

    #7. /user/typerealestates/
    url(r'^typerealestates/$', views.list_typerealestate, name='list_typerealestate'),

    #8. /user/typeservices/
    url(r'^typeservices/$', views.list_typeservice, name='list_typeservice'),
    
    #9. /user/groupnodes/
    url(r'^groupnodes/$', views.list_groupnode, name='list_groupnode'),

    #9.3 /user/tatcaduan/
    url(r'^tatcaduan/$', views.tatcaduan, name='tatcaduan'),


#########CHI tie duan - node
    #9.5 /user/chitietduan/
    url(r'^chitietduan/$', views.chitietduan, name='chitietduan'),

    #9.7 /user/chitietnode/
    url(r'^chitietnode/$', views.chitietnode, name='chitietnode'),

######Xac dinh bound cho huyen, tinh
    #10. /user/distric/
    url(r'^distric/$', views.bound_distric, name='bound_distric'),

    #10.1 /user/province/
    #url(r'^province/$', views.bound_province, name='bound_province'),

    #10.2 /user/ward/
    url(r'^ward/$', views.bound_ward, name='bound_ward'),


####################################TIM KIEM########################################
    #11. /search/node-buy/
    url(r'^node-buy/$', views.searchnodebuy, name='searchnodebuy'),

    #10. /search/node-sell/
    url(r'^node-hire/$', views.searchnodehire, name='searchnodehire'),


######TIM KIEM chung
    url(r'^searchall/$', views.searchall, name='searchall'),

######TIM KIEM node
    #11.9.3 /searchnode/
    url(r'^searchnode/$', views.searchnode, name='searchnode'),

######TIM KIEM project
    #11.9.5 /searchproject/
    url(r'^searchproject/$', views.searchproject, name='searchproject'),


    #11.9.6 Tim servicenode
    url(r'^searchservicebound/$', views.searchservicebound, name='searchservicebound'),

    #13. /search/duan/ hien thi tat ca cac node thuoc du an
    url(r'^duan/$', views.nodeinduan, name='nodeinduan'),

###########Cac node/duan lien quan den node/duan
    #13.3  /search/duannangcao/ Search node/duan lien quan theo duan
    url(r'^duannangcao/$', views.searchduantuongtu, name='searchduantuongtu'),
    
    #13.6  /search/nodenangcao/ Search node/duan lien quan theo node
    url(r'^nodenangcao/$', views.searchnodenangcao, name='searchnodenangcao'),

###########Goi y sau khi nhap vao input
    #13.7 /search/duanbasic/ goi y sau khi nhap vao o input
    url(r'^duanbasic/$', views.searchduanbasic, name='searchduanbasic'),

    #15. Tien do du an. /search/tiendoduan/
    url(r'^tiendoduan/$', views.getTiendoduanbyID, name='getTiendoduanbyID'),

    #17. gui phan hoi. /search/guiphanhoi/
    url(r'^guiphanhoi/$', views.guiphanhoi, name='guiphanhoi'),
    
]
"""
    #11.5 /search/nodehire/ tim node cho thue
    url(r'^nodehire/$', views.searchhire, name='searchhire'),

    #11.6 /search/nodebuy/ tim node cho ban
    url(r'^nodebuy/$', views.searchbuy, name='searchbuy'),

    #11.7 /search/nodebuyhire/ tim node cho ban, thue
    url(r'^nodebuyhire/$', views.searchbuyhire, name='searchbuyhire'),

### Tim kiem co ban
    #11.8 /search/nodebasic/ tim node coban
    url(r'^nodebasic/$', views.searchbasic, name='searchbasic'),

    #11.8.1 /search/nodebasicbuy/ tim node coban
    url(r'^nodebasicbuy/$', views.searchbasicbuy, name='searchbasicbuy'),

### Tim kiem nang cao
    #11.9.1 /search/nodeadvan/ tim node nang cao
    url(r'^nodeadvan/$', views.searchadvan, name='searchadvan'),

    #11.9.2 /search/nodeadvanbuy/ tim node nang cao mua
    url(r'^nodeadvanbuy/$', views.searchadvanbuy, name='searchadvanbuy'),

    #11.9.3 /search/nodeadvanhire/ tim node nang cao thue
    url(r'^nodeadvanhire/$', views.searchadvanhire, name='searchadvanhire'),
"""