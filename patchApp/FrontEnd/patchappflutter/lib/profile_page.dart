//NYTT FÖRSÖK NY BRANCH

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
 //ej klar
  File ? _selectedImage;
  List<String> patchImages = ['assets/sboverall', 'assets/syttbyttcirclelogo']; //BACKEND lista med användarens alla patches

  void initState() { //Kodrad lösning för att hämta första entry i list: källhänvisning: 'The instance member 'widget' can't be accessed in an initializer. Try replacing the reference to the instance member with a different expression', stackoverflow.com/questions/67501594/the-instance-member-widget-cant-be-accessed-in-an-initializer-try-replacing, av user 'MobIT', publicerad 12 maj 2021, hämtad 21 maj 2025
    super.initState();
    String patchImage = patchImages.first;
  }

@override
Widget build(BuildContext context) {
  var screenSize = MediaQuery.of(context).size; //screensize
  String userName = 'UserName here';

  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 31, 31, 31),
    body: Scrollbar(
      //padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
      child: ListView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(0),
        children: [
          Column(
            children: [
              SizedBox(height: 40),

              SizedBox(height: 30),

              //RAD PROFILBILD + 2 RUNDA KNAPPAR
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container( //LÄGGA TILL PROFILBILD KNAPP
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 226, 93, 246),
                              offset: Offset(0.5, 1),
                              spreadRadius: 2,
                              blurRadius: 5
                          )
                        ]
                    ),
                    child: FloatingActionButton(
                        shape: const CircleBorder(),
                        onPressed: () {
                          _pickImageFromCamera();
                        },
                        child: Icon(Icons.add_a_photo_sharp, color: Colors.black, size: 20)),
                  ),

                  SizedBox(width: 16),

                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                      child: Icon(Icons.add, color: Colors.black, size: 30),
                      foregroundImage: _selectedImage != null ? FileImage(_selectedImage!) : null), //Kodrad Källhänvisning: youtu.be/qYCsxvbPDC8?si=QmZC_OoY8unh9ZRS, 'Flutter Image Picker & Cropper From Camera & Gallery | Learn Flutter Fast', av kanalen Marcus Ng, publicerad 11 november 2022, hämtad 19 maj 2025.

                  SizedBox(width: 16),

                  Container( //LÄGGA TILL PROFILBILD VIA GALLERI KNAPP
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 226, 93, 246),
                          offset: Offset(0.5, 1),
                          spreadRadius: 2,
                          blurRadius: 5
                        )
                      ]
                    ),
                    child: FloatingActionButton(
                      shape: const CircleBorder(),
                    onPressed: () {
                        _pickImageFromGallery();
                    },
                    child: Icon(Icons.add_photo_alternate_sharp, color: Colors.black, size: 20)),
                  )
                ],
              ),

              SizedBox(height: 10),
              Text("$userName", style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'InknutAntiqua')),

              SizedBox(height: 30),

              Row(
                children: [
                  SizedBox(width: 30),
                  Text("Collection", style: TextStyle(color: Colors.white, fontSize: 30, fontFamily: 'InknutAntiqua')),
                ],
              ),

              SizedBox(height: 50),

              Row(
                children: [
                  SizedBox(width: 70),
                  Image.asset('assets/lavendel.PNG', width: 250, height: 250)
                ],
              )


             /* Expanded(
                 child:
                 GridView.builder(
                   itemCount: patchImages.length,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                      itemBuilder: (BuildContext ProfilePage, int index) {
                      return CircleAvatar(
                        backgroundColor: Colors.white,
                         // foregroundImage: _patchImage != null ? FileImage(_patchImage!) : null),
                      );
                   },
                 ),

              ), */
              ], //CHILDREN MAIN COLUMN
            ),
          ],
        )
      )
    );

  }

//Kamera-galleri eller kamera
Future _pickImageFromGallery() async {
  final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

  if(returnedImage == null) return;
  setState(() {
    _selectedImage = File(returnedImage!.path);
  }
  );
}

Future _pickImageFromCamera() async {
  final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);

  if(returnedImage == null) return;
  setState(() {
    _selectedImage = File(returnedImage!.path);
  });
}
} //Class ProfilePage