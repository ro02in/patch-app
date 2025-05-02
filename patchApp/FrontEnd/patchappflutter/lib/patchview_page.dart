import 'package:flutter/material.dart';

class PatchViewPage extends StatelessWidget {

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        children: [
          Row(
            children: <Widget> [
              Image.asset('assets/syttbyttcirclelogo.png', width: 200, height: 200),
              SizedBox(height: 10), //simulated padding
              Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Märkesnamn", textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 14)),
              ),
            ])
        ],
      ))
  );
}
}
