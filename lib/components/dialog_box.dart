import 'package:flutter/material.dart';
import 'package:todo_app/components/my_button.dart';

class DialogBox extends StatelessWidget {

  final controller;
  VoidCallback saveButtonPressed;
  VoidCallback cancelButtonPressed;

    DialogBox ({
    super.key,
    required this.controller,
    required this.saveButtonPressed,
    required this.cancelButtonPressed
    });

  @override
  Widget build(BuildContext context) {


    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.background,
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            TextField(
              controller:  controller,
              decoration:const  InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a Task"
              ),

            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save", onPressed: saveButtonPressed),
                const SizedBox(width: 10,),
                MyButton(text: "Cancel", onPressed: cancelButtonPressed),
              ],
            )

          ],
        ),
      ),
    );
  }
}