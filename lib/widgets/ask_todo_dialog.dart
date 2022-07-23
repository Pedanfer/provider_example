import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/todo.dart';
import '../provider/todos.dart';
import '../widgets/todo_form.dart';

class AskTodoDialog extends StatefulWidget {
  final Todo? todo;

  const AskTodoDialog({Key? key, this.todo}) : super(key: key);

  @override
  State<AskTodoDialog> createState() => _AskTodoDialogState();
}

class _AskTodoDialogState extends State<AskTodoDialog> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String description;
  late String option;

  @override
  void initState() {
    option = widget.todo == null ? 'Add' : 'Edit';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$option todo',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(
              height: 8,
            ),
            TodoForm(
              title: widget.todo != null ? widget.todo!.title : '',
              description: widget.todo != null ? widget.todo!.description : '',
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              onSavedTodo: widget.todo == null ? addTodo : updateTodo,
            )
          ],
        ),
      ),
    );
  }

  void addTodo() {
    if (_formKey.currentState!.validate()) {
      final todo = Todo(title: title, description: description);
      TodosProvider todosProvider =
          Provider.of<TodosProvider>(context, listen: false);
      todosProvider.addTodo(todo);
      Navigator.of(context).pop();
    }
  }

  void updateTodo() {
    TodosProvider todosProvider =
        Provider.of<TodosProvider>(context, listen: false);
    todosProvider.updateTodo(widget.todo!, title, description);
    Navigator.of(context).pop();
  }
}
