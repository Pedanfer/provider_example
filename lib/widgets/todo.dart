import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
  Widget build(BuildContext context) => Slidable(
      actionPane: SlidableDrawerActionPane(),
      key: Key(widget.todo.id.toString()),
      actions: [
        IconSlideAction(
            color: Colors.green,
            caption: 'Edit',
            onTap: () {},
            icon: Icons.edit)
      ],
      secondaryActions: [
        IconSlideAction(
            color: Colors.red,
            caption: 'Delete',
            onTap: () {},
            icon: Icons.delete)
      ],
      child: buildTodo());

  Widget buildTodo() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Checkbox(
            activeColor: Theme.of(context).primaryColor,
            checkColor: Colors.white,
            value: widget.todo.isDone,
            onChanged: (value) {
              widget.todo.isDone = value!;
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
                    margin: EdgeInsets.only(top: 4),
                    child: Text(widget.todo.description,
                        style: TextStyle(fontSize: 20, height: 1.5)),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
