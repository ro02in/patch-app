//NYTT FÖRSÖK NY BRANCH

import 'package:flutter/material.dart';
import 'package:patchappflutter/main.dart'; //sidan LogInPage
import 'package:patchappflutter/register_user_confirmed.dart'; //sidan RegisterUserConfirmedPage

class RegisterPage extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      var screenSize = MediaQuery.of(context).size; //screensize

      return Scaffold(
        //backgroundColor: Color.fromARGB(255, 244, 240, 231), //beige
        body: Column(
          children: [
          //SizedBox(height: 50),
          //Text("Create new Sytt & Bytt Account", textAlign: TextAlign.left, style: TextStyle(fontFamily: 'HappyMonkey', color: const Color.fromARGB(255, 32, 32, 32), fontSize: 16, fontWeight: FontWeight.w200)),
          Container(
          alignment: Alignment.center,
          //padding: EdgeInsets.only(top: 20),
          color: const Color.fromARGB(255, 241, 241, 241), //bakgrunden bakom inputfields-Container
          
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/stitches4.png'),
                fit: BoxFit.fill,
                    )
                  ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                SizedBox(height: 50),
                
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 255, 112, 243),
                        spreadRadius: 2,
                        blurRadius: 14,
                        offset: Offset(1, 2)
                      )
                    ]
                  ),
                  child: CircleAvatar(
                    radius: 80,
                    child: Image.asset('assets/sbpinklogo.png')
                  ),
                ),
                SizedBox(height: 30), //padding
               
                //Add profile picture knapp
                Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 255, 129, 211),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0.5, 1)
                      )
                    ]
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 112, 243),
                      disabledForegroundColor: Colors.transparent,
                      disabledBackgroundColor: Colors.transparent,
                      shadowColor: const Color.fromARGB(255, 255, 112, 243),
                      overlayColor: Colors.white
                    ),
                    onPressed: () {}, //API kamera (backend)
                    child: Text("Add profile picture", textAlign: TextAlign.left, style: TextStyle(fontFamily: 'InknutAntiqua', color: Colors.black, fontSize: 14, fontWeight: FontWeight.w200)
                  )),
                ),
                SizedBox(height: 30), //simulated padding
              
              //KNAPP 1
              Container( 
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 122, 217, 255),
                    blurRadius: 3,
                    spreadRadius: 2,
                    offset: Offset(1, 2)
                  )
                  ]),
              child: SizedBox(
                height: 55,
                width: 350,
                child: TextField(
                    obscureText: false,
                    cursorColor: const Color.fromARGB(255, 214, 18, 185),
                    cursorHeight: 24,
                    style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 15),
                    decoration: InputDecoration(
                      //hintStyle: TextStyle(color: Colors.black),
                      hoverColor: Colors.black,
                      labelText: 'Name:', labelStyle: TextStyle(fontFamily: ('InknutAntiqua')), floatingLabelBehavior: FloatingLabelBehavior.never,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent, width: 1.1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 1.1),
                          borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
              //SizedBox(height: 20), //padding
            
              SizedBox(height: 20), //padding mellan password-textfield (input) och Email-input field
                
              //SizedBox(height: 20), //padding
            
              Container( 
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 122, 217, 255),
                    blurRadius: 3,
                    spreadRadius: 2,
                    offset: Offset(1, 2)
                  )
                  ]),
              child: SizedBox(
                height: 55,
                width: 350,
                child: TextField(
                    obscureText: false,
                    cursorColor: const Color.fromARGB(255, 214, 18, 185),
                    cursorHeight: 24,
                    style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 14),
                    decoration: InputDecoration(labelText: 'KM name:', labelStyle: TextStyle(fontFamily: ('InknutAntiqua')), floatingLabelBehavior: FloatingLabelBehavior.never, //OPTIONAL
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent, width: 1.1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent, width: 1.1),
                        borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                ),
              ),
            
              SizedBox(height: 20),
            
              Container( 
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 122, 217, 255),
                    blurRadius: 3,
                    spreadRadius: 2,
                    offset: Offset(1, 2)
                  )
                  ]),
              child: SizedBox(
                height: 56,
                width: 350,
                child: TextField(
                    obscureText: false,
                    cursorColor: const Color.fromARGB(255, 214, 18, 185),
                    cursorHeight: 24,
                    style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 14),
                    decoration: InputDecoration(labelText: 'Section:', labelStyle: TextStyle(fontFamily: ('InknutAntiqua')), floatingLabelBehavior: FloatingLabelBehavior.never, //OPTIONAL
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent, width: 1.1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent, width: 1.1),
                        borderRadius: BorderRadius.circular(30),
                    ),
                    ),
                  ),
                ),
              ),
            
              SizedBox(height: 20),
            
              Container(  //"Enter your university"
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 122, 217, 255),
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: Offset(1, 3)
                  )
                  ]
                ),
              child: SizedBox(
                height: 55,
                width: 350,
                child: TextField(
                    obscureText: false,
                    cursorColor: const Color.fromARGB(255, 214, 18, 185),
                    cursorHeight: 24,
                    style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 14),
                    decoration: InputDecoration(labelText: 'Your university:', labelStyle: TextStyle(fontFamily: ('InknutAntiqua')), floatingLabelBehavior: FloatingLabelBehavior.never,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent, width: 1.1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent, width: 1.1),
                        borderRadius: BorderRadius.circular(30),
                    ),
                    ),
                    ),
                  ),
              ),
            
              SizedBox(height: 26), //padding mellan input-fields och de 2 knapparna
            
              //KNAPP 2
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 255, 129, 211),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset.fromDirection(0.5, 1)
                    )
                  ]
                ),
              
              child: SizedBox(
               // alignment: Alignment.center,
                height: 45,
                width: 150,
                child: TextButton(
                  style: TextButton.styleFrom(
                  //side: BorderSide(width: 0.8, color: const Color.fromARGB(255, 0, 0, 0)),
                  backgroundColor: const Color.fromARGB(255, 255, 112, 243),
                  //shadowColor: const Color.fromARGB(255, 255, 198, 43),
                  overlayColor: Colors.white
                  ),
                  onPressed: () { //vad som sker när man trycker på knappen
                    Navigator.push( 
                                  context,
                                  MaterialPageRoute(builder: (context) => RegisterUserConfirmedPage()), //hänvisa till confirmation page
                              );
                  },
                  child: Text("Register", style: TextStyle(fontFamily: 'InknutAntiqua', color: Colors.black, fontSize: 16)))
              ),
            ),
              
              SizedBox(height: 20), //padding mellan input-fält och register

              ]
            ),
          )
        )
          ],
        ),
      );
    }
}