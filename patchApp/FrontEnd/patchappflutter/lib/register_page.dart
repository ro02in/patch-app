import 'package:flutter/material.dart';
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
            Text("Register", textAlign: TextAlign.left, style: TextStyle(fontFamily: 'DMSans', color: const Color.fromARGB(255, 198, 115, 0), fontSize: 35, fontWeight: FontWeight.w200)),
            SizedBox(height: 20), //simulated padding
      
            SizedBox( //SizedBox cannot change alignment, Container can
             // alignment: Alignment.center,
              height: 40,
              width: 280,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                side: BorderSide(width: 1, color: const Color.fromARGB(255, 198, 115, 0)),
                backgroundColor: Color.fromARGB(255, 255, 221, 110),
                overlayColor: const Color.fromARGB(255, 145, 85, 0),
                ),
                onPressed: () {},
                child: Text("Register with Google", style: TextStyle(fontFamily: 'DMSans', color: Colors.black, fontSize: 20)))
            ),

            SizedBox(height: 50),

            SizedBox(
             // alignment: Alignment.center,
              height: 40,
              width: 280,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                side: BorderSide(width: 1, color: const Color.fromARGB(255, 198, 115, 0)),
                backgroundColor: Color.fromARGB(255, 255, 221, 110),
                shadowColor: const Color.fromARGB(255, 255, 198, 43),
                overlayColor: const Color.fromARGB(255, 145, 85, 0),
                ),
                onPressed: () {},
                child: Text("Register with Facebook", style: TextStyle(fontFamily: 'DMSans', color: Colors.black, fontSize: 20)))
            ),

            SizedBox(height: 80),

            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              height: 80,
              width: 260,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 0.7, color: const Color.fromARGB(255, 198, 115, 0)), //change button border
                      backgroundColor: Color.fromARGB(255, 255, 221, 110),
                      shadowColor: const Color.fromARGB(255, 255, 198, 43),
                      overlayColor: const Color.fromARGB(255, 145, 85, 0),
                      ),
                        onPressed: () { 
                        Navigator.pop(context);
                        },
                        child: Text("Go back to the start page", style: TextStyle(fontFamily: 'DMSans', color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400)))
              )
            ]
          )
        )
      );
    }
}