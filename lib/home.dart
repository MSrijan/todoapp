import 'package:flutter/material.dart';
import '../todocontainer.dart';
import '../todo.dart';

class Home extends StatefulWidget {
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = ToDo.todoList();

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color.fromARGB(255, 235, 235, 235),
    appBar: buildAppbar(),
    body: Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10), 
      child: ListView(
        children: [
          Text(
            "To Do List",
            style: TextStyle(fontSize: 30),
          ),
          for (ToDo todoo in todoList)
          Todocontainer(todo: todoo,
          ontodochanged: _handleChange,
          ondelete: _deletetodo),
       ],
      ),
    ),
    bottomNavigationBar: Align(
      alignment:Alignment.bottomRight ),
  );
  
}
void _handleChange(ToDo todo){
  setState((){
    todo.isDone = !todo.isDone;
  });
}

void _deletetodo(String id){
  setState(() {
    todoList.removeWhere( (item) => item.id ==id);
  });
  
}

  AppBar buildAppbar() {
    return AppBar(
      backgroundColor: Colors.indigo,
      title: Icon(
        Icons.menu,
        size: 30,
        ),
    );
  }
}

