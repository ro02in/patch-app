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
    String username = ''; //skapa variabel username

  return Scaffold(
    backgroundColor: Colors.white,
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
      child: Column(
        children: [
          SizedBox(height: 60), //vertical padding
          Text("Trade action page", style: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 20)),
          SizedBox(height: 70), //vertical padding
          Text("Give patch to:", style: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 20)),
          Container(
            height: 30,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            alignment: Alignment.center,
            child: Text(username),
            ),
          SizedBox(height: 1),
          CircleAvatar( //klicka på och kunna välja bild
            backgroundColor: Colors.white,
            radius: 60,
            child: Icon(Icons.add, color: Colors.black, size: 20)),

          //KNAPP LÄGGA TILL FOTO
          Row(
            children: [
              SizedBox(width: 127),

              //Kamera-knapp
              Container(
              padding: EdgeInsets.all(10),
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  shape: const CircleBorder(),
                  hoverColor: Color.fromARGB(255, 255, 255, 255),
                  focusColor: Colors.white,
                  child: Icon(Icons.add_a_photo_sharp, size: 29, color: Colors.black),
                  onPressed: () {
                    _pickImageFromCamera();
                  }),
            ),
            
            SizedBox(width: 2), //spacing
            
            //Galleri-knapp
            Container(
              padding: EdgeInsets.all(10),
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  shape: const CircleBorder(),
                  hoverColor: Color.fromARGB(255, 255, 255, 255),
                  focusColor: Colors.white,
                  child: Icon(Icons.add_photo_alternate_sharp, size: 29, color: Colors.black),
                  onPressed: () {
                    _pickImageFromGallery();
                  }),
            ),
            ],

          ),

          SizedBox(height: 15),

          Text("You will recieve:", style: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 20)),
          SizedBox(height: 5),
          CircleAvatar( //klicka på och kunna välja bild
            backgroundColor: Colors.white,
            radius: 60,
            child: Icon(Icons.add)),
            
          SizedBox(height: 30),

         /* ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 239, 137, 254),
              overlayColor: Colors.white,
              shadowColor: Colors.white
            ),
          child: Text("Select image from gallery", style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 15)),
          onPressed: (){
            _pickImageFromGallery();
            },
          ), */
          
          /*ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 239, 137, 254),
              overlayColor: Colors.white,
              shadowColor: Colors.white
            ),
          child: Text("Select image from camera", style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 15)),
          onPressed: (){
            _pickImageFromCamera();
            },
          ),
          const SizedBox(height: 20),
          _selectedImage != null ? Image.file(_selectedImage!) : const Text("Please select an image", style: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 18)), */
        
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
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          /*Center(
            child: FittedBox(
              fit: BoxFit.contain,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 64,
                foregroundImage: _image != null ? FileImage(_image!) : null,
                child: Text(
                  widget.intials,
                  style: const TextStyle(fontSize: 48)
                )
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () async {
              final files = await imageHelper.pickImage();
              if(files.isNotEmpty) {
                final croppedFile = await imageHelper.crop(
                  file: files.first,
                  cropStyle: CropStyle.circle,
                );
                if(croppedFile != null) {
                  setState(() => _image = File(croppedFile.path));
                }
              }
            },
            child: const Text('Select photo'),
          )
      ])
    )
  );
}
//test
}*/

