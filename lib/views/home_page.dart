import 'package:flutter/material.dart';
import '../widgets/ask_todo_dialog.dart';
import '../main.dart';

import '../widgets/todo_list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [TodoListWidget(), Container()];
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          index = selectedIndex;
        }),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined), label: 'To do'),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Completed')
        ],
      ),
      body: tabs[selectedIndex],
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: const Icon(Icons.add),
        onPressed: () => showDialog(
            context: context, builder: ((context) => AskTodoDialog())),
      ),
    );
  }
}
