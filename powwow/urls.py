from django.conf.urls import patterns, url

from powwow import views

urlpatterns = patterns('',
    url(r'^$', views.index, name='index'),
    url(r'^billboard/(\d+)/$', 'powwow.views.billboard'),
    url(r'^announcement/(\d+)/$', 'powwow.views.announcement'),
    # login 
    url(r'^login/', 'django.contrib.auth.views.login', {'template_name': 'powwow/login.html'}),

)
