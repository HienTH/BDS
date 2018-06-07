from django.conf.urls import url, include
from chat.api import MessageModelViewSet
from . import views

urlpatterns = [
    url(r'^message/$', views.list, name="list"),
    url(r'^message/(?P<message_id>.+)/$', views.getMessageById, name="getMessageById"),
    url(r'^send/$', views.send, name="send"),
]