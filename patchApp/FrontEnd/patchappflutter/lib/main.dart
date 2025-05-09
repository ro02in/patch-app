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
          color: const Color.fromARGB(255, 244, 240, 231),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [

              Column(
                children: [
                Text("WELCOME TO", style: TextStyle(color: const Color.fromARGB(255, 223, 155, 38), fontFamily: ('CalSans'), fontSize: 30, fontWeight: FontWeight.w400)),
                SizedBox(height: 15), //padding
                Container( //Logotyp
                  alignment: Alignment.topCenter,
                  child: Image.asset('assets/syttbytt2.png', width: 150, height: 210),
                ),

            //Text("Log in", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'HappyMonkey', color: const Color.fromARGB(255, 22, 22, 22), fontSize: 35, fontWeight: FontWeight.w200)),
            //Text("Har inget konto? Skapa ett konto.", style: TextStyle(color: Colors.black, fontSize: 15), textAlign: TextAlign.end),
            SizedBox(height: 4), //simulated padding 

            Container(  //Card-effect 
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 231, 225, 210),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 200, 191, 172), 
                    blurRadius: 5,
                    spreadRadius: 2,
                    offset: Offset(1, 4)
                  )
                ]
              ),
              child: Column(
              children: [
                SizedBox(height: 80), //padding centrera 2 knapparna
                Container( 
                decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 117, 161, 105), 
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset.fromDirection(1, 3)
                  )
                ]
              ),
            child: SizedBox( //KNAPP 1, SizedBox styr höjd och bredd på knapparna
            width: 240,
            height: 45,
            child: OutlinedButton.icon(
              //icon: Image.asset('syttbyttcirclelogo.png', height: 35, width: 35), iconAlignment: IconAlignment.start,
              style: OutlinedButton.styleFrom(
              side: BorderSide(width: 1.2, color: const Color.fromARGB(255, 0, 0, 0)),
              backgroundColor: Color.fromARGB(255, 142, 164, 136),
              //shadowColor: const Color.fromARGB(255, 255, 198, 43),
              overlayColor: const Color.fromARGB(255, 125, 176, 122),
              ),
              
              onPressed: () {}, 
              label: Text("LOG IN", style: TextStyle(fontFamily: 'HappyMonkey', fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87)
              )
              )
            ),
            ),

            SizedBox(height: 25), //simulated padding

            Container( 
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 117, 161, 105), 
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset.fromDirection(1, 3)
                      )
                    ]
                  ),
                child: SizedBox( //KNAPP 2 
                width: 240,
                height: 45,
                child: OutlinedButton.icon( //at
                  //icon: Image.asset('syttbyttcirclelogo.png', height: 40, width: 35), iconAlignment: IconAlignment.start, //var ElevatedButton
                  style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1.2, color: const Color.fromARGB(255, 0, 0, 0)),
                  backgroundColor: Color.fromARGB(255, 142, 164, 136), //gul 255, 255, 198, 43 //ljusblå 255, 184, 223, 255
                  //shadowColor: const Color.fromARGB(255, 255, 198, 43),
                  overlayColor: const Color.fromARGB(255, 125, 176, 122),
                  ),
                  //Knapp Google
                  onPressed: () {
                    Navigator.push( //HÄNVISA TILL NY REGISTRERA KONTO-SIDA
									  	context,
										  MaterialPageRoute(builder: (context) => RegisterPage()),
									);
                  }, 
                  label: Text("REGISTER", style: TextStyle(fontFamily: 'HappyMonkey', fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87),
                  )
                  )
                ),
               ),
              ],
              ),
            ),
            ]
          )
          ],
        )
      ),
      );
  }
} //LogInPage end

