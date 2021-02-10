import 'package:test_aspirante_flutter/model/route.model.dart';

import 'cast.model.dart';
import 'media.model.dart';

BillboardModel billboardModelFromJson(Map<String,dynamic> data) => BillboardModel.fromJson(data);

Map<String, dynamic> billboardModelToJson(BillboardModel data) =>data.toJson();

class BillboardModel {
  BillboardModel({
    this.movies,
    this.routes,
  });

  List<Movie> movies;
  List<Route> routes;

  factory BillboardModel.fromJson(Map<String, dynamic> json) => BillboardModel(
    movies: List<Movie>.from(json['movies'].map((dynamic x) => Movie.fromJson(x))),
    routes: List<Route>.from(json['routes'].map((dynamic x) => Route.fromJson(x))),
  );

  Map<String, dynamic> toJson() => <String, dynamic> {
    'movies': List<dynamic>.from(movies.map<dynamic>((x) => x.toJson())),
    'routes': List<dynamic>.from(routes.map<dynamic>((x) => x.toJson())),
  };
}

class Movie {
  Movie({
    this.rating,
    this.media,
    this.cast,
    this.cinemas,
    this.position,
    this.categories,
    this.genre,
    this.synopsis,
    this.length,
    this.releaseDate,
    this.distributor,
    this.id,
    this.name,
    this.code,
    this.originalName,
  });

  String rating;
  List<Media> media;
  List<Cast> cast;
  List<dynamic> cinemas;
  int position;
  List<String> categories;
  String genre;
  String synopsis;
  String length;
  String releaseDate;
  String distributor;
  int id;
  String name;
  String code;
  String originalName;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    rating: json['rating'],
    media: List<Media>.from(json['media'].map((dynamic x) => Media.fromJson(x))),
    cast: List<Cast>.from(json['cast'].map((dynamic x) => Cast.fromJson(x))),
    cinemas: List<dynamic>.from(json['cinemas'].map((dynamic x) => x)),
    position: json['position'],
    categories: List<String>.from(json['categories'].map((dynamic x) => x)),
    genre: json['genre'],
    synopsis: json['synopsis'],
    length: json['length'],
    releaseDate: json['release_date'],
    distributor: json['distributor'],
    id: json['id'],
    name: json['name'],
    code: json['code'],
    originalName: json['original_name'],
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'rating': rating,
    'media': List<dynamic>.from(media.map<dynamic>((dynamic x) => x.toJson())),
    'cast': List<dynamic>.from(cast.map<dynamic>((dynamic x) => x.toJson())),
    'cinemas': List<dynamic>.from(cinemas.map<dynamic>((dynamic x) => x)),
    'position': position,
    'categories': List<dynamic>.from(categories.map<dynamic>((dynamic x) => x)),
    'genre': genre,
    'synopsis': synopsis,
    'length': length,
    'release_date': releaseDate,
    'distributor': distributor,
    'id': id,
    'name': name,
    'code': code,
    'original_name': originalName,
  };
}





