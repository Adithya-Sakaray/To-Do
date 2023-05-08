import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/theme.dart';

void main() async {
  await Hive.initFlutter();

  //open the box
  var box = await Hive.openBox("MyBox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeData,
      darkTheme: AppTheme.darkThemeData,
      home: const HomeScreen(),
    );
  }
}