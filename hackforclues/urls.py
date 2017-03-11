"""hackforclues URL Configuration"""
from django.conf.urls import url, include
from django.contrib import admin

from heritageclues.views import clue1_nearby_pictures

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^clue1_nearby_pictures', clue1_nearby_pictures)
]
