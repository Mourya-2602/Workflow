import 'package:flutter/material.dart';
import '../utils/dialog_box.dart';
import '../utils/todo_tile.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _controller=TextEditingController();
    List todoList = [
      ["make Tutorial", false],
      ["to exerxise", false]
    ];
    void CheckboxChanged(bool? value,int index){
      setState(() {
        todoList[index][1]=!todoList[index][1];
      });
    }
    void createNewTask(){
      showDialog(context: context, builder: (context){
        return DialogBox(
          controller: ,
        );
      });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.purple[100],
       appBar: AppBar(
         backgroundColor: Colors.purple[200],
         title: Text("TO DO TASKS"),
         centerTitle: true,
         elevation: 0,
       ),
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
        child:Icon(Icons.add),
      ),
      body:ListView.builder(
       itemCount: todoList.length,
       itemBuilder: (context, index){
         return TodoTile(
             taskName:todoList[index][0],
             taskCompleted: todoList[index][1],
             onChanged: (value)=>CheckboxChanged(value,index),
         );
       },
      ),
    );
  }
}
