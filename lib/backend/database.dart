import 'package:hive/hive.dart';

class  ToDoDatabase {

  List toDoList = [];

  final _myBox = Hive.box("MyBox"); 


  void createInitialData() {
    toDoList = [];
  }

  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }

  void updateData(){
    _myBox.put("TODOLIST", toDoList);
  }
}