// To parse this JSON data, do
//
//     final nowPlayingResponseModel = nowPlayingResponseModelFromMap(jsonString);

import 'dart:convert';

import 'package:peliculas_app/models/models.dart';

class NowPlayingResponseModel {
  NowPlayingResponseModel({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  Dates dates;
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory NowPlayingResponseModel.fromJson(String str) =>
      NowPlayingResponseModel.fromMap(json.decode(str));

  factory NowPlayingResponseModel.fromMap(Map<String, dynamic> json) =>
      NowPlayingResponseModel(
        dates: Dates.fromMap(json["dates"]),
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
