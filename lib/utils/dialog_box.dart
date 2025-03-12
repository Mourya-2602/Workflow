import 'package:flutter/material.dart';
import 'package:workflow/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  const DialogBox({super.key,required this.controller,required this.onSave,required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple[200],
      content: Container(
        height:120,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
          TextField(
            controller: controller,
            decoration: InputDecoration(border: OutlineInputBorder(),hintText:"Add a new Task"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            MyButton(text: "Save", onPressed:(){}),
            const SizedBox(width: 8,),
            MyButton(text: "Cancel", onPressed:(){})
          ],)
        ])
      ),
    );
  }
}
