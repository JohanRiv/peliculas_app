import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:peliculas_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseURL = "api.themoviedb.org";
  final String _apiKey = "d6edbcbe6223a8fe4ca52aaa8cdf1c3c";
  final String _lenguage = "en-Us";

  List<Movie> movieList = [];
  List<Movie> movieInfiniteList = [];
  List<Movie> popularMovieList = [];
  List<Movie> topReatedMovieList = [];
  List<Movie> upComingMovieList = [];

  Map<int, List<Cast>> castMap = {};

  String body = "";
  int incrementalPage = 0;

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
    getTopReatedtMovies();
    getUpCommingMovies();
    getOnDisplayInfiniteMovies();
  }

  _movieRequest(String endPoint, [String page = "1"]) async {
    var url = Uri.https(_baseURL, endPoint,
        {'api_key': _apiKey, 'lenguaje': _lenguage, 'page': page});
    final response = await http.get(url);
    body = response.body;
  }

  Future<List<Cast>> getMovieCasting(int movieId) async {
    String endPoint = '/3/movie/$movieId/credits';
    var url = Uri.https(
        _baseURL, endPoint, {'api_key': _apiKey, 'lenguaje': _lenguage});
    if (castMap.isEmpty) {
      final response = await http.get(url);
      final movieCastList =
          MovieCastingResponseModel.fromJson(response.body).cast;
      castMap[movieId] = movieCastList;
      return movieCastList;
    } else if (castMap.containsKey(movieId)) {
      return castMap[movieId] as List<Cast>;
    } else {
      final response = await http.get(url);
      final movieCastList =
          MovieCastingResponseModel.fromJson(response.body).cast;
      castMap[movieId] = movieCastList;
      return movieCastList;
    }
  }

  getPopularMovies() async {
    String endPoint = '/3/movie/popular';
    await _movieRequest(endPoint);
    final popularResponse = PopularResponseModel.fromJson(body);
    popularMovieList = popularResponse.results;
    notifyListeners();
  }

  getTopReatedtMovies() async {
    String endPoint = '/3/movie/top_rated';
    await _movieRequest(endPoint);
    final topReatedResponse = TopReatedResponseModel.fromJson(body);
    topReatedMovieList = topReatedResponse.results;
    notifyListeners();
  }

  getUpCommingMovies() async {
    String endPoint = '/3/movie/upcoming';
    await _movieRequest(endPoint);
    final upComingResponse = TopReatedResponseModel.fromJson(body);
    upComingMovieList = upComingResponse.results;
    notifyListeners();
  }

  getOnDisplayMovies() async {
    String endPoint = '/3/movie/now_playing';
    await _movieRequest(endPoint);
    final nowPlayingResponse = NowPlayingResponseModel.fromJson(body);
    movieList = nowPlayingResponse.results;
    notifyListeners();
  }

  getOnDisplayInfiniteMovies() async {
    String endPoint = '/3/movie/now_playing';
    incrementalPage++;
    await _movieRequest(endPoint, incrementalPage.toString());
    final nowPlayingResponse = NowPlayingResponseModel.fromJson(body);
    movieInfiniteList = [...movieInfiniteList, ...nowPlayingResponse.results];
    notifyListeners();
  }
}
