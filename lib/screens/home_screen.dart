import "package:flutter/material.dart";
import 'package:hive/hive.dart';
import 'package:todo_app/backend/database.dart';
import 'package:todo_app/components/fonts.dart';
import '../components/dialog_box.dart';
import '../components/todo_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _myBox = Hive.box("MyBox");
  ToDoDatabase  db = ToDoDatabase();

  @override
  void initState() {
    if(_myBox.get("TODOLIST") == null){
      db.createInitialData();
    }
    else{
      db.loadData();
    }
    super.initState();
  }


  final _myController = TextEditingController();
  
  void saveButtonPressed(){

    if(_myController.text == ""){

    }
    else{
      setState(() {
      db.toDoList.add([false,_myController.text]);
      _myController.clear();
      });
      db.updateData();
      Navigator.of(context).pop();
    }
    
  }

  void cancelButtonPressed(){
    Navigator.of(context).pop();
  }

  //check box changed
  void checkBoxCLicked(bool? value,int index){
    setState(() {
      db.toDoList[index][0] = !db.toDoList[index][0];
    });
    db.updateData();
    
  }

  void createNewTask() {
    showDialog(
      context: context, builder: (context){
        return DialogBox(
          controller: _myController,
          cancelButtonPressed: cancelButtonPressed,
          saveButtonPressed: saveButtonPressed,
        );
      }
      );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }
  
  Widget bodySelector() {
    if (db.toDoList.isEmpty){
      return SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const SizedBox(height: 150,),
              Icon(
                Icons.error_outline,
                color: Theme.of(context).colorScheme.secondary,
                size: 100,
              ),

              const SizedBox(height: 20,),

              Text("Oops!! \n\n  You haven't added any tasks.\n\n Add some tasks to view them here.",style: font3(),textAlign: TextAlign.center,),

            ],
          ),
        ),
      );
    }
    else {
      return SafeArea(
        child: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context,index) {
            return ToDoContainer(
              taskName: db.toDoList[index][1],
              taskCompleted: db.toDoList[index][0],onChanged: (value) => checkBoxCLicked(value,index),
              deleteFunction: (context) => deleteTask(index),
            );
              
          }
        ),
      );
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("ToDo"),
        centerTitle: true,
        elevation: 0,
      ),

      backgroundColor: Theme.of(context).colorScheme.background,


      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: createNewTask,
        child: Icon(
          Icons.add,
          size: 30,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),

      body: bodySelector(),
    );
  }
}