import 'package:flutter/material.dart';
import 'package:patchappflutter/add_patch_page.dart';
import 'package:patchappflutter/continue_register_page.dart';
import 'package:patchappflutter/register_page.dart';
import 'package:patchappflutter/temp_buttons_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget { //Starting point för hela appen

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
          //color: const Color.fromARGB(255, 244, 240, 231),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
             Container(
                height: 940,
                width: 415,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/stitchesbackground1.png'),
                  fit: BoxFit.fill,
                  )
                ),
              
               child: Column(
                children: [
                SizedBox(height: 200),
                Text("WELCOME TO", style: TextStyle(color: const Color.fromARGB(255, 239, 137, 254), fontFamily: ('InknutAntiqua'), fontSize: 30, fontWeight: FontWeight.w400)),
                SizedBox(height: 3), //padding
                Container( //Logotyp
                  alignment: Alignment.topCenter,
                  child: Image.asset('assets/sbpinklogo.png', width: 150, height: 150),
                ),

            //Text("Log in", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'HappyMonkey', color: const Color.fromARGB(255, 22, 22, 22), fontSize: 35, fontWeight: FontWeight.w200)),
            //Text("Har inget konto? Skapa ett konto.", style: TextStyle(color: Colors.black, fontSize: 15), textAlign: TextAlign.end),
            SizedBox(height: 4), //simulated padding 

            Container(  //Card-effect CONTAINER FÖR BÄGGE KNAPPAR LOG IN OCH REGISTER
              width: 310,
              height: 310,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 53, 53, 53),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Color.fromARGB(255, 226, 93, 246), width: 1),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 39, 39, 39), 
                    blurRadius: 5,
                    spreadRadius: 2,
                    offset: Offset(1, 4)
                  )
                ]
              ),
              child: Column(
              children: [
                SizedBox(height: 95), //padding centrera 2 knapparna
                Container( 
                decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 39, 39, 39), 
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
              side: BorderSide(width: 1.2, color: const Color.fromARGB(255, 122, 255, 186)),
              backgroundColor: Color.fromARGB(255, 39, 39, 39),
              //shadowColor: const Color.fromARGB(255, 255, 198, 43),
              overlayColor: Color.fromARGB(255, 255, 255, 255),
              ),
              
              onPressed: () {}, 
              label: Text("LOG IN", style: TextStyle(fontFamily: 'InknutAntiqua', fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white)
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
                        color: Color.fromARGB(255, 39, 39, 39), 
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
                  side: BorderSide(width: 1.2, color: const Color.fromARGB(255, 122, 255, 186)),
                  backgroundColor: Color.fromARGB(255, 39, 39, 39), //gul 255, 255, 198, 43 //ljusblå 255, 184, 223, 255
                  //shadowColor: const Color.fromARGB(255, 255, 198, 43),
                  overlayColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                  //Knapp Google
                  onPressed: () {
                    Navigator.push( //HÄNVISA TILL NY REGISTRERA KONTO-SIDA
									  	context,
										  MaterialPageRoute(builder: (context) => RegisterPage()),
									);
                  }, 
                  label: Text("REGISTER", style: TextStyle(fontFamily: 'InknutAntiqua', fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                  )
                  )
                ),
               ),
              ],
              ),
            ),
            ]
          ),
          ),
          ],  //Hela Column children
        )
      ),
      );
  }
} //LogInPage end

