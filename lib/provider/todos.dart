import 'package:flutter/cupertino.dart';
import '../models/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(title: 'Walk the dog', description: 'heyheyhey'),
    Todo(title: 'Walk the dog', description: 'heyheyhey'),
    Todo(title: 'Walk the dog', description: 'heyheyhey'),
    Todo(title: 'Walk the dog', description: 'heyheyhey')
  ];

  List<Todo> get todos => _todos.where((todo) => !todo.isDone).toList();
}
