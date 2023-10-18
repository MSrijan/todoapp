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
  final todocontroller = TextEditingController();

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
          Todocontainer(
            todo: todoo,
            ontodochanged: _handleChange,
            ondelete: _deletetodo),
       ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.indigo,
      child: Icon(Icons.add),
      onPressed: (){
        openDialog();
      }
      ),
    drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text("Drawer" ,
            style: TextStyle(fontSize: 30, ))
            )
        ],
      )
    ),
  );
}
  AppBar buildAppbar() {
    return AppBar(
      backgroundColor: Colors.indigo,
    );
  }

  Future openDialog() => showDialog(context: context,
  builder: (context) => AlertDialog(
    title: Text("Add to list"),
    content: TextField(
      autofocus: true,
      controller: todocontroller,
      decoration: InputDecoration(hintText: "Add to list"),
    ),
    actions: [
      TextButton(
        onPressed: (){
          _addtodoitem(todocontroller.text);
          
        }, 
        child: Text("Add"))
    ],
  ));

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

void _addtodoitem(String toDo){
  setState(() {
    todoList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: toDo));
  });
  Navigator.of(context).pop();
  todocontroller.clear(); 
}
}


