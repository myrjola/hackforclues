from django.http import JsonResponse

import requests
from xml.etree import ElementTree


def parse_coordinates(coordinate_str):
    '''Converts the coordinate string "lat,lon" to {'lat':lat, 'lon':lon}.'''
    coords = coordinate_str.split(',')
    return {'lat': coords[0], 'lon': coords[1]}


def clue1_nearby_pictures(request):
    '''Returns the nearby pictures to our first clue, which is the Molin's fountain
in Kungsträdgården.'''
    response = requests.get('http://kulturarvsdata.se/ksamsok/api?' +
                            'method=search&hitsPerPage=10&x-api=hfswe' +
                            '&query=boundingBox=/WGS84%22' +
                            '18.0707608285980%2059.3297800539630' +
                            '%2018.0727608285985%2059.3317800539640%22')
    nearby_records = ElementTree.fromstring(response.content)

    ns = {
        'rdf': 'http://www.w3.org/1999/02/22-rdf-syntax-ns#',
        'ns5': 'http://kulturarvsdata.se/ksamsok#',
        'pres': 'http://kulturarvsdata.se/presentation#',
        'gml': 'http://www.opengis.net/gml'
    }

    rdf_records = [record.find("rdf:RDF", ns)
                   for record in nearby_records.iter('record')]

    # Find only images
    image_path = "./rdf:Description/ns5:lowresSource"
    rdf_records = [record for record in rdf_records
                   if record.find(image_path, ns) is not None]

    label_path = "./rdf:Description/ns5:presentation/pres:item/pres:id"
    coord_path = "./rdf:Description/ns5:coordinates/gml:Point/gml:coordinates"
    nearby_pictures = [
        {
            'label': record.find(label_path, ns).text,
            'image': record.find(image_path, ns).text,
            'coordinates': parse_coordinates(record.find(coord_path, ns).text)
        }
        for record in rdf_records
    ]

    return JsonResponse(nearby_pictures, safe=False)
