import 'package:flutter/material.dart';
import 'package:patchappflutter/main.dart'; //sidan LogInPage
import 'package:patchappflutter/register_user_confirmed.dart'; //sidan RegisterUserConfirmedPage

class RegisterPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 244, 240, 231), //beige
        body: Column(
          children: [
          SizedBox(height: 50),
          Text("Create new Sytt & Bytt Account", textAlign: TextAlign.left, style: TextStyle(fontFamily: 'HappyMonkey', color: const Color.fromARGB(255, 32, 32, 32), fontSize: 16, fontWeight: FontWeight.w200)),
          Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 20),
          color: const Color.fromARGB(255, 241, 241, 241), //bakgrunden bakom inputfields-Container
          
          child: Container(
            width: 400,
            height: 520,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 244, 240, 231),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 230, 218, 192),
                  blurRadius: 15,
                  spreadRadius: 3,
                  offset: Offset(10, 10)
                )
              ] 
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
              //Text("Create new 'MärkesAppNameHere' Account", textAlign: TextAlign.left, style: TextStyle(fontFamily: 'DMSans', color: const Color.fromARGB(255, 0, 0, 0), fontSize: 27, fontWeight: FontWeight.w200)),
              SizedBox(height: 70), //simulated padding
              
              //KNAPP 1
              Container( 
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 234, 221, 189),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 197, 186, 163),
                    blurRadius: 3,
                    spreadRadius: 2,
                    offset: Offset(1, 2)
                  )
                  ]),
              child: SizedBox(
                height: 42,
                width: 280,
                child: TextField(
                    obscureText: false,
                    cursorColor: Colors.black,
                    cursorHeight: 19,
                    style: TextStyle(color: Colors.black, fontFamily: 'HappyMonkey', fontSize: 14),
                    decoration: InputDecoration(
                      //hintStyle: TextStyle(color: Colors.black),
                      hoverColor: Colors.black,
                      labelText: 'Name:', labelStyle: TextStyle(fontFamily: ('HappyMonkey')), floatingLabelStyle: TextStyle(color: Colors.black, fontFamily: ('HappyMonkey'), fontSize: 17, fontWeight: FontWeight.w500),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: const Color.fromARGB(255, 19, 19, 19), width: 1.1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: const Color.fromARGB(255, 19, 19, 19), width: 1.1),
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
                color: Color.fromARGB(255, 234, 221, 189),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 197, 186, 163),
                    blurRadius: 3,
                    spreadRadius: 2,
                    offset: Offset(1, 2)
                  )
                  ]),
              child: SizedBox(
                height: 42,
                width: 280,
                child: TextField(
                    obscureText: false,
                    cursorColor: Colors.black,
                    cursorHeight: 19,
                    style: TextStyle(color: Colors.black, fontFamily: 'HappyMonkey', fontSize: 14),
                    decoration: InputDecoration(labelText: 'KM name:', labelStyle: TextStyle(fontFamily: ('HappyMonkey')), floatingLabelStyle: TextStyle(color: Colors.black, fontFamily: ('HappyMonkey'), fontSize: 17, fontWeight: FontWeight.w500), //OPTIONAL
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: const Color.fromARGB(255, 19, 19, 19), width: 1.1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: const Color.fromARGB(255, 19, 19, 19), width: 1.1),
                        borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                ),
              ),
            
              SizedBox(height: 20),
            
              Container( 
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 234, 221, 189),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 197, 186, 163),
                    blurRadius: 3,
                    spreadRadius: 2,
                    offset: Offset(1, 2)
                  )
                  ]),
              child: SizedBox(
                height: 42,
                width: 280,
                child: TextField(
                    obscureText: false,
                    cursorColor: Colors.black,
                    cursorHeight: 19,
                    style: TextStyle(color: Colors.black, fontFamily: 'HappyMonkey', fontSize: 14),
                    decoration: InputDecoration(labelText: 'Section:', labelStyle: TextStyle(fontFamily: ('HappyMonkey')), floatingLabelStyle: TextStyle(color: Colors.black, fontFamily: ('HappyMonkey'), fontSize: 17, fontWeight: FontWeight.w500), //OPTIONAL
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: const Color.fromARGB(255, 19, 19, 19), width: 1.1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: const Color.fromARGB(255, 19, 19, 19), width: 1.1),
                        borderRadius: BorderRadius.circular(30),
                    ),
                    ),
                  ),
                ),
              ),
            
              SizedBox(height: 20),
            
              Container(  //"Enter your university"
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 234, 221, 189),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 197, 186, 163),
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: Offset(1, 3)
                  )
                  ]
                ),
              child: SizedBox(
                height: 42,
                width: 280,
                child: TextField(
                    obscureText: false,
                    cursorColor: Colors.black,
                    cursorHeight: 19,
                    style: TextStyle(color: Colors.black, fontFamily: 'HappyMonkey', fontSize: 14),
                    decoration: InputDecoration(labelText: 'Your university:', labelStyle: TextStyle(fontFamily: ('HappyMonkey')), floatingLabelStyle: TextStyle(color: Colors.black, fontFamily: ('HappyMonkey'), fontSize: 17, fontWeight: FontWeight.w500),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: const Color.fromARGB(255, 49, 49, 49), width: 1.1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: const Color.fromARGB(255, 49, 49, 49), width: 1.1),
                        borderRadius: BorderRadius.circular(30),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: const Color.fromARGB(255, 255, 64, 64), width: 1.1),
                    )
                    ),
                    ),
                  ),
              ),
            
              SizedBox(height: 19), //padding mellan input-fields och de 2 knapparna
            
              //KNAPP 2
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 178, 202, 172),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset.fromDirection(1, 3)
                    )
                  ]
                ),
              
              child: SizedBox(
               // alignment: Alignment.center,
                height: 40,
                width: 190,
                child: TextButton(
                  style: TextButton.styleFrom(
                  side: BorderSide(width: 0.8, color: const Color.fromARGB(255, 0, 0, 0)),
                  backgroundColor: Color.fromARGB(255, 142, 164, 136),
                  //shadowColor: const Color.fromARGB(255, 255, 198, 43),
                  overlayColor: const Color.fromARGB(255, 123, 152, 115),
                  ),
                  onPressed: () { //vad som sker när man trycker på knappen
                    Navigator.push( 
                                  context,
                                  MaterialPageRoute(builder: (context) => RegisterUserConfirmedPage()), //hänvisa till confirmation page
                              );
                  },
                  child: Text("Register", style: TextStyle(fontFamily: 'HappyMonkey', color: Colors.black, fontSize: 16)))
              ),
            ),
              
              SizedBox(height: 20), //padding mellan input-fält och register

              SizedBox(
                height: 28,
                width: 300,
                child: Text("Already have a Sytt & Bytt account?", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'HappyMonkey', color: Colors.black, fontSize: 14.5, fontWeight: FontWeight.w400))
                ),
              //SizedBox(height: 5), //padding

              //KNAPP 3
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 178, 202, 172),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset.fromDirection(1, 4)
                    )
                  ]
                ),
                //padding: EdgeInsets.symmetric(vertical: 20),
                height: 40,
                width: 190,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 0.8, color: const Color.fromARGB(255, 14, 58, 20)),
                        backgroundColor: Color.fromARGB(255, 123, 152, 115),
                        //shadowColor: const Color.fromARGB(255, 219, 115, 170),
                        overlayColor: const Color.fromARGB(255, 123, 152, 115),
                        ),
                        onPressed: () { //vad som sker när man trycker på knappen
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogInPage()), //hänvisa till confirmation page
                      );
                    },
                        child: Text("Log in", style: TextStyle(fontFamily: 'HappyMonkey', color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400)))
                )
              ]
            ),
          )
        )
          ],
        ),
      );
    }
}