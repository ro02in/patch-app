import 'package:flutter/material.dart';
import 'package:patchappflutter/register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogInPage() //var förut MyApp() men gav röd error-sida
    );
  }
}

  class LogInPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.symmetric(vertical: 50),
          color: const Color.fromARGB(255, 250, 250, 250),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Container( //Logotyp
                alignment: Alignment.topCenter,
                child: Image.asset('assets/syttbytt2.png', width: 150, height: 210),
              ),

            SizedBox(height: 20), //simulated padding

            Text("Log in", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'DMSans', color: const Color.fromARGB(255, 198, 115, 0), fontSize: 35, fontWeight: FontWeight.w200)),
            //Text("Har inget konto? Skapa ett konto.", style: TextStyle(color: Colors.black, fontSize: 15), textAlign: TextAlign.end),
            SizedBox(height: 20), //simulated padding 

            SizedBox( //KNAPP 1 Google behållare, SizedBox styr höjd och bredd på knapparna
            width: 250,
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
              side: BorderSide(width: 1, color: const Color.fromARGB(255, 198, 115, 0)),
              backgroundColor: Color.fromARGB(255, 255, 221, 110),
              shadowColor: const Color.fromARGB(255, 255, 198, 43),
               overlayColor: const Color.fromARGB(255, 145, 85, 0),
              ),
              //Knapp Google
              onPressed: () {}, 
              child: Text("Log in with Google", style: TextStyle(fontFamily: 'DMSans', fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black87)
              )
              )
            ),

            SizedBox(height: 35), //simulated padding

              SizedBox( //KNAPP 2 Facebook behållare
              width: 250,
              height: 50,
              child: OutlinedButton( //var ElevatedButton
                style: OutlinedButton.styleFrom(
                side: BorderSide(width: 1, color: const Color.fromARGB(255, 198, 115, 0)),
                backgroundColor: Color.fromARGB(255, 255, 221, 110), //gul 255, 255, 198, 43 //ljusblå 255, 184, 223, 255
                shadowColor: const Color.fromARGB(255, 255, 198, 43),
                overlayColor: const Color.fromARGB(255, 145, 85, 0),
                ),
                //Knapp Google
                onPressed: () {}, 
                child: Text("Log in with Facebook", style: TextStyle(fontFamily: 'DMSans', fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black87),
                )
                )
              ),

              SizedBox(height: 70), //simulated padding

              Align( //Längst ner
                alignment: Alignment.bottomCenter,
                child: Center(
                  child: SizedBox( //KNAPP Reg. nytt konto 3 behållare
                  width: 260,
                  height: 39, 
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom( 
                      shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)),
                      side: BorderSide(width: 0.7, color: const Color.fromARGB(255, 198, 115, 0)), //change button border
                      backgroundColor: Color.fromARGB(255, 255, 221, 110),
                      shadowColor: const Color.fromARGB(255, 255, 198, 43),
                      overlayColor: const Color.fromARGB(255, 145, 85, 0),
                    ),
                    onPressed: () {
                      Navigator.push( //HÄNVISA TILL NY REGISTRERA KONTO-SIDA
									  	context,
										  MaterialPageRoute(builder: (context) => RegisterPage()),
									);
                    },
                    child: Text("Don't have an account? Register", style: TextStyle(color: Colors.black, fontSize: 13, fontFamily: 'DMSans', fontWeight: FontWeight.w600))),
                  //child: Text("Har inget konto? Skapa ett konto.", style: TextStyle(color: Colors.black, fontSize: 15), textAlign: TextAlign.end),
                  //child: const NeumorphismButtonDemo(),
                  ),
                )
              )
            ]
          )
        )
      );
  }
} //LogInPage end

