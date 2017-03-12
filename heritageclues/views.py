from django.http import JsonResponse

import requests
from xml.etree import ElementTree


def parse_coordinates(coordinate_str):
    '''Converts the coordinate string "lat,lon" to {'lat':lat, 'lon':lon}.'''
    coords = coordinate_str.split(',')
    return {'lat': coords[0], 'lon': coords[1]}


def clue1_nearby_pictures_view(request):
    '''Returns the nearby pictures to our first clue, which is the Molin's fountain
in Kungsträdgården.'''
    return nearby_pictures(18.0717608285984, 59.3307800539639)


def nearby_pictures_view(request):
    '''Returns the nearby pictures to the coordinates given in the 'lat' and 'lon'
GET parameters'''
    lat = float(request.GET['lat'])
    lon = float(request.GET['lon'])
    return nearby_pictures(lat, lon)


def nearby_pictures(lat, lon):
    '''Returns the nearby pictures to the given coordinates.'''
    # The third decimal point
    delta = 0.001

    west = lat - delta
    east = lat + delta
    south = lon - delta
    north = lon + delta
    query_url = ('http://kulturarvsdata.se/ksamsok/api?' +
                 'method=search&hitsPerPage=10&x-api=hfswe' +
                 '&query=boundingBox=/WGS84%22%20' +
                 '%20'.join([str(dir) for dir in [west, south, east, north]]))

    response = requests.get(query_url)
    nearby_records = ElementTree.fromstring(response.content)

    ns = {
        'rdf': 'http://www.w3.org/1999/02/22-rdf-syntax-ns#',
        'ns5': 'http://kulturarvsdata.se/ksamsok#',
        'pres': 'http://kulturarvsdata.se/presentation#',
        'gml': 'http://www.opengis.net/gml'
    }

    # According to http://gis.stackexchange.com/a/8674 we should move about 100
    # meters by modifying the third decimal.
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
