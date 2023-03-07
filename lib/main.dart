import 'package:flutter/material.dart';
import 'package:project_software1/screens/Home_DB.dart';
import 'package:project_software1/screens/start_screen.dart';

import 'database/sqflite/addtips.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const StartScreen(),
      routes: {
        "Home": (context) => const MyHomeDbScreen(),
        "addTips": (context) => const AddTips(),
        "editTips": (context) => const AddTips(),
      },
    );
  }
}
