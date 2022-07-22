import 'package:flutter/material.dart';
import 'package:johanes_provider/widgets/ask_todo_dialog.dart';
import 'package:johanes_provider/main.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [Container(), Container()];
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
            context: context,
            barrierDismissible: false,
            builder: ((context) => AskTodoDialog())),
      ),
    );
  }
}
