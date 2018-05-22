import 'dart:async';
import 'package:flutter_sandbox/Models/Movie.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc {
  final API api;
  Stream<List<Movie>> _results = Stream.empty();
  Stream<String> _log = Stream.empty();
  ReplaySubject<String> _query = ReplaySubject<String>();

  Stream<List<Movie>> get results => _results;

  Stream<String> get log => _log;

  Sink<String> get query => _query;

  MovieBloc(this.api) {
    _results = _query.distinct().asyncMap(api.get).asBroadcastStream();
    //Stream allow multiple subs
    
    _log = Observable(results)
    .withLatestFrom(_query.stream, (_, query) => 'Result for $query').asBroadcastStream();

  }

  void dispose() {
    _query.close();
  }

  


}
