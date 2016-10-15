import json

from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt

from rest_framework import viewsets

from .serializers import SensorDataSerializer
from .models import SensorData


class SensorDataViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows SensorData to be viewed and edited
    """
    queryset = SensorData.objects.all().order_by('-timestamp')
    serializer_class = SensorDataSerializer
