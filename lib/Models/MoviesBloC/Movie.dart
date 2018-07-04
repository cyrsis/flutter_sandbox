import 'dart:async';
import 'dart:convert';
import 'package:flutter_sandbox/Api/api_key.dart';
import 'package:http/http.dart' as http;

class Movie {
  final String title, posterPath, overview;

  Movie(this.title, this.posterPath, this.overview);

  Movie.fromJson(Map json)
      : title = json['title'],
        posterPath = json['post_path'],
        overview = json['overview'];
}

class API {
  final http.Client _client = http.Client();

  static const String _url =
      'https://api.themoviedb.org/3/search/company?api_key=$api_key&query={1}';

  Future<List<Movie>> get(String query) async {
    List<Movie> list = [];

    await _client
        .get(Uri.parse(_url.replaceFirst("{1}", query)))
        .then((res) => res.body)
        .then(json.decode)
        .then((json) => json["results"])
        .then((movies) =>
            movies.forEach((movie) => list.add(Movie.fromJson(movie))));
    return list;
  }
}
