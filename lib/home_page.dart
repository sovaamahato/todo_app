import 'package:flutter/material.dart';
import 'dialog_box.dart';
import 'todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  //
  final  _controller =TextEditingController();
  //list of tasks
  List TodoList = [
    ['breakfast', false],
    ['coding', false],
    ['shopping', false],
  ];

//checkbox was clicked
  void Checkbox(bool? value, int index) {
    setState(() {
      TodoList[index][1] = !TodoList[index][1];
    });
  }

  //to open a dialogbox
  void addTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(controller:_controller,
          onSave: SaveNewTask,
          onCancel: ()=>Navigator.of(context).pop(),);
        });
  }

//save new task
  void  SaveNewTask()
  {
    setState(() {
      TodoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    
  }

  //delete task
  void deleteTask(int index)
  {
    setState(() {
      TodoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('To Do'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          child: ListView.builder(
              itemCount: TodoList.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  taskName: TodoList[index][0],
                  taskCompleted: TodoList[index][1],
                  onChanged: (value) => Checkbox(value, index),
                  deleteFunction: (contex)=>deleteTask(index),
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        child: Icon(Icons.add),
      ),
    );
  }
}
