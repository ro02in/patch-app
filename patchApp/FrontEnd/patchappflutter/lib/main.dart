//NYTT FÖRSÖK NY BRANCH

import 'package:flutter/material.dart';
import 'package:patchappflutter/add_patch_page.dart';
import 'package:patchappflutter/continue_register_page.dart';
import 'package:patchappflutter/register_page.dart';
import 'package:patchappflutter/temp_buttons_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LogInPage());
  }
}

class LogInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size; //screensize

    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: screenSize.width,
              height: screenSize.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/stitches1.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 200),
                  Text(
                    "Välkommen till",
                    style: TextStyle(
                      color: Color.fromARGB(255, 239, 137, 254),
                      fontFamily: 'InknutAntiqua',
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 3),
                  Container(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'assets/sbpinklogo.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  SizedBox(
                    child: Image.asset(
                      'assets/syttbyttljusrosatext.png',
                      height: 20,
                      width: 400,
                    ),
                  ),
                  SizedBox(height: 20), //padding

                  Container(
                    width: 310,
                    height: 310,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 53, 53, 53),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Color.fromARGB(255, 226, 93, 246),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 39, 39, 39),
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: Offset(1, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 95),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 39, 39, 39),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: Offset.fromDirection(1, 3),
                              ),
                            ],
                          ),
                          child: SizedBox(
                            width: 240,
                            height: 45,
                            child: OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                  width: 1.2,
                                  color: Color.fromARGB(255, 122, 255, 186),
                                ),
                                backgroundColor: Color.fromARGB(
                                  255,
                                  39,
                                  39,
                                  39,
                                ),
                                overlayColor: Color.fromARGB(
                                  255,
                                  255,
                                  255,
                                  255,
                                ),
                              ),
                              onPressed: () {},
                              label: Text(
                                "Logga in",
                                style: TextStyle(
                                  fontFamily: 'InknutAntiqua',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 39, 39, 39),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: Offset.fromDirection(1, 3),
                              ),
                            ],
                          ),
                          child: SizedBox(
                            width: 240,
                            height: 45,
                            child: OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                  width: 1.2,
                                  color: Color.fromARGB(255, 122, 255, 186),
                                ),
                                backgroundColor: Color.fromARGB(
                                  255,
                                  39,
                                  39,
                                  39,
                                ),
                                overlayColor: Color.fromARGB(
                                  255,
                                  255,
                                  255,
                                  255,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterPage(),
                                  ),
                                );
                              },
                              label: Text(
                                "Registrera konto",
                                style: TextStyle(
                                  fontFamily: 'InknutAntiqua',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // ======================= DEV MENY-KNAPP (tillfällig för utveckling) =======================
                        SizedBox(height: 25),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 39, 39, 39),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset: Offset.fromDirection(1, 3),
                              ),
                            ],
                          ),
                          child: SizedBox(
                            width: 240,
                            height: 45,
                            child: OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                  width: 1.2,
                                  color: Colors.orange,
                                ),
                                backgroundColor: Color.fromARGB(
                                  255,
                                  39,
                                  39,
                                  39,
                                ),
                                overlayColor: Color.fromARGB(
                                  255,
                                  255,
                                  255,
                                  255,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TempButtonsPage(),
                                  ),
                                );
                              },
                              label: Text(
                                "DEV MENY",
                                style: TextStyle(
                                  fontFamily: 'InknutAntiqua',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // ==================== SLUT PÅ DEV-KNAPP ====================
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
