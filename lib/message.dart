import 'package:flutter/material.dart';

class messagepage extends StatelessWidget {
  const messagepage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: Icon(Icons.message),
      label: "Messages"
      );
  }
}

class message_page_body extends StatefulWidget{
  const message_page_body({
    super.key,
  });

  @override
  State<message_page_body> createState() => _message_page_bodyState();
}

class _message_page_bodyState extends State<message_page_body> {
  @override
  Widget build(BuildContext context){
    return Container(
      padding:EdgeInsets.fromLTRB(10, 10, 20, 10),
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.account_circle, size: 55,),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Apple", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                        Text("Sun", style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                    SizedBox(height: 2),
                    Text("You have apple. You have apple. You have apple. You have apple. You have apple. You have apple. You have apple. You have apple. You have apple. You have apple. You have apple. ")
                  ],
                )
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.account_circle, size: 55,),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Apple", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                        Text("Sun", style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                    SizedBox(height: 2),
                    Text("You have apple. You have apple. You have apple. You have apple. You have apple. You have apple. You have apple. You have apple. You have apple. You have apple. You have apple. ")
                  ],
                )
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.account_circle, size: 55,),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Apple", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                        Text("Sun", style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                    SizedBox(height: 2),
                    Text("You have apple. You have apple. You have apple. You have apple. You have apple. You have apple. You have apple. You have apple. You have apple. You have apple. You have apple. ")
                  ],
                )
              )
            ],
          ),
          
        ],
      ),
    );
  }
}