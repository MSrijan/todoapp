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
  int currentpageindex = 0;
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color.fromARGB(255, 235, 235, 235),
    appBar: buildAppbar(),
    body:body[currentpageindex],
    floatingActionButton: actionbutton(),
    drawer: _drawer(),
    bottomNavigationBar:navbar()
  );
}

NavigationBar navbar() {
  return NavigationBar(
    backgroundColor: Colors.white,
    onDestinationSelected: (int index){
      setState(() {
        currentpageindex = index;
      });
    },
    selectedIndex: currentpageindex,
    destinations: [
      homepage(),
      editpage(),
      accountpage(),
    ],
  );
}

List<Widget> get body {
  return <Widget>[
    Container(
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
            ondelete: _deletetodo,
            ),
      ],
      ),
   ),
   Container(
    color: Colors.red,
    child: Text("blue"),
   ),
   Container(
    color: Colors.blue,
    child: Text("Red"),
   )
];
}

Drawer _drawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Text("Drawer" ,
          style: TextStyle(fontSize: 30, ))
          )
      ],
    )
  );
}

FloatingActionButton actionbutton() {
  return FloatingActionButton(
    backgroundColor: Colors.indigo,
    child: Icon(Icons.add),
    onPressed: (){
      openDialog();
    }
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

class accountpage extends StatelessWidget {
  const accountpage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Icon(Icons.account_circle_rounded),
      label: "Account"
      );
  }
}

class editpage extends StatelessWidget {
  const editpage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Icon(Icons.edit),
      label: "Edit"
      );
  }
}

class homepage extends StatelessWidget {
  const homepage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Icon(Icons.home),
      label: "Home"
      );
  }
}
