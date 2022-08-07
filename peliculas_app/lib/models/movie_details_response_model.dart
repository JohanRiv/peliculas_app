// To parse this JSON data, do
//
//     final movieDetailsResponseModel = movieDetailsResponseModelFromMap(jsonString);

import 'dart:convert';

class MovieDetails {
  MovieDetails({
    required this.adult,
    this.backdropPath,
    this.belongsToCollection,
    required this.budget,
    required this.genres,
    this.homepage,
    required this.id,
    this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    this.overview,
    required this.popularity,
    this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    this.runtime,
    required this.spokenLanguages,
    required this.status,
    this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  bool adult;
  String? backdropPath;
  dynamic belongsToCollection;
  int budget;
  List<Genre> genres;
  String? homepage;
  int id;
  String? imdbId;
  String originalLanguage;
  String originalTitle;
  String? overview;
  double popularity;
  String? posterPath;
  List<ProductionCompany> productionCompanies;
  List<ProductionCountry> productionCountries;
  DateTime releaseDate;
  int revenue;
  int? runtime;
  List<SpokenLanguage> spokenLanguages;
  String status;
  String? tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  factory MovieDetails.fromJson(String str) =>
      MovieDetails.fromMap(json.decode(str));

  factory MovieDetails.fromMap(Map<String, dynamic> json) => MovieDetails(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        belongsToCollection: json["belongs_to_collection"],
        budget: json["budget"],
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromMap(x))),
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        productionCompanies: List<ProductionCompany>.from(
            json["production_companies"]
                .map((x) => ProductionCompany.fromMap(x))),
        productionCountries: List<ProductionCountry>.from(
            json["production_countries"]
                .map((x) => ProductionCountry.fromMap(x))),
        releaseDate: DateTime.parse(json["release_date"]),
        revenue: json["revenue"],
        runtime: json["runtime"],
        spokenLanguages: List<SpokenLanguage>.from(
            json["spoken_languages"].map((x) => SpokenLanguage.fromMap(x))),
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );
}

class Genre {
  Genre({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Genre.fromJson(String str) => Genre.fromMap(json.decode(str));

  factory Genre.fromMap(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );
}

class ProductionCompany {
  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  int id;
  String logoPath;
  String name;
  String originCountry;

  factory ProductionCompany.fromJson(String str) =>
      ProductionCompany.fromMap(json.decode(str));

  factory ProductionCompany.fromMap(Map<String, dynamic> json) =>
      ProductionCompany(
        id: json["id"],
        logoPath: json["logo_path"] == null ? "" : json["logo_path"],
        name: json["name"],
        originCountry: json["origin_country"],
      );
}

class ProductionCountry {
  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  String iso31661;
  String name;

  factory ProductionCountry.fromJson(String str) =>
      ProductionCountry.fromMap(json.decode(str));

  factory ProductionCountry.fromMap(Map<String, dynamic> json) =>
      ProductionCountry(
        iso31661: json["iso_3166_1"],
        name: json["name"],
      );
}

class SpokenLanguage {
  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  String englishName;
  String iso6391;
  String name;

  factory SpokenLanguage.fromJson(String str) =>
      SpokenLanguage.fromMap(json.decode(str));

  factory SpokenLanguage.fromMap(Map<String, dynamic> json) => SpokenLanguage(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
      );
}
