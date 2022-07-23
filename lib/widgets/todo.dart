import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:johanes_provider/provider/todos.dart';
import 'package:johanes_provider/widgets/ask_todo_dialog.dart';
import 'package:provider/provider.dart';
import '../utils/constants.dart' as constants;
import '../models/todo.dart';

class TodoWidget extends StatefulWidget {
  final Todo todo;

  const TodoWidget({Key? key, required this.todo}) : super(key: key);

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
            actionPane: const SlidableDrawerActionPane(),
            key: Key(widget.todo.id.toString()),
            actions: [
              IconSlideAction(
                  color: Colors.green,
                  caption: 'Edit',
                  onTap: updateTodo,
                  icon: Icons.edit)
            ],
            secondaryActions: [
              IconSlideAction(
                  color: Colors.red,
                  caption: 'Delete',
                  onTap: deleteTodo,
                  icon: Icons.delete)
            ],
            child: buildTodo()),
      );

  Widget buildTodo() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Checkbox(
            activeColor: Theme.of(context).primaryColor,
            checkColor: Colors.white,
            value: widget.todo.isDone,
            onChanged: (_) {
              final todosProvider =
                  Provider.of<TodosProvider>(context, listen: false);
              todosProvider.toggleTodoStatus(widget.todo);
            },
          ),
          SizedBox(width: constants.screenSize.width * 0.1),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.todo.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 22),
                ),
                if (widget.todo.description.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: Text(widget.todo.description,
                        style: const TextStyle(fontSize: 20, height: 1.5)),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }

  void deleteTodo() {
    final todosProvider = Provider.of<TodosProvider>(context, listen: false);
    todosProvider.removeTodo(widget.todo);
  }

  void updateTodo() {
    showDialog(
        context: context,
        builder: ((context) => AskTodoDialog(todo: widget.todo)));
  }
}
