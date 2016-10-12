import json

from django.http import HttpResponse, HttpResponseBadRequest
from dumpster.models import SensorData
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def upload(request):
    payload_unicode = request.body.decode('utf-8')
    payload = json.loads(payload_unicode)
    sensordata = SensorData(payload=payload)
    sensordata.save()
    return HttpResponse("Data accepted")
