"""hackforclues URL Configuration"""
from django.conf.urls import url, include
from django.contrib import admin

from rest_framework import routers

router = routers.DefaultRouter()

urlpatterns = [
    url(r'^admin/', admin.site.urls),

    url(r'^api/v1/', include(router.urls)),
    url(r'^api/v1/api-auth/', include('rest_framework.urls',
                                      namespace='rest_framework')),
]
