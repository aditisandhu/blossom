import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LocationService {
  final String key = 'AIzaSyAi9LUQc127AeXYJGrV7Ib24FFw64o-C2w';

  Future<String> getPlaceId(String input) async {
    final String url = 'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key';
    
    var response = await http.get(Uri.parse(url));

    var json = convert.jsonDecode(response.body);

    var placeId = json['candidates'][0]['places_id'] as String;

    print(placeId);

    return placeId;
  }

  Future<LatLng> getPlace(String input, lat, lng) async {
    final String baseUrl = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=$key';
    final String location = '&location=$lat,$lng&radius=1000';
    final String keyword = '&keyword=$input';
    final String finalUrl = baseUrl + location + keyword;

    var response = await http.get(Uri.parse(finalUrl));
    var json = convert.jsonDecode(response.body);
    var results = json['results'];

    var placeId = results[0]['place_id'];
    
    final String placeUrl = 'https://maps.googleapis.com/maps/api/place/json?key=$key&place_id=$placeId&fields=name,rating,reviews,formatted_address,formatted_phone_number,user_ratings_total,geometry,website';

    var place_response = await http.get(Uri.parse(finalUrl));
    var place_json = convert.jsonDecode(response.body);
    var place_results = json['result'];

    var latLangPosition = place_results['geometry']['location'] as LatLng;
    return latLangPosition;
  }

}