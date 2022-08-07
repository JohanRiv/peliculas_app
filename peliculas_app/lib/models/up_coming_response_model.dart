// To parse this JSON data, do
//
//     final upComingResponseModel = upComingResponseModelFromMap(jsonString);

import 'dart:convert';

import 'package:peliculas_app/models/models.dart';

class UpComingResponseModel {
  UpComingResponseModel({
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

  factory UpComingResponseModel.fromJson(String str) =>
      UpComingResponseModel.fromMap(json.decode(str));

  factory UpComingResponseModel.fromMap(Map<String, dynamic> json) =>
      UpComingResponseModel(
        dates: Dates.fromMap(json["dates"]),
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
