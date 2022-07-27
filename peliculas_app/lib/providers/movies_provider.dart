import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:peliculas_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseURL = "api.themoviedb.org";
  final String _apiKey = "d6edbcbe6223a8fe4ca52aaa8cdf1c3c";
  final String _lenguage = "en-Us";

  MoviesProvider() {
    print('Strart Provider');
    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    print('Gest Movies');
    var url = Uri.https(_baseURL, '/3/movie/now_playing', {
      'api_key': _apiKey,
      'lenguaje': _lenguage,
      'page': '1',
    });

    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponseModel.fromJson(response.body);

    print(nowPlayingResponse.results[0].posterPath);
  }
}
