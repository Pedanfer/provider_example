import 'package:flutter/material.dart';
import '../widgets/todo_form.dart';

class AskTodoDialog extends StatefulWidget {
  AskTodoDialog({Key? key}) : super(key: key);

  @override
  State<AskTodoDialog> createState() => _AskTodoDialogState();
}

class _AskTodoDialogState extends State<AskTodoDialog> {
  final _formkey = GlobalKey<FormState>;
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        const Text(
          'Add todo',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        const SizedBox(
          height: 8,
        ),
        TodoForm(
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedDescription: (description) =>
              setState(() => this.description = description),
          onSavedTodo: () {},
        )
      ]),
    );
  }
}
