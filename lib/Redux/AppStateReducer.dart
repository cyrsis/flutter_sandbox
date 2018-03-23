import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_sandbox/Redux/Action.dart';
import 'package:flutter_sandbox/Redux/AppState.dart';
import 'package:redux/redux.dart';

import 'package:rxdart/rxdart.dart';


AppState AppStateReducer(AppState state, dynamic action) {
  return new AppState(
    counter: counterReducer(state.counter, action),
  );
}

final counterReducer = combineTypedReducers<int>([
  new ReducerBinding<int, CounterOnDataEventAction>(_setCounter),
]);

int _setCounter(int oldCounter, CounterOnDataEventAction action) {
  return action.counter;
}
