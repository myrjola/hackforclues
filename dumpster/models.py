from django.db import models
from django.contrib.postgres.fields import JSONField
from django.contrib.auth.models import User, AnonymousUser


class SensorData(models.Model):
    timestamp = models.DateTimeField(auto_now=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE, editable=False,
                             null=True)
    payload = JSONField()
