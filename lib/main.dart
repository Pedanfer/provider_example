import 'package:flutter/material.dart';
import '../provider/todos.dart';
import '../views/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  static String title = 'Provider example';
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child: MaterialApp(
        title: title,
        theme: ThemeData(
            primarySwatch: Colors.pink,
            scaffoldBackgroundColor: const Color.fromARGB(255, 241, 240, 158)),
        home: const HomePage(),
      ),
    );
  }
}
