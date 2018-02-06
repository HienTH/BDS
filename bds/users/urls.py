from django.conf.urls import url
from . import views
urlpatterns= [
    #USER
    #1./manager_user/info/
    url(r'^info/$', views.info, name='info'),

    #2./manager_user/edit/
    url(r'^edit/$', views.edit_user, name='edit_user'),

    #2./manager_user/editavatar/
    url(r'^editavatar/$', views.edit_avataruser, name='edit_avataruser'),

    #2.5 REFRESH TOKEN
    url(r'^refresh_token/$', views.refresh_token, name='refresh_token'),

    #3./manager_user/nodes/
    url(r'^nodes/$', views.list_node, name='list_node'),

    #3.2/manager_user/nodefalse/
    url(r'^nodefalse/$', views.list_nodefalse, name='list_nodefalse'),

    #3.3/manager_user/nodewait/
    url(r'^nodewait/$', views.list_nodewait, name='list_nodewait'),

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

    #10. /manager_user/buycoins/
    url(r'^buycoins/$', views.buycoin, name='buycoin'),

    #11. /manager_user/duanquantams/
    url(r'^duanquantams/$', views.duanquantam, name='duanquantam'),

    #12. /manager_user/kiemtraduanquantam/
    url(r'^kiemtraduanquantam/$', views.kiemtraduanquantam, name='kiemtraduanquantam'),

    #13. /manager_user/boduanquantam/
    url(r'^boduanquantam/$', views.boduanquantam, name='boduanquantam'),

    #14. /manager_user/lichsugiaodich/
    url(r'^lichsugiaodich/$', views.lichsugiaodich, name='lichsugiaodich'),

    #15./manager_user/changepassword/
    url(r'^changepassword/$', views.changepass, name='changepass'),

    #16./manager_user/danhsachthongbao/
    url(r'^danhsachthongbao/$', views.danhsachthongbao, name='danhsachthongbao'),

    #17./manager_user/danhsachthongbao/
    url(r'^danhsachthongbao/(?P<thongbao_id>.+)/$', views.chitietthongbao, name='chitietthongbao'),
    
    #18./manager_user/uploadpanorama/
    url(r'^uploadpanorama/$', views.upload_panorama, name='upload_panorama'),

    #19./manager_user/uploadanh360/
    url(r'^uploadanh360/$', views.upload_anh360, name='upload_anh360'),

    #20./manager_user/uploadvideo/
    url(r'^uploadvideo/$', views.upload_video, name='upload_video'),

    #21./manager_user/uploadthumbnail/
    url(r'^uploadthumbnail/$', views.upload_thumbnail, name='upload_thumbnail'),

    #22./manager_user/delete_thumbnail/
    url(r'^deletethumbnail/$', views.delete_thumbnail, name='delete_thumbnail'),

]