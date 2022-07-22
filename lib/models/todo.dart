class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  static int idNum = 0;
  int id = idNum++;
  DateTime createdTime = DateTime.now();
  final String title;
  final String description;
  bool isDone;

  Todo({required this.title, this.description = '', this.isDone = false});
}
