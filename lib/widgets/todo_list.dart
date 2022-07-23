import 'package:flutter/material.dart';
import 'package:johanes_provider/provider/todos.dart';
import 'package:johanes_provider/utils/constants.dart';
import 'package:johanes_provider/widgets/todo.dart';
import 'package:provider/provider.dart';

class TodoListWidget extends StatelessWidget {
  final bool done;
  const TodoListWidget({Key? key, this.done = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = done ? provider.done : provider.todos;

    return todos.isEmpty
        ? const Text(
            'No todos',
            style: TextStyle(fontSize: 20),
          )
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(12),
            itemCount: todos.length,
            separatorBuilder: (context, index) =>
                SizedBox(height: screenSize.height * 0.02),
            itemBuilder: (context, index) => TodoWidget(todo: todos[index]),
          );
  }
}
