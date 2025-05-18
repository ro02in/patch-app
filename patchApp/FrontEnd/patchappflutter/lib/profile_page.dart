//NYTT FÖRSÖK NY BRANCH

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget { //ej klar

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [
            Container(
              child: Text("Username", textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'DMSans')),
              ),

            ],
          )
        ]
      )
    )
  );

}


}