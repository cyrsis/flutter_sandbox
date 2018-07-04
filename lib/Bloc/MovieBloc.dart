import 'dart:async';


import 'package:flutter_sandbox/Models/MoviesBloC/Movie.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc {
  final API api;

  MovieBloc(this.api) {
    _results = _query.distinct().asyncMap(api.get).asBroadcastStream();

    _log = Observable(results)
        .withLatestFrom(_query.stream, (_, query) => 'Results for $query')
        .asBroadcastStream();
  }

  Stream<List<Movie>> _results = Stream.empty();
  Stream<String> _log = Stream.empty();

  ReplaySubject<String> _query = ReplaySubject<String>();
  //Replace with StreamController, we get the same behavour

  Stream<String> get log => _log;
  Stream<List<Movie>> get results => _results;
  Sink<String> get query => _query;



  void dispose() {
    _query.close();
  }
}