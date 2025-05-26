
import 'package:flutter/material.dart';
//import 'package:patchappflutter/add_patch_page';

class PatchInventoryPage extends StatelessWidget {
  final String name = ''; //TODO BACKEND hämta variabel
  final String description = "Ett färgstarkt neonmärke som lyser upp overallen."; //TODO BACKEND hämta variabel
  final String color = "Svart"; //TODO BACKEND hämta variabel
  final String club = "Ultunesaren"; //TODO BACKEND hämta variabel
  final String placement = "Vänster arm"; //TODO BACKEND hämta variabel
  final bool isPublic = true;
  final bool isTradable = true;
  final int amount = 1;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size; //screensize

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 31, 31),
      body: ListView(
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
                        Row(
                          children: [
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
                                foregroundImage: AssetImage(""), //TODO: BACKEND MÄRKESBILD HÄR
                              ),
                            ),
                          ],
                        )
                      ]
                    )

                  ),
              ]
          )
        ],
      ),
    );
  }
}

