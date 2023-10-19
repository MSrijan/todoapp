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
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
              child: IconButton(
                color: Colors.white,
                onPressed: () {
                },
                icon: Icon(Icons.edit)),
            ),
            const SizedBox(
                width: 10, // Add the desired spacing between the icons
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
              child: IconButton(
                color: Colors.white,
                onPressed: () {
                  ondelete(todo.id);
                },
                icon: Icon(Icons.delete),
              ),
            )
          ],
        ),
        )
    );
  }
}