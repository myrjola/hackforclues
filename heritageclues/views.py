from django.http import JsonResponse

import requests
from xml.etree import ElementTree

'''Returns the nearby pictures to our first clue, which is the Molin's fountain
in Kungsträdgården.'''
def clue1_nearby_pictures(request):
    response = requests.get('http://kulturarvsdata.se/ksamsok/api?method=search&hitsPerPage=10&x-api=hfswe&query=boundingBox=/WGS84%2218.0707608285980%2059.3297800539630%2018.0727608285985%2059.3317800539640%22')
    nearby_records = ElementTree.fromstring(response.content)

    ns = {'rdf': 'http://www.w3.org/1999/02/22-rdf-syntax-ns#',
          'ns5': 'http://kulturarvsdata.se/ksamsok#',
          'pres': 'http://kulturarvsdata.se/presentation#'}

    rdf_records = [record.find("rdf:RDF", ns)
                   for record in nearby_records.iter('record')]

    # Find only images
    image_path = "./rdf:Description/ns5:lowresSource"
    rdf_records = [record for record in rdf_records
                   if record.find(image_path, ns)
                   is not None]

    nearby_pictures = [
        {
            'image': rdf_record.find(image_path, ns).text
        }
        for rdf_record in rdf_records
    ]

    return JsonResponse(nearby_pictures, safe=False)
