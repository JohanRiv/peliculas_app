// To parse this JSON data, do
//
//     final searchMovieResponseModel = searchMovieResponseModelFromMap(jsonString);

import 'dart:convert';

import 'models.dart';

class SearchMovieResponseModel {
  SearchMovieResponseModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory SearchMovieResponseModel.fromJson(String str) =>
      SearchMovieResponseModel.fromMap(json.decode(str));

  factory SearchMovieResponseModel.fromMap(Map<String, dynamic> json) =>
      SearchMovieResponseModel(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
