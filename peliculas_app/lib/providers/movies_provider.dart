import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:peliculas_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseURL = "api.themoviedb.org";
  final String _apiKey = "d6edbcbe6223a8fe4ca52aaa8cdf1c3c";
  final String _lenguage = "en-Us";

  List<Movie> movieList = [];
  List<Movie> popularMovieList = [];
  List<Movie> topReatedMovieList = [];
  List<Movie> upComingMovieList = [];
  MovieDetails? movieDetails = null;

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
    getTopReatedtMovies();
    getUpCommingMovies();
  }

  getMovieDetails(String idMovie) async {
    var url = Uri.https(_baseURL, '/3/movie/' + idMovie, {
      'api_key': _apiKey,
      'lenguaje': _lenguage,
    });

    final response = await http.get(url);
    final movieDetailsResponse = MovieDetails.fromJson(response.body);
    movieDetails = movieDetailsResponse;
    notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https(_baseURL, '/3/movie/popular', {
      'api_key': _apiKey,
      'lenguaje': _lenguage,
      'page': '1',
    });

    final response = await http.get(url);
    final popularResponse = PopularResponseModel.fromJson(response.body);
    popularMovieList = popularResponse.results;
    notifyListeners();
  }

  getTopReatedtMovies() async {
    var url = Uri.https(_baseURL, '/3/movie/top_rated', {
      'api_key': _apiKey,
      'lenguaje': _lenguage,
      'page': '1',
    });

    final response = await http.get(url);
    final topReatedResponse = TopReatedResponseModel.fromJson(response.body);
    topReatedMovieList = topReatedResponse.results;
    notifyListeners();
  }

  getUpCommingMovies() async {
    var url = Uri.https(_baseURL, '/3/movie/upcoming', {
      'api_key': _apiKey,
      'lenguaje': _lenguage,
      'page': '1',
    });

    final response = await http.get(url);
    final upComingResponse = TopReatedResponseModel.fromJson(response.body);
    upComingMovieList = upComingResponse.results;
    notifyListeners();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseURL, '/3/movie/now_playing', {
      'api_key': _apiKey,
      'lenguaje': _lenguage,
      'page': '1',
    });

    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponseModel.fromJson(response.body);
    movieList = nowPlayingResponse.results;
    notifyListeners();
  }
}
