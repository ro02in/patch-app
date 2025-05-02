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
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Container( //Logotyp
                alignment: Alignment.topCenter,
                child: Image.asset('assets/syttbytt2.png', width: 150, height: 210),
              ),

            SizedBox(height: 10), //simulated padding

            Text("Log in", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'DMSans', color: const Color.fromARGB(255, 22, 22, 22), fontSize: 35, fontWeight: FontWeight.w200)),
            //Text("Har inget konto? Skapa ett konto.", style: TextStyle(color: Colors.black, fontSize: 15), textAlign: TextAlign.end),
            SizedBox(height: 20), //simulated padding 


            Container( 
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 190, 190, 190), //ljusblå 255, 131, 209, 255
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset.fromDirection(1, 4)
                  )
                ]
              ),
            child: SizedBox( //KNAPP 1, SizedBox styr höjd och bredd på knapparna
            width: 340,
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
              side: BorderSide(width: 1, color: const Color.fromARGB(255, 116, 119, 117)),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              //shadowColor: const Color.fromARGB(255, 255, 198, 43),
              overlayColor: const Color.fromARGB(255, 208, 208, 208),
              ),
              
              onPressed: () {}, 
              child: Text("Log in through  ", style: TextStyle(fontFamily: 'Roboto Medium', fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87)
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
                        color: const Color.fromARGB(255, 190, 190, 190), 
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset.fromDirection(1, 4)
                      )
                    ]
                  ),
                child: SizedBox( //KNAPP 2 
                width: 340,
                height: 50,
                child: OutlinedButton( //var ElevatedButton
                  style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1, color: const Color.fromARGB(255, 116, 119, 117)),
                  backgroundColor: Color.fromARGB(255, 255, 255, 255), //gul 255, 255, 198, 43 //ljusblå 255, 184, 223, 255
                  //shadowColor: const Color.fromARGB(255, 255, 198, 43),
                  overlayColor: const Color.fromARGB(255, 208, 208, 208),
                  ),
                  //Knapp Google
                  onPressed: () {}, 
                  child: Text("Log in through ", style: TextStyle(fontFamily: 'Roboto Medium', fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87),
                  )
                  )
                ),
            ),

              SizedBox(height: 70), //simulated padding

              SizedBox(
                child: Text("Don't have an account?", style: TextStyle(fontFamily: "DMSans", fontSize: 16, color: Colors.black)),
              ),
             
              SizedBox(height: 9), //padding

              Align( //Längst ner
                alignment: Alignment.bottomCenter,
                child: Center(
                  child: SizedBox( //KNAPP Reg. nytt konto 3 behållare
                  width: 320,
                  height: 45, 

                  child: Container( 
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 190, 190, 190),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: Offset.fromDirection(1, 4)
                      )
                    ]
                  ),
                  child: OutlinedButton( //aqua blå const Color.fromARGB(255, 59, 213, 255
                    style: OutlinedButton.styleFrom( 
                      shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)),
                      side: BorderSide(width: 0.3, color: const Color.fromARGB(255, 0, 0, 0)), //change button border
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      //shadowColor: const Color.fromARGB(255, 255, 198, 43),
                      overlayColor: const Color.fromARGB(255, 208, 208, 208),
                    ),
                    onPressed: () {
                      Navigator.push( //HÄNVISA TILL NY REGISTRERA KONTO-SIDA
									  	context,
										  MaterialPageRoute(builder: (context) => RegisterPage()),
									);
                    },
                    child: Text("Create a MärkesBytesAppName account.", style: TextStyle(color: Colors.black, fontSize: 14, fontFamily: 'DMSans', fontWeight: FontWeight.w700))),
                  ),
                  ),
                )
              )
            ]
          )
        )
      );
  }
} //LogInPage end

