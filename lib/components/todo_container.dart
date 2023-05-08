import "package:flutter/material.dart";
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/components/fonts.dart';

class ToDoContainer extends StatelessWidget {

  final String taskName;
  final bool? taskCompleted;
  Function (bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

   ToDoContainer({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
    });

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Theme.of(context).colorScheme.error,
              borderRadius: BorderRadius.circular(15),
              label: "Delete",
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
      
                //chechbox
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Theme.of(context).colorScheme.secondary,
                ),
      
                //text
                Text(taskName,style:  taskCompleted! ? font2():font1(),)
      
              ],
            ),
          ),
        ),
      ),
    );
  }
}