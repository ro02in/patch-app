import 'package:flutter/material.dart';

class PatchViewPage extends StatefulWidget {

  @override
  State<PatchViewPage> createState() => _PatchViewPageState();
}

class _PatchViewPageState extends State<PatchViewPage> {
  int amount = 0; //amount-delen
  bool on = true; //switch button variable

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 244, 240, 231), //beige color
    body: Column(
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
                  SizedBox(width: 100), //padding spacing
                  Container(
                    alignment: Alignment.center,
                    child: SizedBox(
                    width: 150,
                    height: 40,
                    //Källhänvisning 'Flutter increase height and width of Switch?' av diegoveloper //stackoverflow.com/questions/52568958/flutter-increase-height-and-width-of-switch hämtad 10 mars 2022, hämtad 8 maj 2025
                    child: Container( 
                    child: Switch(
                      value: on,
                      activeTrackColor: const Color.fromARGB(255, 236, 217, 182),
                      activeColor: Colors.amber,
                      hoverColor: Colors.white,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: const Color.fromARGB(255, 194, 179, 152),
                      onChanged: (bool value) {
                        setState(() {
                          on = value;
                        });
                      },
                    ),
                    )
                  )
                )
                ]
              ), 
              
              SizedBox(height: 20),
              Row( //History-rubrik
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                SizedBox(width: 450), //spacing padding
                Text("History", style: TextStyle(color: Colors.black, fontSize: 22, fontFamily: ('HappyMonkey'), fontWeight: FontWeight.w400)),
                SizedBox(width: 4), //spacing between text and icon
                Icon(Icons.border_color_sharp, size: 20),
              ]),
                SizedBox(height: 10), //padding
                SizedBox(width: 380), //padding marginal
                SizedBox( //Märkeshistoria box
                  height: 40,
                  width: 220,
                    child: Text("History about your patch... lorem ipsum \n hejhejhej" , style: TextStyle(color: Colors.black, fontFamily: ('HappyMonkey'), fontSize: 14)),
                ),
              SizedBox(height: 10), //padding
              Row( //Size delen
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 450), //padding
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
                        icon: Icon(Icons.arrow_right_sharp, size: 25, color: const Color.fromARGB(255, 0, 0, 0)),
                        iconAlignment: IconAlignment.end,
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 236, 222, 201),
                          overlayColor: const Color.fromARGB(255, 227, 213, 189),
                          side: BorderSide(width: 1, color: Colors.black)
                        ),
                        onPressed: () {},
                        label: Text("Category", textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontFamily: 'HappyMonkey', fontSize: 20, fontWeight: FontWeight.w400) )
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
                              backgroundColor: const Color.fromARGB(255, 236, 222, 201),
                              overlayColor: const Color.fromARGB(255, 227, 213, 189),
                              side: BorderSide(width: 1, color: Colors.black)
                            ),
                            onPressed: () {},
                            label: Text("Klubbmästeri", textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontFamily: 'HappyMonkey', fontSize: 20, fontWeight: FontWeight.w400))
                            )
                            )
                        ),

                        SizedBox(height: 20), //padding
                        
                        //Nästa Row (rad): Hela amount-delarna + - knapp och cirkel
                        
                        Row( 
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                          SizedBox(width: 450), //padding skapa marginal åt vänster

                          Text("Amount", style: TextStyle(color: Colors.black, fontFamily: 'HappyMonkey', fontSize: 23, fontWeight: FontWeight.w400)),
                          
                          SizedBox(width: 6), //padding spacing
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
                           
                           SizedBox(width:12), //padding spacing
                              CircleAvatar(
                                backgroundColor: Colors.amberAccent,
                                radius: 30,
                                child: Text("$amount", style: TextStyle(color: Colors.black, fontSize: 25, fontFamily: 'HappyMonkey'))
                              ),
                           SizedBox(width:12), //padding spacing,

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
                        ],
                      )
                ], // Row children
              )
            ]) //COLUMN
        );
  }
}


//Källhänvisning: 'Flutter - Change Switch Border Color?' av user Vivek Chib från //stackoverflow.com/questions/76086024/flutter-change-switch-border-color


