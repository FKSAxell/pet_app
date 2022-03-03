import 'dart:convert';

import 'package:pet_app/src/models/place_model.dart';

import 'package:http/http.dart' as http;

class PlacesServices {
  static Future<List<Place>> getPlacesVet() async {
    final url = Uri.https("apicursoflutter.herokuapp.com", 'places');
    final resp = await http.get(url);
    final List<Place> places = placeFromJson(resp.body);
    final vet = places.where((element) => element.category == "vet").toList();
    return vet;
  }
}
