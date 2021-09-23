import 'dart:async';
import 'dart:convert';

import 'package:movies_app/src/models/actors_model.dart';
import 'package:movies_app/src/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MoviesProvider {
  String _apiKey = '54c9dd200803839e761c0baf0886694c';
  String _url = 'api.themoviedb.org';
  String _language = 'es';

  int _popularPage = 0;
  bool _loading = false;

  List<Movie> _popular = new List();

  final _popularStreamController = StreamController<List<Movie>>.broadcast();

  Function(List<Movie>) get popularSink => _popularStreamController.sink.add;

  Stream<List<Movie>> get popularStream => _popularStreamController.stream;

  void disposeStreams() {
    _popularStreamController?.close();
  }

  Future<List<Movie>> getInTheaters() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
    });

    return await _processResponse(url);
  }

  Future<List<Movie>> getPopular() async {
    if (_loading) return [];

    _loading = true;

    _popularPage++;

    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': _popularPage.toString()
    });

    final response = await _processResponse(url);

    _popular.addAll(response);

    popularSink(_popular);

    _loading = false;

    return response;
  }

  Future<List<Movie>> _processResponse(Uri url) async {
    final response = await http.get(url);
    final decodeData = json.decode(response.body);
    final movies = new Movies.fromJsonList(decodeData['results']);
    return movies.items;
  }

  Future<List<Actor>> getCast(String movieId) async {
    final url = Uri.http(_url, '3/movie/$movieId/credits', {
      'api_key': _apiKey,
      'language': _language,
    });

    final response = await http.get(url);
    final decodeData = json.decode(response.body);
    final cast = Cast.fromJsonList(decodeData['cast']);

    return cast.actors;
  }

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.https(_url, '3/search/movie', {
      'api_key': _apiKey,
      'language': _language,
      'query': query,
    });

    return await _processResponse(url);
  }
}
