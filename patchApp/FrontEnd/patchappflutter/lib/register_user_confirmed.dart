import 'package:flutter/material.dart';
import 'package:patchappflutter/add_patch_page.dart';

class RegisterUserConfirmedPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 201, 167),
      body: Container(
          padding: EdgeInsets.only(top: 200),
          alignment: Alignment.center,
          
          child: Column(
          children: [
                  Container(
                    alignment: Alignment.center,
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 244, 240, 231),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                      color: const Color.fromARGB(255, 197, 186, 163),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(1, 4)
                      )
                    ]
                    ),
                    
                    child: Column(
                    children: <Widget> [
                    SizedBox(height: 70), //simulated padding
                        Text("Congratulations, you just made an account. \n Welcome to Sytt & Bytt!", textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 19, fontFamily: 'HappyMonkey', fontWeight: FontWeight.w400)),
                        SizedBox(height: 20), //simulated padding
                        
                        //Källhänvisning: Kod från StackOverflow foruminlägg "How to add gradient on icons": stackoverflow.com/questions/73870549/how-to-add-gradient-on-icons hämtad 1/5-2025 kl 16:00
                          ShaderMask(blendMode: BlendMode.srcIn, 
                          shaderCallback: (Rect bounds) => LinearGradient(
                            begin: Alignment.bottomLeft, //diagonal gradient
                            end: Alignment.topRight, //diagonal gradient
                            stops: [.3, 1],
                            colors: [const Color.fromARGB(255, 138, 185, 131), const Color.fromARGB(255, 184, 231, 173)]).createShader(bounds),
                                child: Icon(
                                Icons.check_circle_outline_sharp,
                                size: 90,
                                )
                            ),
                          ]
                      ),
                  ),
                    
                    SizedBox(height: 20), //padding
                      OutlinedButton(
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
                              builder: (context) => PatchViewPage(),
                            ), //hänvisa till confirmation page
                          );
                        },
                        child: Text("Go to patchview page"))
                        
                    ],
                  ),
                
                ),
              );
            }
          }
