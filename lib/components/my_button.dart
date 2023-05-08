import "package:flutter/material.dart";
import 'package:todo_app/components/fonts.dart';

class MyButton  extends StatelessWidget {

  final String text;
  VoidCallback onPressed;

   MyButton ({
    super.key,
    required this.text,
    required this.onPressed
    });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).colorScheme.primary,
      child: Text(text,style: font1(),),
    );
  }
}