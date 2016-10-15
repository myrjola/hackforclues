"""jsondumpster URL Configuration"""
from django.conf.urls import url, include
from django.contrib import admin

from rest_framework import routers

import dumpster.views

router = routers.DefaultRouter()
router.register(r'sensordata', dumpster.views.SensorDataViewSet)

urlpatterns = [
    url(r'^', include(router.urls)),
    url(r'^api-auth/', include('rest_framework.urls',
                               namespace='rest_framework')),
    url(r'^admin/', admin.site.urls),
]
