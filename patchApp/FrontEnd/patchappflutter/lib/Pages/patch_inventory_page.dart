
import 'package:flutter/material.dart';
import 'package:patchappflutter/Model/patch_model.dart';
import 'package:patchappflutter/Pages/profile_page.dart';
//import 'package:patchappflutter/add_patch_page';

import 'dart:typed_data';

import 'package:patchappflutter/global_user_info.dart';



class PatchInventoryPage extends StatelessWidget {

  const PatchInventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size; //screensize
    PatchModel patch = GlobalUserInfo.patchTester;
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
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 318),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 60, 60, 60),
                                    spreadRadius: 4,
                                    blurRadius: 0,
                                    offset: Offset(0, 0)
                                  )
                                ]
                              ),
                              padding: EdgeInsets.zero,
                              child: FloatingActionButton(
                                backgroundColor: Color.fromARGB(
                                    255, 40, 40, 40),
                                shape: const CircleBorder(),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ProfilePage()),
                                  );
                                },
                                child: Icon(Icons.arrow_back, color: Color.fromARGB(200, 255, 255, 255), size: 28),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 6),
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
                              /*child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Amount", style: TextStyle(color: Color.fromARGB(255, 40, 40, 40), fontSize: 14, fontFamily: 'InknutAntiqua')),
                                  Text('$amount', style: TextStyle(color: Color.fromARGB(255, 40, 40, 40), fontSize: 21, fontFamily: 'CalSans')),
                                ],
                              )*/
                            ),

                            SizedBox(width: 25),

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
                                radius: 70,
                                backgroundColor: Colors.white,
                                foregroundImage: patch.pictureData != null
                                    ? MemoryImage(patch.pictureData!)
                                    : null, //TODO: BACKEND IMAGE.NETWORK (Image.network(src) HTTP-LÄNK MÄRKESBILD HÄR
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 16),

                        Text(patch.patchName, style: TextStyle(color: Colors.white, fontSize: 25, fontFamily: 'InknutAntiqua')),

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
                              child: Text(patch.description, style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: 'InknutAntiqua')), //BACKEND userName-värde
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
                              child: Text(patch.color, style: TextStyle(color: Color.fromARGB(255, 190, 190, 190), fontSize: 16, fontFamily: 'InknutAntiqua')), //BACKEND userName-värde
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
                              child: Text(patch.klubbmasteri, style: TextStyle(color: Color.fromARGB(255, 190, 190, 190), fontSize: 16, fontFamily: 'InknutAntiqua')), //BACKEND userName-värde
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
                              child: Text(patch.placement, style: TextStyle(color: Color.fromARGB(255, 190, 190, 190), fontSize: 16, fontFamily: 'InknutAntiqua')), //BACKEND userName-värde
                            )
                        ),

                        SizedBox(height: 20),

                        //GRÅ BOX LÄNGST NER
                        Container(
                          width: 400,
                          height: 100,
                          color: Color.fromARGB(150, 37, 37, 37),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 140,
                                  height: 52,
                                  decoration: BoxDecoration(
                                      color:  Color.fromARGB(255, 40, 40, 40),
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Color.fromARGB(255, 60,60, 60), width: 3),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(255, 20, 20, 20),
                                            spreadRadius: 2,
                                            blurRadius: 8,
                                            offset: Offset(0, 0)
                                        )
                                      ]
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(patch.isPublic.toString(), style: TextStyle(color: Color.fromARGB(255, 200, 200, 200), fontFamily: 'InknutAntiqua', fontSize: 20))
                              ),

                              SizedBox(width: 25),

                              /*Container(
                                  width: 140,
                                  height: 52,
                                  decoration: BoxDecoration(
                                      color:  Color.fromARGB(255, 40, 40, 40),
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Color.fromARGB(255, 60,60, 60), width: 3),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(255, 20, 20, 20),
                                            spreadRadius: 2,
                                            blurRadius: 8,
                                            offset: Offset(0, 0)
                                        )
                                      ]
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(patch., style: TextStyle(color: Color.fromARGB(255, 200, 200, 200), fontFamily: 'InknutAntiqua', fontSize: 20))
                              ),*/
                            ],
                          ),
                        ),

                        SizedBox(height: 17),

                        //DELETE KNAPP
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 237, 138, 255),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: Offset(0, 0)
                                  )
                                ]
                              ),
                              child: FloatingActionButton(
                                heroTag: "FAB6",
                                onPressed: () {

                              }, backgroundColor: Color.fromARGB(255, 234, 111, 255),
                                shape: const CircleBorder(side: BorderSide(color: Color.fromARGB(255, 237, 138, 255), width: 2)),
                                child: Icon(Icons.delete, color: Color.fromARGB(255, 40, 40, 40), size: 31)
                              ),
                            )
                          ]
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
//final int amount = 0; //TODO BACKEND hämta variabel
//final String patchName = "PatchName"; //TODO BACKEND hämta variabel
//final String description = "Test"; //TODO BACKEND hämta variabel
//final String patchColor = "Orange"; //TODO BACKEND hämta variabel
//final String club = "Test"; //TODO BACKEND hämta variabel
//final String placement = "Vänster arm"; //TODO BACKEND hämta variabel
//final bool isPublic = true; //TODO BACKEND hämta variabel
//final bool isTradable = true; //TODO BACKEND hämta variabel