import 'package:flutter/material.dart';

class RegisterUserConfirmedPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 200),
          alignment: Alignment.center,
          child: Column(
          children: <Widget> [
          Text("Registration completed!", textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 26, fontFamily: 'DMSans', fontWeight: FontWeight.w400)),
          SizedBox(height: 20), //simulated padding
          
          //Källhänvisning: Kod från StackOverflow foruminlägg "How to add gradient on icons": stackoverflow.com/questions/73870549/how-to-add-gradient-on-icons hämtad 1/5-2025 kl 16:00
            ShaderMask(blendMode: BlendMode.srcIn, 
            shaderCallback: (Rect bounds) => LinearGradient(
              begin: Alignment.bottomLeft, //diagonal gradient
              end: Alignment.topRight, //diagonal gradient
              stops: [.3, 1],
              colors: [const Color.fromARGB(255, 21, 193, 27), const Color.fromARGB(255, 113, 255, 118)],
              ).createShader(bounds),
                child: Icon(
                Icons.check_circle_outline_sharp,
                size: 90,
                )
              )
            ],
          ),
        ),
      );
  }
}