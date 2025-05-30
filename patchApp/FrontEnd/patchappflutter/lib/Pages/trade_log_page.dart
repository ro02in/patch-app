//NYTT FÖRSÖK NY BRANCH

import 'package:flutter/material.dart';
import 'package:patchappflutter/Pages/trade_action_page.dart';

import 'faq_page.dart';

class TradeLogPage extends StatefulWidget {
  const TradeLogPage({super.key});
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
      body: ListView(
        padding: EdgeInsets.all(0),
        children: [
          Container(
            width: screenSize.width,
            height: screenSize.height,
              decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/stitches10.png'),
                    fit: BoxFit.fill,
                    )
            ),
                child: ListView(
                  padding: EdgeInsets.only(top: 0, left: 20, right: 20),
                  children: [

                    AppBar(
                      backgroundColor: Color.fromARGB(200, 35, 39, 25),
                      elevation: 40,
                      shadowColor: Colors.black,
                      toolbarHeight: 60,
                      leadingWidth: 150,
                      leading: Icon(Icons.arrow_back, color: Colors.white, size: 20),
                      centerTitle: true,
                      titleSpacing: -22,
                      primary: true,
                      //Källhänvisning: 'Rounded bottom on appbar', stackoverflow.com/questions/50242087/rounded-bottom-on-appbar publicerad 13 september 2020, hämtad 23 maj 2025
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(100),
                          )
                      ),
                      //title: Text("Byteslogg", style: TextStyle(fontFamily: 'InknutAntiqua', fontSize: 19, color: Colors.white, fontWeight: FontWeight.w600)),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Byteslogg",
              style: TextStyle(
                fontFamily: 'InknutAntiqua',
                fontSize: 19,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 35), // HÄR ÄR ? KNAPPEN
            Container(
              padding: EdgeInsets.only(bottom: 8),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 140, 140, 140),
                      blurRadius: 0,
                      spreadRadius: 4,
                    )
                  ],
                ),
                child: FloatingActionButton(
                  shape: const CircleBorder(),
                  backgroundColor: Colors.white,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          surfaceTintColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          contentTextStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'InknutAntiqua'),
                          content: SizedBox(
                            height: 350,
                            width: 360,
                            child: ListView(
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Aktiva byten av märken:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                              "Här finns alla dina pågående \n märkesbytesförfrågningar (både skickade\noch mottagna). Tryck på användarnamnet\nför att se vilket märke personen har\nefterfrågat. Du kan välja att acceptera eller\nneka en mottagen förfrågan.",
                                              style: TextStyle(
                                                  fontSize: 11, height: 2)),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Text("Byteshistorik:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                              "Här kan du se dina tidigare byten.\nTryck på användarnamnet för att se ett\ntidigare byte som har gjorts.\nVill du göra en ny trade? Tryck på knappen\nNytt märkesbyte högst upp på skärmen\nunder Mina märkesbyten. ",
                                              style: TextStyle(
                                                  fontSize: 11, height: 2))
                                        ],
                                      ),

                                      SizedBox(height: 20),
                                      Text("Fler frågor?",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontFamily: 'InknutAntiqua')),
                                      Container(
                                        width: 190,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color.fromARGB(255, 255, 246, 144),
                                                  spreadRadius: 2,
                                                  blurRadius: 0,
                                                  offset: Offset(0, 3))
                                            ]),
                                        child: TextButton(
                                            style: TextButton.styleFrom(
                                                overlayColor: Colors.white,
                                                backgroundColor:
                                                Color.fromARGB(255, 255, 237, 70)),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          FAQPage())); // TAR DIG TILL FAQ SIDAN
                                            },
                                            child: Text("Vanliga frågor",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'InknutAntiqua',
                                                    fontSize: 12))),
                                                    ),
                                                    SizedBox(height: 10),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Icon(Icons.question_mark_rounded,
                                    size: 20, color: Colors.black),
                                elevation: 4,
                                heroTag: null,
                              ),
                            ),
            ),
                        ],
                      ),
                    ),

                    SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 20),
                        Text(
                          "Mina märkesbyten",
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontFamily: 'InknutAntiqua',
                          ),
                        ),
                        SizedBox(width: 30),
                      ],
                    ),
                    SizedBox(height: 15),
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
                          side: BorderSide(width: 1.2, color: Color.fromARGB(255, 122, 255, 186)),
                          backgroundColor: Color.fromARGB(255, 39, 39, 39),
                          overlayColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text(
                          "Nytt märkesbyte",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'InknutAntiqua',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    SizedBox(width: 40),
                    Row(
                      children: [
                        SizedBox(width: 20),
                            Text("Aktiva byten av märken",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'InknutAntiqua',
                              color: Colors.white,
                            )),
                          ],
                    ),
                    SizedBox(height: 5),
                    ...activeTrades.map((trade) => _tradeCard(trade, active: true)),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        SizedBox(width: 20),
                            Text("Byteshistorik:",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'InknutAntiqua',
                              color: Colors.white,
                            )),
                          ],
                    ),
                    SizedBox(height: 5),
                    ...tradeHistory.map((trade) => _tradeCard(trade, active: false)),
                  ],
                ),
          ),
        ],
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
