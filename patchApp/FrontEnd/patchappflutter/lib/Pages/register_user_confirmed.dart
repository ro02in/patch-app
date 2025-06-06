//NYTT FÖRSÖK NY BRANCH

import 'package:flutter/material.dart';
import 'package:patchappflutter/Pages/add_patch_page.dart';
import 'package:patchappflutter/Pages/post_log_in_page.dart';
import 'package:patchappflutter/Pages/profile_page.dart';

class RegisterUserConfirmedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: screenSize.width,
            height: screenSize.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/stitches6background_darker.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 52),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 302,
                      height: 205,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            const Color.fromARGB(255, 255, 255, 255),
                            const Color.fromARGB(255, 225, 216, 223)
                          ],
                        ),
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 63, 213, 40),
                            spreadRadius: 0.3,
                            blurRadius: 0,
                            offset: Offset(9, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 5),
                          Container(
                            alignment: Alignment.topCenter,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 50),
                                    Text(
                                      "Grattis, du har skapat",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'InknutAntiqua',
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: 50),
                                    Text(
                                      "ett",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: const Color.fromARGB(255, 27, 27, 27),
                                        fontSize: 16,
                                        fontFamily: 'InknutAntiqua',
                                      ),
                                    ),
                                    SizedBox(width: 7),
                                    Image.asset(
                                      'assets/blacksyttbytttext.png',
                                      width: 113,
                                      height: 15,
                                      alignment: AlignmentDirectional(1, 0),
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      "konto!",
                                      style: TextStyle(
                                        fontFamily: 'InknutAntiqua',
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 232, 232, 232),
                                  spreadRadius: 0.2,
                                  blurRadius: 0,
                                  offset: Offset(4, 6),
                                ),
                              ],
                            ),
                            child: ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (Rect bounds) => LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                stops: [.3, 1],
                                colors: [
                                  const Color.fromARGB(255, 36, 213, 77),
                                  const Color.fromARGB(255, 142, 255, 115)
                                ],
                              ).createShader(bounds),
                              child: Icon(
                                Icons.check_circle_outline_sharp,
                                size: 70,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 60),

                // ⬇️ FLYTTAD knapp – NU placeras den här
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 214, 69, 255),
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: Offset(0.5, 1),
                          ),
                        ],
                      ),
                      child: Container(
                        width: 190,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 250, 95, 255),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 202, 31, 246),
                              spreadRadius: 2,
                              blurRadius: 0,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostLoginPage(), //30 maj ny redirect till bottomNavigationPage som håller i de 3 huvudsakliga sidorna för appen.
                              ),
                            );
                          },
                          child: Text(
                            "Gå till Din profil",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'InknutAntiqua',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}