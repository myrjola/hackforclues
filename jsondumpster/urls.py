"""jsondumpster URL Configuration"""
from django.conf.urls import url, include
from django.contrib import admin

from rest_framework.authtoken.views import obtain_auth_token
from rest_framework import routers

import dumpster.views

router = routers.DefaultRouter()
router.register(r'sensordata', dumpster.views.SensorDataViewSet)

urlpatterns = [
    url(r'^admin/', admin.site.urls),

    url(r'^api/v1/', include(router.urls)),
    url(r'^api/v1/api-auth/', include('rest_framework.urls',
                                      namespace='rest_framework')),
    url(r'^api/v1/api-token-auth/', obtain_auth_token)
]
