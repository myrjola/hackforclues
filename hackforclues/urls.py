"""hackforclues URL Configuration"""
from django.conf.urls import url
from django.contrib import admin

from heritageclues.views import (clue1_nearby_pictures_view,
                                 nearby_pictures_view)

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^nearby_pictures', nearby_pictures_view),
    url(r'^clue1_nearby_pictures', clue1_nearby_pictures_view)
]
