import 'package:flutter/material.dart';
import 'package:patchappflutter/Pages/continue_login_page.dart';
import 'package:patchappflutter/Pages/register_page.dart';
import 'package:patchappflutter/Pages/temp_buttons_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}

class AuthPage extends StatelessWidget {
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
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 53, 53, 53).withOpacity(0.8),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Color.fromARGB(255, 226, 93, 246), width: 1),
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "WELCOME TO PATCH APP",
                  style: TextStyle(
                    color: Color.fromARGB(255, 239, 137, 254),
                    fontFamily: 'InknutAntiqua',
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 40),
                buildButton(context, "LOG IN", LoginPage(), Colors.green),
                SizedBox(height: 20),
                buildButton(context, "REGISTER", RegisterPage(), Colors.blue),
                SizedBox(height: 20),
                buildButton(context, "DEV MENY", TempButtonsPage(), Colors.orange),
              ],
            ),
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
