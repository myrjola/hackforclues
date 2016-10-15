from rest_framework import viewsets

from .serializers import SensorDataSerializer
from .models import SensorData


class SensorDataViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows SensorData to be viewed and edited
    """
    queryset = SensorData.objects.all()
    serializer_class = SensorDataSerializer

    def get_queryset(self):
        """
        This view should return a list of all the sensordata objects for the
        currently authenticated user. Admins get access to all sensordata.
        """
        user = self.request.user
        if user.is_superuser:
            return SensorData.objects.all()

        return SensorData.objects.filter(user=user)
