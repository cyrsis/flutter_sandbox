import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Bloc/MovieBloc.dart';
import 'package:flutter_sandbox/Models/Movie.dart';

class MovieProvider extends InheritedWidget {
  final MovieBloc movieBloc;


  MovieProvider({Key key, MovieBloc movieBloc, Widget child})
      : this.movieBloc = movieBloc ?? MovieBloc(API()),
  super(child: child, key:key);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
  return true;
  }
}
