import 'package:flutter/material.dart';

class TradeLogPage extends StatefulWidget {

  @override
  State<TradeLogPage> createState() => _TradeLogPageState();
}

class _TradeLogPageState extends State<TradeLogPage> {

@override
Widget build (BuildContext context) {

  return Scaffold(
    backgroundColor: Colors.white,
    body: Container(
      child: Column(
        children: [
          Text("Trade Log", style: TextStyle(fontSize: 30, color: Colors.black, fontFamily: 'CalSans')),
          SizedBox(height: 30),

          Container(
            height: 40,
            width: 70,
            color: Colors.blue,
            child: OutlinedButton(
              child: Text("hi"),
              onPressed: () {
              }
            )
          )
        ]
    )
  )
  );
}
//test
}
