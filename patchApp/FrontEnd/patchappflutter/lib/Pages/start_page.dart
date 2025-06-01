
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patchappflutter/Pages/continue_login_page.dart';
import 'package:patchappflutter/Pages/provider_test_page.dart';
import 'package:patchappflutter/Pages/temp_buttons_page.dart';

import '../Model/patch_model.dart';
import '../Provider/Patch_Provider.dart';
import 'continue_register_page.dart';

class StartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/stitches1.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Text(
                "WELCOME TO",
                style: TextStyle(
                  color: Color.fromARGB(255, 239, 137, 254),
                  fontFamily: 'InknutAntiqua',
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),

              SizedBox(height: 6),

              Container(
                height: 35,
                width: 300,
                child: Image.asset('assets/syttbyttljusrosatext.png', height: 450, width: 450),
              ),

              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 53, 53, 53).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Color.fromARGB(255, 85, 85, 85), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 30, 30, 30),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(1, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(150, 32, 32, 32),
                                spreadRadius: 3,
                                blurRadius: 8,
                                offset: Offset(0, 2)
                            )
                          ]
                      ),
                      child: Container(
                        width: 220,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Color.fromARGB(255, 226, 93, 246), width: 1),
                        ),
                        child: OutlinedButton( //30 maj 20:46
                            style: OutlinedButton.styleFrom(
                                overlayColor: Colors.black54,
                                splashFactory: NoSplash.splashFactory
                            ),
                            onPressed: () async {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                            },
                            child: Text("Logga in", style: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 17))),
                      ),
                    ),

                    SizedBox(height: 20),

                    Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(150, 32, 32, 32),
                                spreadRadius: 3,
                                blurRadius: 8,
                                offset: Offset(0, 2)
                            )
                          ]
                      ),
                      child: Container(
                        width: 220,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.purpleAccent, width: 1),
                        ),
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom( //30 maj 20:46
                                overlayColor: Colors.black54,
                                splashFactory: NoSplash.splashFactory
                            ),
                            onPressed: () {
                              //Gå till ContinueRegisterPage() med epost och lösenord //30 maj
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => ProviderUIScreen()));
                            },
                            child: Text("Registrera konto", style: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 17))),
                      ),
                    ),
                    // buildButton(context, "LOG IN", LoginPage(), Colors.purple),
                    SizedBox(height: 20),
                    // buildButton(context, "REGISTER", ContinueRegisterPage(), Colors.tealAccent),
                    // SizedBox(height: 20),
                    buildButton(context, "DEV MENY", TempButtonsPage(), Colors.orange),
                  ],
                ),
              ),
            ],

          ),

        ),


      ),

    );

  }

  Widget buildButton(BuildContext context, String text, Widget destination, Color color) {
    return SizedBox(
      width: 240,
      height: 45,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1.2, color: color),
          backgroundColor: Color.fromARGB(255, 39, 39, 39),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'InknutAntiqua',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
