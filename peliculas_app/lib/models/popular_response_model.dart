// To parse this JSON data, do
//
//     final popularResponseModel = popularResponseModelFromMap(jsonString);

import 'dart:convert';

import 'package:peliculas_app/models/models.dart';

class PopularResponseModel {
  PopularResponseModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory PopularResponseModel.fromJson(String str) =>
      PopularResponseModel.fromMap(json.decode(str));

  factory PopularResponseModel.fromMap(Map<String, dynamic> json) =>
      PopularResponseModel(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
