from django.db import models
from django.contrib.postgres.fields import JSONField

class SensorData(models.Model):
    timestamp = models.DateTimeField(auto_now=True)
    payload = JSONField()
