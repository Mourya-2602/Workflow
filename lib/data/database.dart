import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase{
  List todoList = [];
  //reference the box
  final _myBox=Hive.box('mybox');

  void createInitialData(){
    todoList=[
      ["Make a trail",false],
    ];
  }
  //load data from database
  void loadData(){
    todoList = _myBox.get("TODOLIST");
  }
  //update the database
void updateDatabase(){
  _myBox.put("TODOLIST",todoList);
}
}