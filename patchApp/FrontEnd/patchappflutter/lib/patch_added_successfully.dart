//NYTT FÖRSÖK NY BRANCH

//Denna fil använder kod från källa Youtube-video youtu.be/vwSY5Q-mVMs?si=9jipUg8rNTfF9PAs, 'Flutter Tutorial - Image Picker From Gallery & Camera' av kanalen Flutter Guys,
//publicerad 9 juli 2023, hämtad 18 maj 2025. Samt i kodrad 35 i pubspec.yaml för dependencies.


//Denna fil använder kod från källa Youtube-video 'Flutter Image Picker & Cropper From Camera & Gallery | Learn Flutter Fast',
// youtu.be/qYCsxvbPDC8?si=1U4WiVS3sKaa-Usd av kanalen Marcus Ng på Youtube publicerad 11 november 2022, hämtad 2025-05-17.
//Även filen i path ios/Flutter/Info.plist kodrad 48 och 49 är kod hämtad från samma källa, samt dependencies i pubspec.yaml*/

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patchappflutter/profile_page.dart';
import 'package:patchappflutter/trade_request_success_page.dart';

class PatchAddedSuccessfully extends StatefulWidget {
  const PatchAddedSuccessfully({Key? key}) : super(key : key);
  /*const TradeActionPage({
    super.key}); */

  @override
  State<PatchAddedSuccessfully> createState() => _PatchAddedSuccessfullyState();
}

class _PatchAddedSuccessfullyState extends State<PatchAddedSuccessfully> {
  File ? _selectedImage;

  @override
  Widget build (BuildContext context) {

    var screenSize = MediaQuery.of(context).size; //screensize
    String userName = ''; //BACKEND username-värde

    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/stitches9.png'),
            fit: BoxFit.fill,
          ),
        ),
        alignment: Alignment.center,
        child: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.only(top: 0, bottom: 0), //ta bort glapp mellan appbar och bakgrundsbild
          children: [
            //AppBar flyttad hit
            AppBar(
              backgroundColor: Color.fromARGB(140, 35, 39, 25),
              elevation: 40,
              shadowColor: Colors.black,
              toolbarHeight: 65,
              leadingWidth: 400,
              leading: Icon(Icons.check, color: Colors.green, size: 40),
              centerTitle: true,
              titleSpacing: -1,
              primary: true,
              //Källhänvisning: 'Rounded bottom on appbar', stackoverflow.com/questions/50242087/rounded-bottom-on-appbar publicerad 13 september 2020, hämtad 23 maj 2025
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(100),
                  )
              ),
            ),
            SizedBox(height: 100),

            Container(
              height: 640,
              width: 360,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: Color.fromARGB(6, 255, 255, 255)
              ),
              child: Column(
                children: [
                  SizedBox(height: 45), //vertical padding

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 300,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 220, 96, 234),
                              spreadRadius: 0.5,
                              blurRadius: 0,
                              offset: Offset(6, 6)
                            )
                          ]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Grattis!", textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 25, fontWeight: FontWeight.w700)),
                            SizedBox(height: 10),
                            Text("Märket har lagts till i din samling!", textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 16, fontWeight: FontWeight.w700))
                          ],
                        )
                      ),
                    ],
                  ),

                  SizedBox(height: 60),

                  //Gå till Din profil knapp
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFFF382F3),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: Offset(0.5, 1)
                          )
                        ]
                    ),
                    child: Container(
                      width: 200,
                      height: 53,
                      decoration: BoxDecoration(
                          color: Color(0xFFF382F3),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 220, 96, 234),
                              spreadRadius: 2,
                              blurRadius: 0,
                              offset: Offset(0, 2),
                            ),
                          ]
                      ),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => ProfilePage()));
                          },
                          child: Text("Gå till Din profil", style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'InknutAntiqua',
                              fontSize: 18))
                      ),
                    ),
                  ),

                  SizedBox(height: 150),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.only(top: 10),
                        width: 392,
                        height: 114,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 43, 43, 43),
                            borderRadius: new BorderRadius.vertical( //rundad kant container källhänvisning: 'Rounded Bottom on appbar', stackoverflow.com/questions/50242087/rounded-bottom-on-appbar av user "Rémi Rousselet" publicerad 8 maj 2018, hämtad 25 maj 2025
                              top: new Radius.elliptical(MediaQuery.of(context).size.width, 100),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 20, 20, 20),
                                  spreadRadius: 2,
                                  blurRadius: 25,
                                  offset: Offset(0.5, 1)
                              )
                            ]
                        ),
                        //KNAPP 2
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 25, 25, 25), //
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: Offset.fromDirection(0, 2)
                                )
                              ]
                          ),

                          child: Container(
                              height: 60,
                              width: 265,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 60, 60, 60),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: OutlinedButton.icon(
                              icon: Icon(Icons.delete_rounded, color: Color.fromARGB(255, 205, 205, 205), size: 30),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Color.fromARGB(255, 205, 205, 205), width: 3)
                              ),
                              onPressed: () {
                                showDialog(context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog.adaptive(
                                        backgroundColor: Colors.white, //ta bort default bakgrundsfärg, ram
                                        content: SizedBox(
                                          height: 160,
                                          width: 360,
                                          child: ListView(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                                                  color: Colors.white,
                                                  child: Column(
                                                      children: [
                                                        Text("Vill du verkligen radera detta märke?", style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'InknutAntiqua')),
                                                        SizedBox(height: 20),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              width: 100,
                                                              height: 50,
                                                              decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(30),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                        color: Color.fromARGB(255, 230, 230, 230),
                                                                        spreadRadius: 2,
                                                                        blurRadius: 8,
                                                                        offset: Offset(0, 0)
                                                                    )
                                                                  ]
                                                              ),
                                                              child: OutlinedButton(
                                                                  style: OutlinedButton.styleFrom(
                                                                      backgroundColor: Colors.red,
                                                                      side: BorderSide(color: Color.fromARGB(255, 220, 220, 220), width: 1)
                                                                  ),
                                                                  onPressed: () {
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Text("Nej", style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 15),

                                                                  ),
                                                              ),
                                                            ),

                                                            SizedBox(width: 23),

                                                              Container(
                                                                width: 100,
                                                                height: 50,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(80),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Color.fromARGB(255, 230, 230, 230),
                                                                        spreadRadius: 2,
                                                                        blurRadius: 8,
                                                                        offset: Offset(0, 0)
                                                                      )
                                                                    ]
                                                                ),
                                                                child: OutlinedButton(
                                                                  style: OutlinedButton.styleFrom(
                                                                    backgroundColor: Colors.white,
                                                                    side: BorderSide(color: Color.fromARGB(255, 220, 220, 220), width: 1)
                                                                  ),
                                                                  onPressed: () { //TODO: BACKEND, HANTERA ALTERNATIVET "JA", RADERA MÄRKE
                                                                    showDialog(context: context, barrierDismissible: false, builder: (BuildContext context) { //barrierDismissable prevent going back to previous AlertWindow, källhänvisning: 'Flutter - Dismiss system keyboard after tapping outside of AlertDialog widget',
                                                                      //stackoverflow.com/questions/68416276/flutter-dismiss-system-keyboard-after-tapping-outside-of-alertdialog-widget, publicerad 7 mars 2023, hämtad 25 maj 2025
                                                                      return AlertDialog( //Märket har raderats-fönster
                                                                        backgroundColor: Colors.white, //ta bort default bakgrundsfärg, ram
                                                                        content: Container(
                                                                          width: 300,
                                                                          height: 190,
                                                                          decoration: BoxDecoration(
                                                                            color: Colors.white,
                                                                          ),
                                                                          child: Column(
                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                              SizedBox(width: 222),
                                                                              Container(
                                                                                width: 40,
                                                                                height: 40,
                                                                                child: FloatingActionButton( //Rött kryss knapp
                                                                                    backgroundColor: Colors.white,
                                                                                    shape: const CircleBorder(),
                                                                                    child: Icon(Icons.close, color: Colors.red),
                                                                                    onPressed: (){ //Gå tillbaka till profile page
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                                                                                    },
                                                                                    ),
                                                                              )
                                                                              ],
                                                                            ),
                                                                            Column(
                                                                              children: [
                                                                                SizedBox(height: 20),
                                                                                Text("Märket har raderats.", style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 22)),
                                                                                SizedBox(height: 20),
                                                                                Icon(Icons.delete_rounded, color: Color.fromARGB(255, 30, 30, 30), size: 55)
                                                                              ],
                                                                            )
                                                                          ],
                                                                          )
                                                                        ),
                                                                      );
                                                                    }
                                                                    );
                                                                  },
                                                                child: Text("Ja", style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 15))
                                                                ),
                                                              ),
                                                            ],
                                                        )
                                                      ],
                                                  ),
                                                )
                                              ],
                                          )
                                        )
                                      );
                                    }
                                );
                              }, label: Text("Radera märke", style: TextStyle(color: Color.fromARGB(255, 205, 205, 205), fontFamily: 'InknutAntiqua', fontSize: 18),
                             ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                 Container(
                      width: 392,
                      height: 68,
                      color: Color.fromARGB(255, 43, 43, 43)
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//Kamera-galleri eller kamera
  Future _pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }

  Future _pickImageFromCamera() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);

    if(returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }
}
