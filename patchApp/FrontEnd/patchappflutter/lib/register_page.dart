//NYTT FÖRSÖK NY BRANCH

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:patchappflutter/register_user_confirmed.dart'; //sidan RegisterUserConfirmedPage
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
    File ? _selectedImage; 
 //lägga till från kamera eller bibliotek variabel
    @override
    Widget build(BuildContext context) {
      var screenSize = MediaQuery.of(context).size; //screensize

      return Scaffold(
        body: Column(
          children: [
          //Text("Create new Sytt & Bytt Account", textAlign: TextAlign.left, style: TextStyle(fontFamily: 'HappyMonkey', color: const Color.fromARGB(255, 32, 32, 32), fontSize: 16, fontWeight: FontWeight.w200)),
          Container(
          alignment: Alignment.center,
          //padding: EdgeInsets.only(top: 20),
          color: const Color.fromARGB(255, 241, 241, 241), //bakgrunden bakom inputfields-Container
          
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/stitches4.png'),
                fit: BoxFit.fill,
                    )
                  ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                SizedBox(height: 85),
                
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 255, 112, 243),
                        spreadRadius: 2,
                        blurRadius: 14,
                        offset: Offset(1, 2)
                      )
                    ]
                  ),
                  child: CircleAvatar( //LÄGGA TILL PROFILBILD REGISTRERA ANVÄNDARE
                      radius: 80,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.add, color: Colors.black, size: 30),
                      foregroundImage: _selectedImage != null ? FileImage(_selectedImage!) : null //Kodrad Källhänvisning: youtu.be/qYCsxvbPDC8?si=QmZC_OoY8unh9ZRS, 'Flutter Image Picker & Cropper From Camera & Gallery | Learn Flutter Fast', av kanalen Marcus Ng, publicerad 11 november 2022, hämtad 19 maj 2025.
                    ),
                ),
                
                SizedBox(height: 15), //padding
               
                //Add profile picture knapp
                Row(
                  children: [
                    SizedBox(width: 120),
                    Container(
                          padding: EdgeInsets.all(8),
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: FloatingActionButton(
                              backgroundColor: Colors.white,
                              shape: const CircleBorder(),
                              hoverColor: Color.fromARGB(255, 255, 255, 255),
                              focusColor: Colors.white,
                              child: Icon(Icons.add_photo_alternate_sharp, size: 31, color: Colors.black),
                              onPressed: () {
                                _pickImageFromGallery();
                              }),
                        ),
                
                SizedBox(height: 21), //simulated padding

                Container(
                        padding: EdgeInsets.all(8),
                        height: 90,
                        width: 80,   
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: FloatingActionButton(
                            backgroundColor: Colors.white,
                            shape: const CircleBorder(),
                            hoverColor: Color.fromARGB(255, 255, 255, 255),
                            focusColor: Colors.white,
                            child: Icon(Icons.add_a_photo_sharp, size: 31, color: Colors.black),
                            onPressed: () {
                              _pickImageFromCamera();
                      }
                    ),
                  ),
                  ],
            ),

                SizedBox(height: 20), //padding

              //KNAPP 1
              Container( 
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 122, 217, 255),
                    blurRadius: 3,
                    spreadRadius: 2,
                    offset: Offset(1, 2)
                  )
                  ]),
              child: SizedBox(
                height: 55,
                width: 350,
                child: TextField(
                    obscureText: false,
                    cursorColor: const Color.fromARGB(255, 214, 18, 185),
                    cursorHeight: 24,
                    style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 15),
                    decoration: InputDecoration(
                      //hintStyle: TextStyle(color: Colors.black),
                      hoverColor: Colors.black,
                      labelText: 'Name:', labelStyle: TextStyle(fontFamily: ('InknutAntiqua')), floatingLabelBehavior: FloatingLabelBehavior.never,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent, width: 1.1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent, width: 1.1),
                          borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
              //SizedBox(height: 20), //padding
            
              SizedBox(height: 20), //padding mellan password-textfield (input) och Email-input field
                
              //SizedBox(height: 20), //padding
            
              Container( 
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 122, 217, 255),
                    blurRadius: 3,
                    spreadRadius: 2,
                    offset: Offset(1, 2)
                  )
                  ]),
              child: SizedBox(
                height: 55,
                width: 350,
                child: TextField(
                    obscureText: false,
                    cursorColor: const Color.fromARGB(255, 214, 18, 185),
                    cursorHeight: 24,
                    style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 14),
                    decoration: InputDecoration(labelText: 'KM name:', labelStyle: TextStyle(fontFamily: ('InknutAntiqua')), floatingLabelBehavior: FloatingLabelBehavior.never, //OPTIONAL
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent, width: 1.1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent, width: 1.1),
                        borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                ),
              ),
            
              SizedBox(height: 20),
            
              Container( 
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 122, 217, 255),
                    blurRadius: 3,
                    spreadRadius: 2,
                    offset: Offset(1, 2)
                  )
                  ]),
              child: SizedBox(
                height: 56,
                width: 350,
                child: TextField(
                    obscureText: false,
                    cursorColor: const Color.fromARGB(255, 214, 18, 185),
                    cursorHeight: 24,
                    style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 14),
                    decoration: InputDecoration(labelText: 'Section:', labelStyle: TextStyle(fontFamily: ('InknutAntiqua')), floatingLabelBehavior: FloatingLabelBehavior.never, //OPTIONAL
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent, width: 1.1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent, width: 1.1),
                        borderRadius: BorderRadius.circular(30),
                    ),
                    ),
                  ),
                ),
              ),
            
              SizedBox(height: 20),
            
              Container(  //"Enter your university"
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 122, 217, 255),
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: Offset(1, 3)
                  )
                  ]
                ),
              child: SizedBox(
                height: 55,
                width: 350,
                child: TextField(
                    obscureText: false,
                    cursorColor: const Color.fromARGB(255, 214, 18, 185),
                    cursorHeight: 24,
                    style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 14),
                    decoration: InputDecoration(labelText: 'Your university:', labelStyle: TextStyle(fontFamily: ('InknutAntiqua')), floatingLabelBehavior: FloatingLabelBehavior.never,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent, width: 1.1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent, width: 1.1),
                        borderRadius: BorderRadius.circular(30),
                    ),
                    ),
                    ),
                  ),
              ),
            
              SizedBox(height: 26), //padding mellan input-fields och de 2 knapparna
            
              //KNAPP 2
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 255, 129, 211),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset.fromDirection(0.5, 1)
                    )
                  ]
                ),
              
              child: SizedBox(
               // alignment: Alignment.center,
                height: 45,
                width: 150,
                child: TextButton(
                  style: TextButton.styleFrom(
                  //side: BorderSide(width: 0.8, color: const Color.fromARGB(255, 0, 0, 0)),
                  backgroundColor: const Color.fromARGB(255, 255, 112, 243),
                  //shadowColor: const Color.fromARGB(255, 255, 198, 43),
                  overlayColor: Colors.white
                  ),
                  onPressed: () { //vad som sker när man trycker på knappen
                    Navigator.push( 
                                  context,
                                  MaterialPageRoute(builder: (context) => RegisterUserConfirmedPage()), //hänvisa till confirmation page
                              );
                  },
                  child: Text("Register", style: TextStyle(fontFamily: 'InknutAntiqua', color: Colors.black, fontSize: 16)))
              ),
            ),
              
              SizedBox(height: 20), //padding mellan input-fält och register

                  ]
                 ),
              )
            )
          ],
        ),
      );
    }  

    //Lägga till bild från kameragalleri
    Future _pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }

    //Lägga till bild från kamera
    Future _pickImageFromCamera() async {
      final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);

      if(returnedImage == null) return;
      setState(() {
        _selectedImage = File(returnedImage!.path);
      });
    } 
}


