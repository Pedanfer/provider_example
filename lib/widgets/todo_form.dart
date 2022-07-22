import 'package:flutter/material.dart';

class TodoForm extends StatefulWidget {
  final String title;
  final String description;
  //Callbacks de flutter para valores modificables
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  //Callback sin return ni argumentos
  final VoidCallback onSavedTodo;

  const TodoForm(
      {Key? key,
      this.title = '',
      this.description = '',
      required this.onChangedTitle,
      required this.onChangedDescription,
      required this.onSavedTodo})
      : super(key: key);

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [buildTitle(), buildDescription(), buildSaveButton()],
    ));
  }

  Widget buildTitle() => TextFormField(
        initialValue: widget.title,
        onChanged: widget.onChangedTitle,
        validator: (title) {
          if (title!.isEmpty) {
            return 'Please enter a title for the todo.';
          }
          return null;
        },
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Title',
        ),
      );

  Widget buildDescription() => TextFormField(
        maxLines: 3,
        initialValue: widget.description,
        onChanged: widget.onChangedDescription,
        validator: (description) {
          if (description!.isEmpty) {
            return 'Please enter a description for the todo.';
          }
          return null;
        },
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Description',
        ),
      );

  Widget buildSaveButton() => Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Wrap(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: widget.onSavedTodo,
              child: const Text('Save', textScaleFactor: 1.3),
            ),
          ],
        ),
      );
}
