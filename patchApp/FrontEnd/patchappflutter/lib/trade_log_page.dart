/*
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


 */

//Fungerande version och fin

/*
import 'package:flutter/material.dart';
import 'package:patchappflutter/trade_action_page.dart';

class TradeLogPage extends StatefulWidget {
  @override
  State<TradeLogPage> createState() => _TradeLogPageState();
}

class _TradeLogPageState extends State<TradeLogPage> {
  final List<Map<String, String>> activeTrades = [
    {'name': 'Eliasmoney', 'avatar': 'assets/avatar1.png'},
    {'name': 'Hellowilma', 'avatar': 'assets/avatar2.png'},
    {'name': 'Notnoah', 'avatar': 'assets/avatar3.png'},
  ];

  final List<Map<String, String>> tradeHistory = [
    {'name': 'Goblinmaster', 'avatar': 'assets/avatar4.png'},
    {'name': 'Noah', 'avatar': 'assets/avatar5.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2EDDC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Trade Log",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontFamily: 'CalSans',
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.settings, color: Colors.black),
                    onPressed: () {
                      // settings
                    },
                  )
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TradeActionPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF98B59F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  "New Trade",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontFamily: 'CalSans',
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text("Active trades:",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'CalSans',
                    color: Colors.black,
                  )),
              SizedBox(height: 10),
              ...activeTrades.map((trade) => _tradeCard(trade, active: true)),
              SizedBox(height: 30),
              Text("Trade history:",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'CalSans',
                    color: Colors.black,
                  )),
              SizedBox(height: 10),
              ...tradeHistory.map((trade) => _tradeCard(trade, active: false)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tradeCard(Map<String, String> trade, {required bool active}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          color: active ? Color(0xFFF2C94C) : Color(0xFFE0DCC5),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(trade['avatar']!),
          ),
          title: Text(
            trade['name']!,
            style: TextStyle(fontSize: 18, fontFamily: 'CalSans'),
          ),
        ),
      ),
    );
  }
}

*/

import 'package:flutter/material.dart';
import 'package:patchappflutter/trade_action_page.dart';

class TradeLogPage extends StatefulWidget {
  @override
  State<TradeLogPage> createState() => _TradeLogPageState();
}

class _TradeLogPageState extends State<TradeLogPage> {
  final List<Map<String, String>> activeTrades = [
    {'name': 'Eliasmoney', 'avatar': 'assets/avatar1.png'},
    {'name': 'Hellowilma', 'avatar': 'assets/avatar2.png'},
    {'name': 'Notnoah', 'avatar': 'assets/avatar3.png'},
  ];

  final List<Map<String, String>> tradeHistory = [
    {'name': 'Goblinmaster', 'avatar': 'assets/avatar4.png'},
    {'name': 'Noah', 'avatar': 'assets/avatar5.png'},
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size; //screensize

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
            decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/stitches3.png'),
                  fit: BoxFit.fill,
                  )
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Trade Log",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: 'InknutAntiqua',
                        ),
                      ),
                      SizedBox(width: 90),
                      IconButton(
                        icon: Icon(Icons.settings, color: Colors.white, size: 40),
                        highlightColor: const Color.fromARGB(255, 255, 62, 220),
                        onPressed: () {},
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 60,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 149, 255, 116),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(1, 2)
                        )
                      ]
                    ),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => TradeActionPage()));
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            width: 1.2, color: Color.fromARGB(255, 122, 255, 186)),
                        backgroundColor: Color.fromARGB(255, 39, 39, 39),
                        overlayColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        "New Trade",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'InknutAntiqua',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(width: 30),
                  Text("Active trades:",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'InknutAntiqua',
                        color: Colors.white,
                      )),
                  SizedBox(height: 5),
                  ...activeTrades.map((trade) => _tradeCard(trade, active: true)),
                  SizedBox(height: 30),
                  Text("Trade history:",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'InknutAntiqua',
                        color: Colors.white,
                      )),
                  SizedBox(height: 5),
                  ...tradeHistory.map((trade) => _tradeCard(trade, active: false)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _tradeCard(Map<String, String> trade, {required bool active}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 39, 39, 39),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: active
                ? Color.fromARGB(255, 122, 255, 186)
                : Color.fromARGB(100, 255, 255, 255),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 34, 34, 34),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(1, 2),
            ),
          ],
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(trade['avatar']!),
          ),
          title: Text(
            trade['name']!,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'InknutAntiqua',
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
