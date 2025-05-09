import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart'; /*Källhänvisning: 'flutter switch package': Copyright (c) 2020, Nichole John Romero All rights reserved, hämtad via //pub.dev/packages/flutter_switch,
publicerad 22 juni 2021, hämtad 9 maj 2025.
Denna kod använder detta flutter switch-package för att enklare kunna lägga till Text på en Switch-knapp, vilket verkar vara omstädigt/inte gå genom vanlig Switch och Switch button-lösning i flutter.*/

class PatchViewPage extends StatefulWidget {

  @override
  State<PatchViewPage> createState() => _PatchViewPageState();
}

class _PatchViewPageState extends State<PatchViewPage> {
  int amount = 0; //amount-delen
  bool publicPrivate = true; //switch button variable
  bool trade = true;

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 244, 240, 231), //beige color
    body: SingleChildScrollView( //Wrapping widget: Gör denna sida SCROLLABLE
      padding: EdgeInsets.symmetric(vertical: 20), //scrollable padding marginal
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20), //padding
                Image.asset('assets/syttbyttcirclelogo.png', width: 150, height: 150, alignment: Alignment.center),
                SizedBox(height: 6), //simulated padding
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("Märkesnamn", textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontSize: 25, fontFamily: ('HappyMonkey'), fontWeight: FontWeight.w500)),
                      ),
                      Icon(Icons.border_color_sharp, size: 27, color: Colors.black),
                  ]
                ),
                
                Row( //Switch button
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 130), //padding spacing
                    Container(
                      alignment: Alignment.center,
                      child: SizedBox(
                      width: 85,
                      height: 65,
                      //Källhänvisning 'Flutter increase height and width of Switch?' av diegoveloper //stackoverflow.com/questions/52568958/flutter-increase-height-and-width-of-switch hämtad 10 mars 2022, hämtad 8 maj 2025
                      child: Container( 
                      /*Källhänvisning: 'flutter switch package': Copyright (c) 2020, Nichole John Romero All rights reserved, hämtad via //pub.dev/packages/flutter_switch,
                      publicerad 22 juni 2021, hämtad 9 maj 2025.*/
                      child: FlutterSwitch(
                        value: publicPrivate,
                        duration: Duration(milliseconds: 205), //smoother switch animation
                        width: 90,
                        borderRadius: 50,
                        valueFontSize: 13,
                          activeColor: const Color.fromARGB(255, 95, 95, 95),
                          activeText: "private", //text på Switch-knapp
                          activeTextFontWeight: FontWeight.w300,
                          activeTextColor: Colors.white,
      
                          inactiveColor: const Color.fromARGB(255, 229, 163, 20),
                          inactiveText: "public",
                          inactiveTextColor: Colors.white,
                          inactiveTextFontWeight: FontWeight.w300,
                          
                        showOnOff: true, //visa texterna på switch-knappen
                        onToggle: (bool value) {
                          setState(() {
                            publicPrivate = value;
                          });
                        },
                      ),
                      )
                    )
                  )
                  ]
                ), 
                
                SizedBox(height: 5),
                Row( //History-rubrik
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  SizedBox(width: 40), //spacing padding
                  Text("History", style: TextStyle(color: Colors.black, fontSize: 22, fontFamily: ('HappyMonkey'), fontWeight: FontWeight.w400)),
                  SizedBox(width: 4), //spacing between text and icon
                  Icon(Icons.border_color_sharp, size: 20),
                ]),
                  SizedBox(height: 10), //padding
                  SizedBox(width: 340), //padding marginal till vänster
                  SizedBox( //Märkeshistoria box
                    height: 70,
                    width: 310,
                      child: Text("History about your patch... lorem ipsum \nhejhejhej" , textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontFamily: ('HappyMonkey'), fontSize: 14)),
                  ),
                SizedBox(height: 10), //padding
                Row( //Size delen
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 40), //padding
                    Text("Size", style: TextStyle(color: Colors.black, fontSize: 22, fontFamily: ('HappyMonkey'), fontWeight: FontWeight.w400)),
                    SizedBox(width: 4), //spacing between text and icon
                    Icon(Icons.border_color_sharp, size: 20),
                    //AmountButton(title: 'AmountButton'), //BUTTON
                    SizedBox(height: 50), //padding
                  ],
                ),
                Column( //Större Column för alla 3 knapparna Category + Color + Klubbmästeri och Amount-delen
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 450),
                    
                    //Knapp 1 Category
                    Container( 
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        //color: const Color.fromARGB(255, 249, 232, 193),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 199, 187, 143),
                            blurRadius: 2,
                            spreadRadius: 2,
                            offset: Offset(1, 2)
                          ),
                        ]
                      ),
                      
                      child: SizedBox(
                        height: 40,
                        width: 330,
                        child: OutlinedButton.icon(
                          label: Text("Category", textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontFamily: 'HappyMonkey', fontSize: 20, fontWeight: FontWeight.w400)),
                          icon: Icon(Icons.arrow_right_sharp, size: 25, color: const Color.fromARGB(255, 0, 0, 0)),
                          iconAlignment: IconAlignment.end,
                          style: OutlinedButton.styleFrom(
                            alignment: Alignment.centerLeft,
                            backgroundColor: const Color.fromARGB(255, 236, 222, 201),
                            overlayColor: const Color.fromARGB(255, 227, 213, 189),
                            side: BorderSide(width: 1, color: Colors.black)
                          ),
                          onPressed: () {},
                          )
                          )
                      ),
      
                          //Knapp 2 Colour
                          SizedBox(height: 14), //padding
                          
                          Container( //KNAPP 2 Colour
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            //color: const Color.fromARGB(255, 249, 232, 193),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 199, 187, 143),
                                blurRadius: 2,
                                spreadRadius: 2,
                                offset: Offset(1, 2)
                              ),
                            ]
                          ),
                          child: SizedBox(
                            height: 40,
                            width: 330,
                            child: OutlinedButton.icon(
                              icon: Icon(Icons.arrow_right_sharp, size: 25, color: const Color.fromARGB(255, 0, 0, 0)),
                              iconAlignment: IconAlignment.end,
                              style: OutlinedButton.styleFrom(
                                alignment: Alignment.centerLeft,
                                backgroundColor: const Color.fromARGB(255, 236, 222, 201),
                                overlayColor: const Color.fromARGB(255, 227, 213, 189),
                                side: BorderSide(width: 1, color: Colors.black)
                              ),
                              onPressed: () {},
                              label: Text("Colour", textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontFamily: 'HappyMonkey', fontSize: 20, fontWeight: FontWeight.w400) )
                              )
                              )
                          ),
                        
                          //Knapp 3 Klubbmästeri
                          SizedBox(height: 14), //padding
                          Container( 
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            //color: const Color.fromARGB(255, 249, 232, 193),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 199, 187, 143),
                                blurRadius: 2,
                                spreadRadius: 2,
                                offset: Offset(1, 2)
                              ),
                            ]
                          ),
                          child: SizedBox(
                            height: 40,
                            width: 330,
                            child: OutlinedButton.icon(
                              icon: Icon(Icons.arrow_right_sharp, size: 25, color: const Color.fromARGB(255, 0, 0, 0)),
                              iconAlignment: IconAlignment.end,
                              style: OutlinedButton.styleFrom(
                                alignment: Alignment.centerLeft,
                                backgroundColor: const Color.fromARGB(255, 236, 222, 201),
                                overlayColor: const Color.fromARGB(255, 227, 213, 189),
                                side: BorderSide(width: 1, color: Colors.black)
                              ),
                              onPressed: () {},
                              label: Text("Student association", textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontFamily: 'HappyMonkey', fontSize: 20, fontWeight: FontWeight.w400))
                              )
                              )
                          ),
      
                          SizedBox(height: 20), //padding
                          
                          Row( //Nästa Row (rad): 'Amount'-text och 'Available for trade?'-text
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                            SizedBox(width: 40), //padding skapa marginal åt vänster
      
                            Text("Amount", style: TextStyle(color: Colors.black, fontFamily: 'HappyMonkey', fontSize: 23, fontWeight: FontWeight.w400)),
                            SizedBox(width: 60), //spacing
                            Text("Available for trade?", style: TextStyle(color: Colors.black, fontFamily: 'HappyMonkey', fontSize: 14, fontWeight: FontWeight.w300))
                            ]
                          ),
                          SizedBox(height: 8),
                          
                          Row( //Nästa Row (rad): -minus knapp och +knapp Addera, subtrahera 'Amount'-värde
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 30), //padding spacing +- cirkel

                            IconButton( // - Knapp minska Amount
                              color: Colors.white,
                              hoverColor: Colors.white,
                              splashColor: Colors.yellow,
                              tooltip: 'Decrease the amount of this patch', //textrad för accessability
                              icon: Icon(Icons.remove, color: Colors.black), //'-'-ikon på knapp
                                  onPressed: () {
                                    setState(() {
                                      amount -= 1;
                                      });
                                    }
                             ),
                             
                             SizedBox(width:8), //cirkel padding spacing
                                CircleAvatar(
                                  backgroundColor: Colors.amberAccent,
                                  radius: 30,
                                  child: Text("$amount", style: TextStyle(color: Colors.black, fontSize: 25, fontFamily: 'HappyMonkey'))
                                ),
                             SizedBox(width:8), //cirkel padding spacing,
      
                            IconButton( // + Knapp öka Amount
                              color: Colors.white,
                              hoverColor: Colors.white,
                              splashColor: Colors.yellow,
                              tooltip: 'Increment the amount of this patch', //textrad för accessability
                              icon: Icon(Icons.add, color: Colors.black), //'+'-ikon på knapp
                                  onPressed: () {
                                    setState(() {
                                      amount += 1;
                                      });
                                    }
                              ),
      
                              SizedBox(width: 40), //padding spacing
                              
                              FlutterSwitch(
                                value: trade,
                                duration: Duration(milliseconds: 205), //smoother switch animation
                                width: 65,
                                height: 35,
                                borderRadius: 50,
                                valueFontSize: 15,
                                  activeColor: const Color.fromARGB(255, 95, 95, 95),
                                  activeText: "Yes", //text på Switch-knapp
                                  activeTextFontWeight: FontWeight.w300,
                                  activeTextColor: Colors.white,
      
                                  inactiveColor: const Color.fromARGB(255, 255, 205, 41),
                                  inactiveText: "No",
                                  inactiveTextColor: Colors.white,
                                  inactiveTextFontWeight: FontWeight.w300,
                                  
                                showOnOff: true, //visa texterna på switch-knappen
                                onToggle: (bool value) {
                                  setState(() {
                                    trade = value;
                                  });
                                },
                              ),
                            ],)
                            
                          ],
                        
                   // Row children
                )
              ]),
    ) //COLUMN
        );
  }
}


//Källhänvisning: 'Flutter - Change Switch Border Color?' av user Vivek Chib från //stackoverflow.com/questions/76086024/flutter-change-switch-border-color


