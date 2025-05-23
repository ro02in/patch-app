//NYTT FÖRSÖK NY BRANCH

import 'package:flutter/material.dart';
import 'package:patchappflutter/add_patch_page.dart';

class RegisterUserConfirmedPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size; //screensize

    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                  Container(
                    alignment: Alignment.center,
                    width: screenSize.width,
                    height: screenSize.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/stitches6background_darker.png'),
                      fit: BoxFit.fill,
                      )
                    ),
                    
                    child: Container(
                        width: 302,
                        height: 205,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [const Color.fromARGB(255, 255, 255, 255), const Color.fromARGB(255, 225, 216, 223)]),
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 63, 213, 40),
                            spreadRadius: 0.3,
                            blurRadius: 0,
                            offset: Offset(9, 10)
                          ),
                        ]
                      ),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        SizedBox(height: 5), //padding
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 50),
                                    Text("Grattis, du har skapat", textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: 'InknutAntiqua')),
                                ]),
                                Row(
                                  spacing: 0.1,
                                  children: [
                                    SizedBox(width: 50),
                                    Text("ett", textAlign: TextAlign.center, style: TextStyle(color: const Color.fromARGB(255, 27, 27, 27), fontSize: 16, fontFamily: 'InknutAntiqua')),
                                    SizedBox(width: 7),
                                    Image.asset('assets/blacksyttbytttext.png', width: 113, height: 15, alignment: AlignmentDirectional(1, 0)),
                                    SizedBox(width: 6),
                                    Text("konto!", style: TextStyle(fontFamily: 'InknutAntiqua', color: Colors.black, fontSize: 15)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20), //simulated padding
                          
                          //Källhänvisning: Kod från StackOverflow foruminlägg "How to add gradient on icons": stackoverflow.com/questions/73870549/how-to-add-gradient-on-icons hämtad 1/5-2025 kl 16:00
                            Container(
                              height: 75,
                              width: 75,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(
                                        255, 232, 232, 232),
                                    spreadRadius: 0.2,
                                    blurRadius: 0,
                                    offset: Offset(4, 6)
                                  )
                                ]
                              ),
                              child: ShaderMask(blendMode: BlendMode.srcIn, 
                              shaderCallback: (Rect bounds) => LinearGradient(
                                begin: Alignment.bottomLeft, //diagonal gradient
                                end: Alignment.topRight, //diagonal gradient
                                stops: [.3, 1],
                                colors: [const Color.fromARGB(255, 36, 213, 77), const Color.fromARGB(
                                    255, 142, 255, 115)]).createShader(bounds),
                                    child: Icon(
                                    Icons.check_circle_outline_sharp,
                                    size: 70,
                                    )
                                ),
                            ),
                            ]
                        ),
                    ),
                  ),
                    
                     /* OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            width: 1,
                            color: const Color.fromARGB(255, 199, 199, 199),
                          ),
                          backgroundColor: Color.fromARGB(255, 232, 232, 232),
                          //shadowColor: const Color.fromARGB(255, 219, 115, 170),
                          overlayColor: const Color.fromARGB(255, 208, 208, 208),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PatchViewPage(), //ska leda till startsida
                            ), //hänvisa till confirmation page
                          );
                        },
                        child: Text("Continue", style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 15))) */
                    ],
                  
                ),
              );
            }
          }
