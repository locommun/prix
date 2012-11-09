from django.conf.urls import patterns, url

from powwow import views

urlpatterns = patterns('',
    url(r'^$', views.index, name='index'),
    url(r'^billboard/(\d+)/$', 'powwow.views.billboard'),
    url(r'^announcement/(\d+)/$', 'powwow.views.announcement'),
)