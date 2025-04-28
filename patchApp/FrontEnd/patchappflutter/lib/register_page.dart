import 'package:flutter/material.dart';
class RegisterPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 80),
          color: const Color.fromARGB(255, 236, 236, 236),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
            Text("Register", textAlign: TextAlign.left, style: TextStyle(fontFamily: 'DMSans', color: const Color.fromARGB(255, 0, 0, 0), fontSize: 35, fontWeight: FontWeight.w200)),
            SizedBox(height: 20), //simulated padding
      
            SizedBox( //SizedBox cannot change alignment, Container can
             // alignment: Alignment.center,
              height: 40,
              width: 280,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                side: BorderSide(width: 1, color: const Color.fromARGB(255, 26, 26, 26)),
                backgroundColor: Color.fromARGB(255, 236, 236, 236),
                overlayColor: Colors.black87,
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
                side: BorderSide(width: 1, color: const Color.fromARGB(255, 26, 26, 26)),
                backgroundColor: Color.fromARGB(255, 236, 236, 236),
                overlayColor: Colors.black87,
                ),
                onPressed: () {},
                child: Text("Register with Facebook", style: TextStyle(fontFamily: 'DMSans', color: Colors.black, fontSize: 20)))
            ),

            SizedBox(height: 80),

            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              height: 80,
              width: 260,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 209, 209, 209),
                      shadowColor: Colors.black
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