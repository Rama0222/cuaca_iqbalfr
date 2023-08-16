import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:cuaca_iqbalfr/cuaca.dart';

class HttpHelper {
  final String urlKey =
      "https://ibnux.github.io/BMKG-importer/cuaca/501315.json";
  final String urlUpcoming = "/upcoming?";
  final String urlLanguage = "&language=en-US";

  Future<List> getUpcoming() async {
    final String upcoming = urlKey;
    Response result = await get(Uri.parse(upcoming));

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final List moviesMap = jsonResponse;

      List movies = moviesMap.map((e) => cuaca1.fromJson(e)).toList();
      return movies;
    } else {
      return [];
    }
  }

  Future<List> findMovies(String title) async {
    final String query = title;
    Response result = await get(Uri.parse(query));

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final List moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((e) => cuaca1.fromJson(e)).toList();
      return movies;
    } else {
      return [];
    }
  }
}
