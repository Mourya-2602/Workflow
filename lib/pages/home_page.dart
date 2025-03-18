import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:workflow/data/database.dart';
import '../utils/dialog_box.dart';
import '../utils/todo_tile.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //reference the hive box
  final _myBox = Hive.box('mybox');
  final _controller=TextEditingController();
    TodoDataBase db =TodoDataBase();
    @override
  void initState() {
    //for first time
      if(_myBox.get("TODOLIST")==null){
        db.createInitialData();
      }
      else {
        //already exists data
        db.loadData();
      }
    super.initState();
  }
    void CheckboxChanged(bool? value,int index){
      setState(() {
        db.todoList[index][1]=!db.todoList[index][1];
      });
      db.updateDatabase();
    }
    void saveNewTask(){
      setState(() {
        db.todoList.add([_controller.text,false]);
        _controller.clear();
      });
      Navigator.of(context).pop();
      db.updateDatabase();
    }

    void createNewTask(){
      showDialog(context: context, builder: (context){
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel:()=>Navigator.of(context).pop(),
        );
      });

    }

    void deleteTask(int index){
      setState(() {
        db.todoList.removeAt(index);
      });
      db.updateDatabase();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.blue[100],
       appBar: AppBar(
         backgroundColor: Colors.blue[200],
         title: Text("TO DO TASKS"),
         centerTitle: true,
         elevation: 0,
       ),
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
        child:Icon(Icons.add),
      ),
      body:ListView.builder(
       itemCount: db.todoList.length,
       itemBuilder: (context, index){
         return TodoTile(
             taskName:db.todoList[index][0],
             taskCompleted: db.todoList[index][1],
             onChanged: (value)=>CheckboxChanged(value,index),
           deleteFunction:(context)=>deleteTask(index),
         );
       },
      ),
    );
  }
}
