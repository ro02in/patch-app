//NYTT FÖRSÖK NY BRANCH

//Denna fil använder kod från källa Youtube-video youtu.be/vwSY5Q-mVMs?si=9jipUg8rNTfF9PAs, 'Flutter Tutorial - Image Picker From Gallery & Camera' av kanalen Flutter Guys, 
//publicerad 9 juli 2023, hämtad 18 maj 2025. Samt i kodrad 35 i pubspec.yaml för dependencies.


 //Denna fil använder kod från källa Youtube-video 'Flutter Image Picker & Cropper From Camera & Gallery | Learn Flutter Fast', 
 // youtu.be/qYCsxvbPDC8?si=1U4WiVS3sKaa-Usd av kanalen Marcus Ng på Youtube publicerad 11 november 2022, hämtad 2025-05-17.
 //Även filen i path ios/Flutter/Info.plist kodrad 48 och 49 är kod hämtad från samma källa, samt dependencies i pubspec.yaml*/

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TradeActionPage extends StatefulWidget {
  const TradeActionPage({Key? key}) : super(key : key);
  /*const TradeActionPage({
    super.key}); */

  @override
  State<TradeActionPage> createState() => _TradeActionPageState();
}

class _TradeActionPageState extends State<TradeActionPage> {
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
          image: AssetImage('assets/stitches1.png'),
          fit: BoxFit.fill,
        ),
      ),
      alignment: Alignment.center,
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 0), //ta bort glapp mellan appbar och bakgrundsbild
        children: [
          //AppBar flyttad hit
          AppBar(
            backgroundColor: Colors.white,
            elevation: 40,
            shadowColor: Colors.black,
            toolbarHeight: 60,
            leadingWidth: 130,
            centerTitle: true,
            primary: true,
            //Källhänvisning: 'Rounded bottom on appbar', stackoverflow.com/questions/50242087/rounded-bottom-on-appbar publicerad 13 september 2020, hämtad 23 maj 2025
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(100),
                )
            ),
            title: Text("Byt märke", style: TextStyle(fontFamily: 'InknutAntiqua', fontSize: 19, color: Colors.black, fontWeight: FontWeight.w600)),
          ),
          SizedBox(height: 30),
          
          Container(
            height: 790,
            width: 360,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              color: Color.fromARGB(8, 255, 255, 255)
            ),
            child: Column(
              children: [
                SizedBox(height: 45), //vertical padding
                Text("Ge märke till:", style: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 28)),
                SizedBox(height: 10),
                Container( //Textbox userName //BACKEND
                  height: 45,
                  width: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color.fromARGB(255, 60,60, 60), width: 2.5),
                    color: Color.fromARGB(255, 40, 40, 40),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 30, 30, 30),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: Offset(0.5, 1)
                      )
                    ]
                  ),
                  alignment: Alignment.center,
                  child: Text('$userName', style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'CalSans')), //BACKEND userName-värde
                ),
                SizedBox(height: 18),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 69),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.purpleAccent,
                                spreadRadius: 1,
                                blurRadius: 0,
                                offset: Offset(0, 4)
                            )
                          ]
                      ),
                      child: CircleAvatar( //klicka på och kunna välja bild
                          backgroundColor: Colors.white,
                          radius: 80,
                          child: Icon(Icons.add, color: Colors.black, size: 20)),
                    ),
                    SizedBox(width: 18),
                    //Första + knappen
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.purpleAccent,
                                blurRadius: 0,
                                spreadRadius: 0.5,
                                offset: Offset(0.5, 1)
                            )
                          ]
                      ),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: FloatingActionButton(
                            backgroundColor: Colors.white,
                            shape: const CircleBorder(),
                            hoverColor: Color.fromARGB(255, 255, 255, 255),
                            focusColor: Colors.white,
                            child: Icon(Icons.add_circle_outline_sharp, size: 30, color: Colors.purpleAccent),
                            onPressed: () {
                              _pickImageFromCamera();
                            }),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 15),

                //KNAPP LÄGGA TILL FOTO

                SizedBox(height: 25),

                Text("Du vill motta\nföljande märke:", textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 28)),
                SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 69),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purpleAccent,
                            spreadRadius: 1,
                            blurRadius: 0,
                            offset: Offset(0, 4)
                          )
                        ]
                      ),
                      child: CircleAvatar( //klicka på och kunna välja bild
                          backgroundColor: Colors.white,
                          radius: 80,
                          child: Icon(Icons.add)),
                    ),
                    SizedBox(width: 18),
                    //Lägg till märke man vill göra request

                    //Andra + knappen
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.deepPurpleAccent,
                                blurRadius: 0,
                                spreadRadius: 0.5,
                                offset: Offset(0.5, 1)
                            )
                          ]
                      ),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: FloatingActionButton(
                            backgroundColor: Colors.white,
                            shape: const CircleBorder(),
                            hoverColor: Color.fromARGB(255, 255, 255, 255),
                            focusColor: Colors.white,
                            child: Icon(Icons.add_circle_outline_sharp, size: 30, color: Colors.deepPurpleAccent),
                            onPressed: () {
                              _pickImageFromCamera();
                            }),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
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
