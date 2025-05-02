import 'package:flutter/material.dart';
import 'package:patchappflutter/main.dart'; //sidan LogInPage
import 'package:patchappflutter/register_user_confirmed.dart'; //sidan RegisterUserConfirmedPage

class RegisterPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 80),
          color: const Color.fromARGB(255, 250, 250, 250),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
            Text("Create new 'MärkesAppNameHere' Account", textAlign: TextAlign.left, style: TextStyle(fontFamily: 'DMSans', color: const Color.fromARGB(255, 0, 0, 0), fontSize: 30, fontWeight: FontWeight.w200)),
            SizedBox(height: 50), //simulated padding

            //KNAPP 1
            Container( 
            child: SizedBox(
              height: 60,
              width: 280,
              child: TextField(
                  cursorColor: Colors.black,
                  cursorHeight: 20,
                  style: TextStyle(color: Colors.black, fontFamily: "DMSans"),
                  decoration: InputDecoration(
                    //hintStyle: TextStyle(color: Colors.black),
                    hoverColor: Colors.black,
                    labelText: 'Create username', labelStyle: TextStyle(color: const Color.fromARGB(255, 27, 27, 27)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey, width: 1.1),
                      borderRadius: BorderRadius.circular(0),
                    )
                    ),
                    obscureText: false,
                  ),
                ),
            ),
            SizedBox(height: 20), //padding

            Container( 
            child: SizedBox(
              height: 60,
              width: 280,
              child: TextField(
                  cursorColor: Colors.black,
                  cursorHeight: 20,
                  style: TextStyle(color: Colors.black, fontFamily: "DMSans"),
                  decoration: InputDecoration(labelText: 'Create password', labelStyle: TextStyle(color: const Color.fromARGB(255, 27, 27, 27)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey, width: 1.1),
                      borderRadius: BorderRadius.circular(0),
                    )
                  ),
                  obscureText: true,
                  ),
                ),
            ),

            SizedBox(height: 20), //padding mellan password-textfield (input) och Email-input field

            Container( 
            child: SizedBox(
              height: 60,
              width: 280,
              child: TextField(
                  cursorColor: Colors.black,
                  cursorHeight: 20,
                  style: TextStyle(color: Colors.black, fontFamily: "DMSans"),
                  decoration: InputDecoration(labelText: 'Enter your email adress', labelStyle: TextStyle(color: const Color.fromARGB(255, 27, 27, 27)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey, width: 1.1),
                      borderRadius: BorderRadius.circular(0),
                    )
                  ),
                  obscureText: true,
                  ),
                ),
            ),
    
            SizedBox(height: 60), //padding

            //KNAPP 2
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 67, 67, 67),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset.fromDirection(1, 4)
                  )
                ]
              ),
            
            child: SizedBox(
             // alignment: Alignment.center,
              height: 40,
              width: 220,
              child: TextButton(
                style: TextButton.styleFrom(
                side: BorderSide(width: 1, color: const Color.fromARGB(255, 199, 199, 199)),
                backgroundColor: Color.fromARGB(255, 232, 232, 232),
                //shadowColor: const Color.fromARGB(255, 255, 198, 43),
                overlayColor: const Color.fromARGB(255, 157, 157, 157),
                ),
                onPressed: () { //vad som sker när man trycker på knappen
                  Navigator.push( 
									  	context,
										  MaterialPageRoute(builder: (context) => RegisterUserConfirmedPage()), //hänvisa till confirmation page
									);
                },
                child: Text("Register", style: TextStyle(fontFamily: 'DMSans', color: Colors.black, fontSize: 16)))
            ),
          ),
            
            SizedBox(height: 30), //padding mellan input-fält och register

            //KNAPP 3
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 67, 67, 67),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset.fromDirection(1, 4)
                  )
                ]
              ),
              //padding: EdgeInsets.symmetric(vertical: 20),
              height: 40,
              width: 220,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 1, color: const Color.fromARGB(255, 199, 199, 199)),
                      backgroundColor: Color.fromARGB(255, 232, 232, 232),
                      //shadowColor: const Color.fromARGB(255, 219, 115, 170),
                      overlayColor: const Color.fromARGB(255, 208, 208, 208),
                      ),
                      onPressed: () { //vad som sker när man trycker på knappen
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogInPage()), //hänvisa till confirmation page
                    );
                  },
                      child: Text("Go back to log in page", style: TextStyle(fontFamily: 'DMSans', color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400)))
              )
            ]
          )
        )
      );
    }
}