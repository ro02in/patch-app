//19 maj tillagd sida HomePage

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget { //ej klar

@override
Widget build(BuildContext context) {
  var screenSize = MediaQuery.of(context).size; //screensize
  String userName = '';

  return Scaffold(
    body: Scrollbar(
      //padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          Column(
            children: [
              SizedBox(height: 40),
              Text("HomePage test"),
              Container(
                width: screenSize.width,
                height: screenSize.height,
                decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/stitches9.png'),
                  fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    ),
                  ],
                )
              ]
            ),
          ],
        )
      )
    );
  }
}
