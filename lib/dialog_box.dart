import 'package:flutter/material.dart';
import 'my_button.dart';

class DialogBox extends StatelessWidget {
  // const DialogBox({Key? key}) : super(key: key);
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({required this.controller,
  required this.onSave,
  required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    
    return AlertDialog(
      backgroundColor: Colors.blueGrey,
      content: Container(
        height: 120,
        
        
        child: Column(children: [
          //text here
          TextField(
            controller:controller ,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Add task..'),
            
            
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyButton(text: "save", onPressed: onSave),
            MyButton(text: "cancel", onPressed: onCancel),

          ],

        ),
        ]),
      ),

    );
  }
}