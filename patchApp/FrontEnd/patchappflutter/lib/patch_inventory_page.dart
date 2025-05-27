
import 'package:flutter/material.dart';
//import 'package:patchappflutter/add_patch_page';

class PatchInventoryPage extends StatelessWidget {
  //late final String patchName; //TODO BACKEND hämta variabel
  //late final String description; //TODO BACKEND hämta variabel
  //late final String patchColor; //TODO BACKEND hämta variabel
  //late final String club; //TODO BACKEND hämta variabel
  //late final String placement; //TODO BACKEND hämta variabel
  //late final bool isPublic; //TODO BACKEND hämta variabel
  //late final bool isTradable; //TODO BACKEND hämta variabel
  //late final int amount; //TODO BACKEND hämta variabel
  //late = initialize later

  //tillfälliga testvärden
  final int amount = 0; //TODO BACKEND hämta variabel
  final String patchName = "PatchName"; //TODO BACKEND hämta variabel
  final String description = "Test"; //TODO BACKEND hämta variabel
  final String patchColor = "Orange"; //TODO BACKEND hämta variabel
  final String club = "Test"; //TODO BACKEND hämta variabel
  final String placement = "Vänster arm"; //TODO BACKEND hämta variabel
  final bool isPublic = true; //TODO BACKEND hämta variabel
  final bool isTradable = true; //TODO BACKEND hämta variabel

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size; //screensize

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 31, 31),
      body: ListView(
        padding: EdgeInsets.only(bottom: 0),
        children: [
          Column(
            children: [
                  Container(
                    width: screenSize.width,
                    height: screenSize.height,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/stitches7.png"),
                        fit: BoxFit.fill,
                      ),
                    ),

                    child: Column(
                      children: [
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 16),
                            Container(
                              width: 88,
                              height: 88,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 234, 111, 255),
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 234, 111, 255),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: Offset(0, 0)
                                  )
                                ]
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Amount", style: TextStyle(color: Color.fromARGB(255, 40, 40, 40), fontSize: 14, fontFamily: 'InknutAntiqua')),
                                  Text('$amount', style: TextStyle(color: Color.fromARGB(255, 40, 40, 40), fontSize: 21, fontFamily: 'CalSans')),
                                ],
                              )
                            ),

                            SizedBox(width: 19),

                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.amberAccent,
                                        spreadRadius: 1,
                                        blurRadius: 0,
                                        offset: Offset(0, 4)
                                    )
                                  ]
                              ),
                              child: CircleAvatar(
                                radius: 80,
                                backgroundColor: Colors.white,
                                foregroundImage: AssetImage(""), //TODO: BACKEND IMAGE.NETWORK (Image.network(src) HTTP-LÄNK MÄRKESBILD HÄR
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 25),

                        Text('$patchName', style: TextStyle(color: Colors.white, fontSize: 25, fontFamily: 'InknutAntiqua')),

                        SizedBox(height: 15),

                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 25, 25, 25),
                                spreadRadius: 2,
                                blurRadius: 17,
                                offset: Offset(0, 0)
                              )
                            ]
                          ),
                          child: Container( //PATCH DESCRIPTION //BACKEND
                            height: 120,
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color.fromARGB(255, 239, 137, 255), width: 3),
                                color: Color.fromARGB(255, 234, 111, 255),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 234, 111, 255),
                                      spreadRadius: 2,
                                      blurRadius: 6,
                                      offset: Offset(0.5, 1)
                                  )
                                ]
                            ),
                            alignment: Alignment.topCenter,
                            child: Padding(padding: EdgeInsets.all(15),
                              child: Text("hejehjejej", style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: 'InknutAntiqua')), //BACKEND userName-värde
                            )
                          ),
                        ),

                        SizedBox(height: 35),

                        Container( //PATCHCOLOR BOX //BACKEND
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color.fromARGB(255, 60,60, 60), width: 3),
                                color: Color.fromARGB(255, 40, 40, 40),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 30, 30, 30),
                                      spreadRadius: 2,
                                      blurRadius: 6,
                                      offset: Offset(0.5, 1)
                                  )
                                ]
                            ),
                            alignment: Alignment.center,
                            child: Padding(padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Text("Orange", style: TextStyle(color: Color.fromARGB(255, 190, 190, 190), fontSize: 16, fontFamily: 'InknutAntiqua')), //BACKEND userName-värde
                            )
                        ),

                        SizedBox(height: 15),

                        Container( //KLUBBMÄSTERI BOX //BACKEND
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color.fromARGB(255, 60,60, 60), width: 3),
                                color: Color.fromARGB(255, 40, 40, 40),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 30, 30, 30),
                                      spreadRadius: 2,
                                      blurRadius: 6,
                                      offset: Offset(0.5, 1)
                                  )
                                ]
                            ),
                            alignment: Alignment.center,
                            child: Padding(padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Text("Klubbmästeri", style: TextStyle(color: Color.fromARGB(255, 190, 190, 190), fontSize: 16, fontFamily: 'InknutAntiqua')), //BACKEND userName-värde
                            )
                        ),

                        SizedBox(height: 15),

                        Container( //PLACERING BOX //BACKEND
                            height: 50,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color.fromARGB(255, 60,60, 60), width: 3),
                                color: Color.fromARGB(255, 40, 40, 40),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 30, 30, 30),
                                      spreadRadius: 2,
                                      blurRadius: 6,
                                      offset: Offset(0.5, 1)
                                  )
                                ]
                            ),
                            alignment: Alignment.center,
                            child: Padding(padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Text("Vänster arm", style: TextStyle(color: Color.fromARGB(255, 190, 190, 190), fontSize: 16, fontFamily: 'InknutAntiqua')), //BACKEND userName-värde
                            )
                        ),

                        SizedBox(height: 40),

                        Container(
                          width: 400,
                          height: 178,
                          color: Color.fromARGB(150, 37, 37, 37),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 140,
                                  height: 55,
                                  decoration: BoxDecoration(
                                      color:  Color.fromARGB(255, 40, 40, 40),
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Color.fromARGB(255, 60,60, 60), width: 3),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black,
                                            spreadRadius: 2,
                                            blurRadius: 8,
                                            offset: Offset(0, 0)
                                        )
                                      ]
                                  ),
                                  alignment: Alignment.center,
                                  child: Text('$isPublic', style: TextStyle(color: Color.fromARGB(255, 200, 200, 200), fontFamily: 'InknutAntiqua', fontSize: 20))
                              ),

                              SizedBox(width: 22),

                              Container(
                                  width: 140,
                                  height: 55,
                                  decoration: BoxDecoration(
                                      color:  Color.fromARGB(255, 40, 40, 40),
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Color.fromARGB(255, 60,60, 60), width: 3),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black,
                                            spreadRadius: 2,
                                            blurRadius: 8,
                                            offset: Offset(0, 0)
                                        )
                                      ]
                                  ),
                                  alignment: Alignment.center,
                                  child: Text('$isTradable', style: TextStyle(color: Color.fromARGB(255, 200, 200, 200), fontFamily: 'InknutAntiqua', fontSize: 20))
                              ),
                            ],
                          ),
                        )
                      ] //main column children
                    ) //main column
                  ),
              ]
          )
        ],
      ),
    );
  }
}

