import 'package:flutter/material.dart';
import 'todo.dart';

class Todocontainer extends StatelessWidget {
  final ToDo todo;
  final ontodochanged;
  final ondelete;
  const Todocontainer({Key? key, required this.todo, required this.ondelete, required this.ontodochanged}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: (){
          ontodochanged(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          ),
        title: Text(todo.todoText!,
         style: TextStyle(
          fontSize: 20,
          decoration: todo.isDone? TextDecoration.lineThrough: null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 10),
          width:35,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(25)
          ),
          child: Align(
            alignment: Alignment.center,
            child:IconButton(
              color: Colors.white,
              icon: Icon(Icons.delete),
              onPressed: (){
                ondelete(todo.id);
              },
            ),
          ), 
          ),
        )
    );
  }
}