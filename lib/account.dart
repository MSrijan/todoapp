import 'package:flutter/material.dart';

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

class account_page_body extends StatelessWidget {
  const account_page_body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     child: Column(
      children: [
        SizedBox(height: 20,),
        Center(
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
              image: NetworkImage("https://www.collinsdictionary.com/images/full/apple_158989157.jpg"),
              )
            ),
          )
        ),
        SizedBox(height: 20,),
        Container(
          child: Text("Apple",style: TextStyle(fontSize: 20),),
        )
      ],
     ),
    );
  }
}