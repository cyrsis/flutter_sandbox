class ToDoItem {
  final String title;

  ToDoItem(this.title);

  @override
  bool operator ==(other)  {
    return identical(this, other) || other is ToDoItem && runtimeType == other.runtimeType && title == other.title;
  }

  @override
  int get hashCode => title.hashCode;


}
