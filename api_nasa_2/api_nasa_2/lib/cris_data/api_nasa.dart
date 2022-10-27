import 'dart:convert';
import 'dart:developer';
import 'package:api_nasa_2/core/apikey.dart';
import 'package:api_nasa_2/models/models_1.dart';
import 'package:http/http.dart' as http;

class Nasa {
  //
  Future<List<Photo>> useApi() async {
    try {
      final respuesta = await http.get(
        Uri.parse(
            "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=${Secrets().secretapikey}"),
      );

      final decoded = json.decode(respuesta.body);
      final x = NasaModel.fromJson(decoded);


      return x.photos;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
