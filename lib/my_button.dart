import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  // const MyButton({Key? key}) : super(key: key);

  final String text;
  VoidCallback onPressed;

  MyButton({
    required this.text,
    required this.onPressed,
});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed:onPressed ,
      color: Theme.of(context).primaryColor,
      child: Text(text),
      
       );
    
  }
}