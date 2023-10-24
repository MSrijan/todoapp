import 'package:flutter/material.dart';
import 'todo.dart';

class Todocontainer extends StatefulWidget {
  final ToDo todo;
  final ontodochanged;
  final ondelete;
  const Todocontainer({Key? key, required this.todo, required this.ondelete, required this.ontodochanged,}) : super(key:key);

  @override
  State<Todocontainer> createState() => _TodocontainerState();
}

class _TodocontainerState extends State<Todocontainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: (){
          widget.ontodochanged(widget.todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        tileColor: Colors.white,
        leading: Icon(
          widget.todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          ),
        title: Text(widget.todo.todoText!,
         style: TextStyle(
          fontSize: 20,
          decoration: widget.todo.isDone? TextDecoration.lineThrough: null,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _onedit(todo: widget.todo, onEdit: widget.ontodochanged,),
            const SizedBox(
                width: 10, // Add the desired spacing between the icons
            ),
            _delete()
          ],
        ),
        )
    );
  }

  Container _delete() {
    return Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red,
            ),
            child: IconButton(
              iconSize: 20,
              color: Colors.white,
              onPressed: () {
                widget.ondelete(widget.todo.id);
              },
              icon: const Icon(Icons.delete),
            ),
          );
  }
}

class _onedit extends StatelessWidget {
  final ToDo todo;
  final Function(ToDo) onEdit;

  _onedit({required this.todo, required this.onEdit});

  final TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    myController.text = todo.todoText.toString();
    return Container(
    height: 35,
    width: 35,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.grey,
    ),
    child: IconButton(
      iconSize: 20,
      color: Colors.white,
      onPressed: () {
        showDialog(context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text("${todo.todoText}"),
            content: TextField(
              controller: myController,
              autofocus: true,
              ),
            actions: [
              TextButton(
                onPressed: (){
                  todo.todoText = myController.text;
                 onEdit(ToDo(
                      id: todo.id,
                      todoText: myController.text,
                      isDone: todo.isDone,
                    ));
                    Navigator.of(context).pop();
                },
                child: Text("Edit")
                )
            ],
          ),
        );
      },
      icon: const Icon(Icons.edit)),
          );
  }
}