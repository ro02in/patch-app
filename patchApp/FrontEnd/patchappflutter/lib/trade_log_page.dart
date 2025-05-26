//NYTT FÖRSÖK NY BRANCH

import 'package:flutter/material.dart';
import 'package:patchappflutter/trade_action_page.dart';

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
                    image: DecorationImage(image: AssetImage('assets/stitches3.png'),
                    fit: BoxFit.fill,
                    )
            ),
                child: ListView(
                  padding: EdgeInsets.only(top: 0, left: 30, right: 30),
                  children: [

                    AppBar(
                      backgroundColor: Color.fromARGB(200, 35, 39, 25),
                      elevation: 40,
                      shadowColor: Colors.black,
                      toolbarHeight: 50,
                      leadingWidth: 150,
                      leading: Icon(Icons.arrow_back, color: Colors.white, size: 20),
                      centerTitle: true,
                      titleSpacing: -10,
                      primary: true,
                      //Källhänvisning: 'Rounded bottom on appbar', stackoverflow.com/questions/50242087/rounded-bottom-on-appbar publicerad 13 september 2020, hämtad 23 maj 2025
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(100),
                          )
                      ),
                      title: Text("Byteslogg", style: TextStyle(fontFamily: 'InknutAntiqua', fontSize: 19, color: Colors.white, fontWeight: FontWeight.w600)),
                    ),

                    SizedBox(height: 30),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Mina märkesbyten",
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontFamily: 'InknutAntiqua',
                          ),
                        ),
                        SizedBox(width: 30),
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
                    SizedBox(height: 30), 
                    SizedBox(width: 30),
                    Text("Aktiva byten av märken",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'InknutAntiqua',
                          color: Colors.white,
                        )),
                    SizedBox(height: 5),
                    ...activeTrades.map((trade) => _tradeCard(trade, active: true)),
                    SizedBox(height: 30),
                    Text("Byteshistorik:",
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
