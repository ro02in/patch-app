//24 maj ändringar

import 'package:flutter/material.dart';

class ContinueRegisterPage extends StatefulWidget {
  @override
  State<ContinueRegisterPage> createState() => _ContinueRegisterPageState();
}

class _ContinueRegisterPageState extends State<ContinueRegisterPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/stitches3.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          children: [
              SizedBox(
                  height: 300,
                  child: Image.asset('assets/rosaovve.png', width: 250, height: 250)
              ),
            //rad

            SizedBox(
              height: 30,
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(textAlign: TextAlign.end,
                      "Skapa",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'InknutAntiqua',
                        fontSize: 19,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                      Image.asset(
                        'assets/syttbyttljusrosatext.png', width: 200, height: 200,
                      ),
                    Text(
                      textAlign: TextAlign.start,
                      "konto",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'InknutAntiqua',
                        fontSize: 19,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 18),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 280,
                  height: 110,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 232, 127, 232),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 232, 127, 232),
                        blurRadius: 10,
                        spreadRadius: 4,
                        offset: Offset(0.5, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // TODO: Lägg till din Google Sign-In-funktion här
                          print('Google Sign-In tapped');
                        },
                        child: Container(
                          width: 250,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/googlelogorund.png',
                                height: 30,
                                width: 30,
                              ),
                              SizedBox(width: 12),
                              Text(
                                'Fortsätt med Google',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
