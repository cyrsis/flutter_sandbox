import 'package:flutter_sandbox/Models/ToDoItem.dart';

class AppState {
  final List<ToDoItem> toDos;
  final ListState listState;

  AppState(this.toDos, this.listState);

  factory AppState.initial() {
    return new AppState(new List.unmodifiable([]),ListState.listOnly);
  }

}

enum ListState {
  listOnly,ListWithNewItem
}

