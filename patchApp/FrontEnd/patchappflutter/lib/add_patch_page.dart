import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart'; /*Källhänvisning: 'flutter switch package': Copyright (c) 2020, Nichole John Romero All rights reserved, hämtad via //pub.dev/packages/flutter_switch,
publicerad 22 juni 2021, hämtad 9 maj 2025.
Denna kod använder detta flutter switch-package för att enklare kunna lägga till Text på en Switch-knapp, vilket verkar vara omstädigt/inte gå genom vanlig Switch och Switch button-lösning i flutter.*/

//Variabler till DropDownButtons
const List<String> colours = <String>['Färg', 'Blå', 'Brun', 'Grå', 'Grön', 'Gul', 'Lila', 'Orange', 'Rosa', 'Röd', 'Svart', 'Vit'];
const List<String> categories = <String>['Kategori', 'Sport', 'Test1', 'Test2', 'Test3', 'Test4'];
const List<String> studentClubs = <String>['Klubbmästeri', 'DISK', 'Klubb3', 'Klubb5', 'Klubb6', 'Klubb6', 'Klubb7', 'Klubb8', 'Klubb9', 'Klubb10'];
const List<String> placement = <String>['Vänster arm', 'Höger arm', 'Vänster ben', 'Höger ben', 'Överkropp', 'Krage'];

//Listor till DropDownButtons
String dropdownColour = colours.first;
String dropdownCategory = categories.first;
String dropdownStudentClub = studentClubs.first;
String dropdownPlacement = placement.first;

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
  var screenSize = MediaQuery.of(context).size; //screensize

  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 244, 240, 231), //beige color
    body: SingleChildScrollView( //Wrapping widget: Gör denna sida SCROLLABLE
      padding: EdgeInsets.symmetric(vertical: 30), //scrollable padding marginal
      child: Container(
            width: screenSize.width,
            height: screenSize.height,
          decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/stitches3.png'),
                fit: BoxFit.fill,
                    )
                  ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20), //padding
                  Image.asset('assets/sbpinklogo.png', width: 150, height: 150, alignment: Alignment.center),
                  SizedBox(height: 6), //simulated padding
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
                    child: Container(
                      height: 45,
                      width: 310,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: TextField(
                        obscureText: false,
                        cursorColor: Colors.black,
                        cursorHeight: 19,
                        maxLength: 20,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 14),
                        decoration: InputDecoration(
                          //hintStyle: TextStyle(color: Colors.black),
                          hoverColor: Colors.black,
                          labelText: 'Märkesnamn:', labelStyle: TextStyle(color: Colors.black, fontFamily: ('InknutAntiqua')), floatingLabelBehavior: FloatingLabelBehavior.never,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: const Color.fromARGB(255, 19, 19, 19), width: 1.1),
                            borderRadius: BorderRadius.circular(30),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: const Color.fromARGB(255, 19, 19, 19), width: 1.1),
                              borderRadius: BorderRadius.circular(30),
                          ),
                      ),
                    ),
                  ),
                    ),
                    SizedBox(width: 5),
                    ]
                ),
                  
                  Row( //Switch button
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 50),
                      SizedBox(width: 2), //padding spacing för switch knapp
                      Container(
                        alignment: Alignment.center,
                        child: SizedBox(
                        width: 85,
                        height: 35,
                        //Källhänvisning 'Flutter increase height and width of Switch?' av diegoveloper //stackoverflow.com/questions/52568958/flutter-increase-height-and-width-of-switch hämtad 10 mars 2022, hämtad 8 maj 2025
                        child: Container( 
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(255, 239, 137, 254),
                                        spreadRadius: 1.2,
                                        blurRadius: 3,
                                        offset: Offset(0.5, 0.5)
                                      )
                                    ]
                                  ),
                        /*Källhänvisning: 'flutter switch package': Copyright (c) 2020, Nichole John Romero All rights reserved, hämtad via //pub.dev/packages/flutter_switch,
                        publicerad 22 juni 2021, hämtad 9 maj 2025.*/
                        child: FlutterSwitch(
                          value: publicPrivate,
                          duration: Duration(milliseconds: 205), //smoother switch animation
                          width: 90,
                          height: 70,
                          borderRadius: 50,
                          valueFontSize: 14,
                            activeColor: const Color.fromARGB(255, 122, 255, 159), 
                            activeText: "public", //text på Switch-knapp
                            activeTextFontWeight: FontWeight.w400,
                            activeTextColor: const Color.fromARGB(255, 30, 30, 30),
        
                            inactiveColor: const Color.fromARGB(255, 44, 44, 44),
                            inactiveText: "private",
                            inactiveTextColor: Colors.white,
                            inactiveTextFontWeight: FontWeight.w400,
                            
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
                    SizedBox(width: 50), //spacing padding
                    Text("Historia", style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: ('InknutAntiqua'), fontWeight: FontWeight.w400)),
                    SizedBox(width: 4), //spacing between text and icon
                    Icon(Icons.border_color_sharp, size: 20),
                  ]),
                    SizedBox(height: 5), //padding
                    SizedBox(width: 340), //padding marginal till vänster
                    Container( //Märkeshistoria box
                      height: 90,
                      width: 320,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 239, 137, 254),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(1, 2)
                          )
                        ]
                      ),
                      //padding: EdgeInsets.symmetric(horizontal: 80),
                        //child: Text("History about your patch... lorem ipsum \nhejhejhej" , textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontFamily: ('HappyMonkey'), fontSize: 14)),
                        child: TextFormField(
                          obscureText: false,
                          cursorColor: const Color.fromARGB(255, 239, 137, 254),
                          cursorHeight: 22,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.multiline, //tillåt enter flera rader
                          maxLines: 4,
                          maxLength: 250,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          scrollPadding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          decoration: InputDecoration(
                            //labelText: 'History about your patch:',
                          contentPadding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: const Color.fromARGB(255, 49, 49, 49), width: 1.1),
                                borderRadius: BorderRadius.circular(15),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: const Color.fromARGB(255, 49, 49, 49), width: 1.1),
                                borderRadius: BorderRadius.circular(15),
                             )
                          ),
                        )
                    ),
                  SizedBox(height: 10), //padding
                  Row( //Size delen
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 45), //padding
                      Text("Storlek", style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: ('InknutAntiqua'), fontWeight: FontWeight.w400)),
                      SizedBox(width: 4), //spacing between text and icon
                      Icon(Icons.border_color_sharp, size: 20),
                      //AmountButton(title: 'AmountButton'), //BUTTON
                      SizedBox(height: 35), //padding
                    ],
                  ),
                  Column( //Större Column för alla 3 knapparna Category + Color + Student Club och Amount-delen
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 450), //spacing marginal till vänster
                      
                      //Knapp 1 Category
                      Container( //CATEGORY BUTTON DROPDOWNBUTTON
                        width: 330,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 122, 255, 186),
                              blurRadius: 4,
                              spreadRadius: 2,
                              offset: Offset(1, 2),
                            )
                          ]
                        ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              dropdownColor: const Color.fromARGB(255, 35, 35, 35),
                                menuMaxHeight: 180, //scrollable menu, styra hur många entries som syns samtidigt i dropdown-menyn
                                menuWidth: 280,
                                borderRadius: BorderRadius.circular(30),
                                focusColor: Color.fromARGB(255, 122, 255, 186),
                                style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 15),
                                padding: EdgeInsets.only(left: 10),
                              value: dropdownCategory,
                              onChanged: (String? value) {
                                setState(() {
                                  dropdownCategory = value!;
                                });
                              },
                              items: categories.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(value: value, child: 
                                Text(value));
                              }).toList(),
                            ) 
                          )
                        ), //CATEGORY BUTTON DROPDOWNBUTTON
        
                            //Knapp 2 Colour
                            SizedBox(height: 14), //padding
                          
                             //KNAPP 2 Colour                          
                             Container( //COLOR BUTTON DROPDOWNBUTTON
                                width: 330,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 122, 255, 186),
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                      offset: Offset(1, 2),
                                    )
                                  ]
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    dropdownColor: Colors.white,
                                      menuMaxHeight: 180, //scrollable menu, styra hur många entries som syns samtidigt i dropdown-menyn
                                      menuWidth: 280,
                                      borderRadius: BorderRadius.circular(30),
                                      style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 15),
                                      padding: EdgeInsets.only(left: 10),
                                    value: dropdownColour,
                                    onChanged: (String? value) {
                                      setState(() {
                                        dropdownColour = value!;
                                      });
                                    },
                                    items: colours.map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(value: value, child: 
                                      Text(value));
                                    }).toList(),
                                  ) 
                                )
                              ), //COLOR BUTTON DROPDOWNBUTTON
                            
                          
                            //Knapp 3 Klubbmästeri
                            SizedBox(height: 14), //padding
                            Container( //STUDENT CLUBS BUTTON DROPDOWNBUTTON
                                width: 330,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 122, 255, 186),
                                      blurRadius: 6,
                                      spreadRadius: 2,
                                      offset: Offset(1, 2),
                                    )
                                  ]
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    dropdownColor: Colors.white,
                                      menuMaxHeight: 180, //scrollable menu, styra hur många entries som syns samtidigt i dropdown-menyn
                                      menuWidth: 280,
                                      borderRadius: BorderRadius.circular(30),
                                      style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 15),
                                      padding: EdgeInsets.only(left: 10),
                                    value: dropdownStudentClub,
                                    onChanged: (String? value) {
                                      setState(() {
                                        dropdownStudentClub = value!;
                                      });
                                    },
                                    items: studentClubs.map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(value: value, child: 
                                      Text(value));
                                    }).toList(),
                                  ) 
                                )
                              ), //STUDENT CLUBS BUTTON DROPDOWNBUTTON
        
                            SizedBox(height: 20), //padding
                            
                            Row( //Nästa Row (rad): 'Amount'-text och 'Available for trade?'-text
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                              SizedBox(width: 41), //padding skapa marginal åt vänster
        
                              Text("Antal", style: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 20, fontWeight: FontWeight.w400)),
                              SizedBox(width: 68), //spacing
                              Text("Tillgänglig att byta?", style: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 18, fontWeight: FontWeight.w300))
                              ]
                            ),
                            SizedBox(height: 8),
                            
                            Row( //Nästa Row (rad): -minus knapp och +knapp Addera, subtrahera 'Amount'-värde
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 35), //padding spacing +- cirkel
        
                              IconButton( // - Knapp minska Amount
                                style: IconButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(195, 239, 137, 254),
                                  shadowColor: Colors.white,
                                ),
                                //color: const Color.fromARGB(255, 239, 137, 254),
                                hoverColor: Color.fromARGB(230, 152, 254, 150),
                                splashColor: const Color.fromARGB(255, 239, 137, 254),
                                tooltip: 'Minska antalet av detta märke', //textrad för accessability
                                icon: Icon(Icons.remove, color: Colors.white), //'-'-ikon på knapp
                                    onPressed: () {
                                      setState(() {
                                        amount -= 1;
                                        amount <0 ? amount = 0 : amount; //Ej går att ha färre än 0, condition ? true-case:false-case
                                        });
                                      }
                               ),
                               
                               SizedBox(width:8), //cirkel padding spacing
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Color.fromARGB(255, 255, 162, 221)),
                                      borderRadius: BorderRadius.circular(100),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black
                                        )
                                      ]
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 30,
                                      child: Text("$amount", style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'CalSans'))
                                    ),
                                  ),
                               SizedBox(width:8), //cirkel padding spacing,
        
                              IconButton( // + Knapp öka Amount
                              style: IconButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(195, 239, 137, 254),
                                  shadowColor: Colors.white,
                                ),
                                //color: const Color.fromARGB(255, 239, 137, 254),
                                hoverColor: Color.fromARGB(230, 152, 254, 150),
                                splashColor: const Color.fromARGB(255, 239, 137, 254),
                                tooltip: 'Öka antalet av detta märke', //textrad för accessability
                                icon: Icon(Icons.add, color: Colors.white), //'+'-ikon på knapp
                                    onPressed: () {
                                      setState(() {
                                        amount += 1;
                                        });
                                      }
                                ),
        
                                SizedBox(width: 35), //padding spacing
                                
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(255, 255, 141, 208),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(0.5, 1)
                                      )
                                    ]
                                  ),
                                  child: FlutterSwitch(
                                  value: trade,
                                  duration: Duration(milliseconds: 205), //smoother switch animation
                                  width: 75,
                                  height: 35,
                                  borderRadius: 50,
                                  valueFontSize: 15,
                                    activeColor: const Color.fromARGB(255, 241, 150, 255),
                                    activeText: "Ja", //text på Switch-knapp
                                    activeTextFontWeight: FontWeight.w400,
                                    activeTextColor: const Color.fromARGB(255, 27, 27, 27),
        
                                    inactiveColor: const Color.fromARGB(255, 44, 44, 44),
                                    inactiveText: "Nej",
                                    inactiveTextColor: Colors.white,
                                    inactiveTextFontWeight: FontWeight.w400,
                                    
                                  showOnOff: true, //visa texterna på switch-knappen
                                  onToggle: (bool value) {
                                    setState(() {
                                      trade = value;
                                    });
                                  },
                                ),
                                ) //Container med skugga för knapp
                              ],) //Row (rad): -minus knapp och +knapp Addera, subtrahera 'Amount'-värde
                            ],
                  ), //Column för alla 3 knappar + Amount-delarna
                 
                  Column( //Column för Placement-knapp och Row med Add-patch-knapp & papperskorg-ikon
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 30), //padding
                      //SizedBox(width: 450), //spacing marginal till vänster
        
                      Row( //Placement-knapp
                        children: [
                          SizedBox(width: 40), //spacing marginal till vänster
                          Container( //PLACEMENT BUTTON DROPDOWNBUTTON
                                width: 330,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 122, 255, 186),
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                      offset: Offset(1, 2),
                                    )
                                  ]
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    dropdownColor: const Color.fromARGB(255, 248, 252, 255),
                                      menuMaxHeight: 180, //scrollable menu, styra hur många entries som syns samtidigt i dropdown-menyn
                                      menuWidth: 280,
                                      borderRadius: BorderRadius.circular(30),
                                      style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontFamily: 'InknutAntiqua', fontSize: 15),
                                      padding: EdgeInsets.only(left: 10),
                                    value: dropdownPlacement,
                                    onChanged: (String? value) {
                                      setState(() {
                                        dropdownPlacement = value!;
                                      });
                                    },
                                    items: placement.map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(value: value, child: 
                                      Text(value));
                                    }).toList(),
                                  ) 
                                )
                              ), //PLACEMENT BUTTON DROPDOWNBUTTON
                          ],
                      ),
        
                      SizedBox(height: 25), //padding
        
                      Row(children: [
                        SizedBox(width: 30), //spacing marginal till vänster
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 122, 255, 186), 
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(1, 2)
                              )
                            ]
                          ),
        
                          child: SizedBox(
                            height: 40,
                            width: 160,
                              child: OutlinedButton(
                                onPressed: () {}, 
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 42, 42, 42),
                                  side: BorderSide(width: 1, color: Color.fromARGB(255, 122, 255, 186), strokeAlign: 1)
                                  ),
                                  child: Text("Lägg till märke", style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255), fontFamily: 'InknutAntiqua', fontSize: 13, fontWeight: FontWeight.w400)),
                                )
                          )
                        ),
                        SizedBox(width: 130), //spacing
                        FloatingActionButton(
                          backgroundColor: const Color.fromARGB(255, 243, 68, 255),
                          shape: const CircleBorder(),
                          hoverColor: Color.fromARGB(255, 139, 166, 255),
                          child: Icon(Icons.delete_outline_rounded, size: 30, color: Colors.white),
                          onPressed: () {}) //Soptunna-knapp action
                      ],),
                      SizedBox(height: 20),
                    ],) //Column för Placement, 'Add patch' + papperskorg-icon
                ]),
      ),
          ) //SIDANS COLUMN
        );
  }
}

