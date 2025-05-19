//NYTT FÖRSÖK NY BRANCH

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
        alignment: Alignment.center,
        width: screenSize.width,
        height: screenSize.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/stitches3.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 90),
            Image.asset('assets/syttbytt2.png', width: 150, height: 150),
            SizedBox(height: 2),
            Text(
              "Create Sytt & Bytt account",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'HappyMonkey',
                fontSize: 18,
                fontWeight: FontWeight.w200,
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: 310,
              height: 310,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 231, 225, 210),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 200, 191, 172),
                    blurRadius: 5,
                    spreadRadius: 2,
                    offset: Offset(1, 4),
                  )
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: 70),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4,
                          spreadRadius: 2,
                          offset: Offset(1, 2),
                        )
                      ],
                    ),
                    child: SizedBox(
                      width: 250,
                      height: 50,
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        icon: Image.asset(
                          'assets/syttbyttcirclelogo.png',
                          width: 30,
                          height: 30,
                          alignment: Alignment.centerLeft,
                        ),
                        onPressed: () {},
                        label: Text(
                          "Continue with ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Roboto Medium',
                          ),
                        ),
                      ),
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
