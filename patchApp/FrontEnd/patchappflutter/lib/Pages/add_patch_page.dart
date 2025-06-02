//24 maj ändringar

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart'; /*Källhänvisning: 'flutter switch package': Copyright (c) 2020, Nichole John Romero All rights reserved, hämtad via //pub.dev/packages/flutter_switch,
publicerad 22 juni 2021, hämtad 9 maj 2025.
Denna kod använder detta flutter switch-package för att enklare kunna lägga till Text på en Switch-knapp, vilket verkar vara omstädigt/inte gå genom vanlig Switch och Switch button-lösning i flutter.*/
import 'package:http/http.dart' as http;

import 'package:image_picker/image_picker.dart';
import 'package:patchappflutter/Pages/post_log_in_page.dart';
import 'package:patchappflutter/Pages/profile_page.dart';
import 'package:patchappflutter/Provider/user_provider.dart';
import 'package:provider/provider.dart';
import '../Provider/Patch_Provider.dart'; // Adjust path as needed
import '../Model/patch_model.dart';
import '../global_user_info.dart'; // Adjust path as needed


//Variabler till DropDownButtons
const List<String> colours = <String>['Färg', 'Blå', 'Brun', 'Grå', 'Grön', 'Gul', 'Lila', 'Orange', 'Rosa', 'Röd', 'Svart', 'Vit'];
const List<String> placement = <String>['Placering','Ej påsytt', 'Vänster arm', 'Höger arm', 'Vänster ben', 'Höger ben', 'Överkropp', 'Krage', 'Skrev'];
//const List<String> studentClubs = <String>['Klubbmästeri', 'DISK', 'Klubb3', 'Klubb5', 'Klubb6', 'Klubb6', 'Klubb7', 'Klubb8', 'Klubb9', 'Klubb10'];

//Listor till DropDownButtons
String dropdownColour = colours.first;
String dropdownPlacement = placement.first;
//String dropdownStudentClub = studentClubs.first;

class PatchViewPage extends StatefulWidget {
  const PatchViewPage({super.key});

  @override
  State<PatchViewPage> createState() => _PatchViewPageState();
}

class _PatchViewPageState extends State<PatchViewPage> {
  int amount = 1; //27 maj ändring amount-delen
  bool publicPrivate = true; //switch button variable
  bool trade = true;
  String patchName = '';
  String klubbMasteri = '';
  final String baseUrl = 'https://group-4-15.pvt.dsv.su.se/api/patch/add';
  String beskrivning = '';
  int ownerId = 0;
  //PatchProviderpatchProvider = Provider.of<PatchProvider>(context, listen: false)
  final patchNameController = TextEditingController();
  final beskrivningFieldController = TextEditingController();
  final klubbmasteriFieldController = TextEditingController();

  @override
  void dispose() {
    patchNameController.dispose();
    beskrivningFieldController.dispose();
    klubbmasteriFieldController.dispose();
    super.dispose();
  }


 /* void initState() { //Kodrad lösning för att hämta första entry i list: källhänvisning: 'The instance member 'widget' can't be accessed in an initializer. Try replacing the reference to the instance member with a different expression', stackoverflow.com/questions/67501594/the-instance-member-widget-cant-be-accessed-in-an-initializer-try-replacing, av user 'MobIT', publicerad 12 maj 2021, hämtad 21 maj 2025
    super.initState();
    //Provider.of<PatchProvider>(context, listen: false).changeOwnerId(newOwnerId: context.watch<UserProvider>().id);
    //ownerId = Provider.of<PatchProvider>(context, listen: false).ownerId;
    ownerId = Provider.of<PatchProvider>(context, listen: false).ownerId;
  }
  @override
  void initState() {
    super.initState();
    //ownerId = Provider.of<PatchProvider>(context, listen: false).;
    //Vänta tills widgetträdet är färdigbyggt innan vi använder context med Provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userId = context.read<UserProvider>().id;
      Provider.of<PatchProvider>(context, listen: false)
        .changeOwnerId(newOwnerId: userId);
    });
  }*/




  File ? _selectedImage; //lägga till från kamera eller bibliotek variabel

  Future<Uint8List> _fileToUint8List(File file) async {
    return await file.readAsBytes();
  }

  void _createPatchWithProvider(BuildContext context) async {
    //final patchProvider = Provider.of<PatchProvider>(context, listen: false);
    final patchProvider = Provider.of<PatchProvider>(context, listen: false);

    try {
      // Convert selected image to Uint8List
      Uint8List imageData = Uint8List(0); // Default empty
      if (_selectedImage != null) {
        imageData = await _fileToUint8List(_selectedImage!);
      }

      void clearForm() {
        setState(() {
          patchNameController.clear();
          beskrivningFieldController.clear();
          klubbmasteriFieldController.clear();
          _selectedImage = null;
          dropdownColour = colours.first;
          dropdownPlacement = placement.first;
          amount = 1;
          publicPrivate = true;
          trade = true;
          patchName = '';
          beskrivning = '';
          klubbMasteri = '';
        });
      }
      //Uint8List emptyList = new Uint8List();
      //Provider.of<PatchProvider>(context, listen: false).setOwnerId();
      patchProvider.setOwnerId();
      PatchModel newPatch = PatchModel(patchId: null,
        patchName: patchNameController.text,
        description: beskrivningFieldController.text,
        ownerId: Provider.of<PatchProvider>(context, listen: false).ownerId,
        pictureData: imageData,
        isPublic: publicPrivate,
        placement: dropdownPlacement,
        klubbmasteri: klubbmasteriFieldController.text,
        color: dropdownColour,
      );
      await Future.delayed(const Duration(seconds: 1));

      if(!context.mounted) return;
      await patchProvider.registerPatchTester(newPatch);



        // Success - patch created
        if(!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Märket har lagts till!'),
            backgroundColor: Colors.green,
          ),
        );
        // Optionally clear the form or navigate back
        clearForm();

        // Error occurred
        if(!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Märket kunde inte läggas till.'),
            backgroundColor: Colors.blue,
          ),
        );

    } catch (e) {
      rethrow;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ett fel uppstod: $e'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 31, 31), //beige color
      body: Scrollbar(
        child: ListView( //Wrapping widget: Gör denna sida SCROLLABLE
          //padding: EdgeInsets.symmetric(vertical: 0), //scrollable padding marginal
          padding: EdgeInsets.all(0),
          physics: const AlwaysScrollableScrollPhysics().applyTo(const ClampingScrollPhysics()),
          children: [
            SizedBox(height: 40), //padding

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.amberAccent,
                            spreadRadius: 1,
                            blurRadius: 0,
                            offset: Offset(0, 4)
                        )
                      ]
                  ),
                  child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.add, color: const Color.fromARGB(255, 104, 94, 94), size: 30),
                      foregroundImage: _selectedImage != null ? FileImage(_selectedImage!) : null),
                ),
              ],
            ), //Kodrad Källhänvisning: youtu.be/qYCsxvbPDC8?si=QmZC_OoY8unh9ZRS, 'Flutter Image Picker & Cropper From Camera & Gallery | Learn Flutter Fast', av kanalen Marcus Ng, publicerad 11 november 2022, hämtad 19 maj 2025.


            SizedBox(height: 15),

            //LÄGGA TILL BILD FRÅN KAMERA
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(4), //styr tjocklek på rosa ram
                  height: 68,
                  width: 68,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 243, 68, 255),
                        blurRadius: 0,
                        spreadRadius: 0.2
                      )
                    ]
                  ),
                  child: FloatingActionButton(
                      heroTag: "FAB1",
                      backgroundColor: Colors.white,
                      shape: const CircleBorder(),
                      hoverColor: Color.fromARGB(255, 255, 255, 255),
                      focusColor: Colors.white,
                      child: Icon(Icons.add_photo_alternate_sharp, size: 29, color: Colors.black),
                      onPressed: () {
                        _pickImageFromGallery();
                      }),
                ),
                SizedBox(width: 15),
                Container(
                  padding: EdgeInsets.all(4), //styr tjocklek på rosa ram
                  height: 68,
                  width: 68,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 243, 68, 255),
                            blurRadius: 0,
                            spreadRadius: 0.2
                        )
                      ]
                  ),
                  child: FloatingActionButton(
                      heroTag: "FAB2",
                      backgroundColor: Colors.white,
                      shape: const CircleBorder(),
                      hoverColor: Color.fromARGB(255, 255, 255, 255),
                      focusColor: Colors.white,
                      child: Icon(Icons.add_a_photo_sharp, size: 29, color: Colors.black),
                      onPressed: () {
                        _pickImageFromCamera();
                      }
                  ),
                ),
              ],
            ), //ROW LÄGGA TILL FRÅN KAMERA

            SizedBox(height: 20), //simulated padding
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(4, 0, 0, 4),
                    child: Container(
                      height: 45,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 239, 137, 254),
                              spreadRadius: 3.5,
                              blurRadius: 0
                            )
                          ]
                      ),
                      child: TextField(
                        controller: patchNameController,
                        obscureText: false,
                        cursorColor: Color.fromARGB(255, 239, 137, 254),
                        cursorHeight: 22,
                        maxLength: 20,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        onChanged: (value) => patchName = patchNameController.text, //spara variabel märkesnamn

                        style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 14),
                        decoration: InputDecoration(
                          counterStyle: TextStyle(fontFamily: 'InknutAntiqua', color: Colors.black, fontSize: 13, height: -80),
                          contentPadding: EdgeInsets.only(left: 15, bottom: 16, right: 20),
                          //hintStyle: TextStyle(color: Colors.black),
                          hoverColor: Colors.black,
                          labelText: 'Märkesnamn:', labelStyle: TextStyle(color: Colors.black, fontFamily: ('InknutAntiqua')), floatingLabelBehavior: FloatingLabelBehavior.never,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ]
            ),


            SizedBox(height: 22), //spacing mellan Märkesnamn-input och Beskrivning

            Row( //History-rubrik
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 42), //spacing padding
                  Text("Beskrivning:", style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: ('InknutAntiqua'), fontWeight: FontWeight.w400)),
                  SizedBox(width: 4), //spacing between text and icon
                  //Icon(Icons.border_color_sharp, size: 20),
                ]),
            SizedBox(height: 10), //padding
            SizedBox(width: 340), //padding marginal till vänster
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container( //Beskrivning box
                    height: 90,
                    width: 330,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 92, 230, 255),
                              spreadRadius: 0.8,
                              blurRadius: 0,
                              offset: Offset(0, 3)
                          )
                        ]
                    ),
                    //padding: EdgeInsets.symmetric(horizontal: 80),
                    //child: Text("History about your patch... lorem ipsum \nhejhejhej" , textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontFamily: ('HappyMonkey'), fontSize: 14)),
                    child: TextFormField(
                      controller: beskrivningFieldController,
                      style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 14),
                      obscureText: false,
                      cursorColor: const Color.fromARGB(255, 239, 137, 254),
                      cursorHeight: 22,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.multiline, //tillåt enter flera rader
                      maxLines: 4,
                      maxLength: 250,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      onChanged: (value) => beskrivning = beskrivningFieldController.text, //spara input beskrivning i variabel

                      scrollPadding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      decoration: InputDecoration(
                          counterStyle: TextStyle(fontFamily: 'InknutAntiqua', color: Colors.black, fontSize: 13, height: -50),
                          //labelText: 'History about your patch:',
                          contentPadding: EdgeInsets.fromLTRB(15, 15, 10, 20),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none
                      ),
                    )
                ),
              ],
            ),


            SizedBox(height: 20), //padding

            //Klubbmästeri TEXTINPUTFÄLT
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Container(
                    height: 40,
                    width: 330,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 92, 230, 255),
                              spreadRadius: 0.5,
                              blurRadius: 0,
                              offset: Offset(0, 3)
                          )
                        ]
                    ),
                    child: TextField(
                      controller: klubbmasteriFieldController,
                      obscureText: false,
                      cursorColor: const Color.fromARGB(255, 239, 137, 254),
                      cursorHeight: 21,
                      maxLength: 20,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      onChanged: (value) => klubbMasteri = klubbmasteriFieldController.text,

                      style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 14),
                      decoration: InputDecoration(
                          counterStyle: TextStyle(fontFamily: 'InknutAntiqua', color: Colors.black, fontSize: 13, height: -60),
                          contentPadding: EdgeInsets.only(left: 12, bottom: 15, right: 10),
                          hoverColor: const Color.fromARGB(255, 239, 137, 254),
                          labelText: 'Klubbmästeri:', labelStyle: TextStyle(color: Colors.black, fontFamily: ('InknutAntiqua')), floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none
                      ),
                    ),
                  ),
                ),
              ],
            ),//KLUBBMÄSTERI TEXTINPUTFÄLT

            //Knapp 2 Colour
            SizedBox(height: 20),

            //KNAPP 2 Colour
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container( //COLOR BUTTON DROPDOWNBUTTON
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    width: 330,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 92, 230, 255),
                              spreadRadius: 0.5,
                              blurRadius: 0,
                              offset: Offset(0, 3)
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
                ),
              ],
            ), //FÄRG BUTTON DROPDOWNBUTTON
            SizedBox(height: 20),

            //Knapp 1 PLACERING DROPDOWNMENU
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container( //PLACERING DROPDOWNBUTTON
                    width: 330,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 92, 230, 255),
                              spreadRadius: 0.5,
                              blurRadius: 0,
                              offset: Offset(0, 3)
                          )
                        ]
                    ),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          dropdownColor: Colors.white,
                          menuMaxHeight: 180, //scrollable menu, styra hur många entries som syns samtidigt i dropdown-menyn
                          menuWidth: 280,
                          borderRadius: BorderRadius.circular(40),
                          focusColor: Color.fromARGB(255, 122, 255, 186),
                          style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 15),
                          padding: EdgeInsets.only(left: 10),
                          value: dropdownPlacement,
                          onChanged: (String? value) {
                            setState(() {
                              //dropdownPlacement = placement.first ? value = "Orange" : value = "Rosa";
                              dropdownPlacement = value!;
                            });
                          },
                          items: placement.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(value: value, child:
                            Text(value));
                          }).toList(),
                        )
                    )
                ),
              ],
            ), //CATEGORY BUTTON DROPDOWNBUTTON


            SizedBox(height: 25), //padding

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Antal-kontroller
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Antal", style: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 20, fontWeight: FontWeight.w400)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 70, 70, 70),
                            offset: Offset(0, 0),
                            spreadRadius: 0.005,
                            blurRadius: 6
                          )
                        ]
                      ),
                      child: IconButton( //subtract-knapp
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                          shadowColor: Colors.white,
                        ),
                        icon: Icon(Icons.remove, color: Colors.black),
                        onPressed: () {
                          setState(() {
                            amount = (amount >= 1) ? amount - 1 : 0; //antal kan ej vara negativt tal
                            amount = (amount < 1) ? amount = 1 : amount; //27 maj antal kan ej vara mindre än 1
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 90, 90, 90),
                                spreadRadius: 3,
                                blurRadius: 0,
                                offset: Offset(0, 0)
                            )
                          ]
                      ),
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Color.fromARGB(255, 90, 90, 90)),
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [BoxShadow(color: Colors.black)],
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          child: Text("$amount", style: TextStyle(color: Color.fromARGB(255, 70, 70, 70), fontSize: 25, fontFamily: 'CalSans')),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),

                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 70, 70, 70),
                                offset: Offset(0, 0),
                                spreadRadius: 0.005,
                                blurRadius: 6
                            )
                          ]
                      ),
                      child: IconButton( //add-knapp
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                          shadowColor: Colors.white,
                        ),
                        icon: Icon(Icons.add, color: Colors.black),
                        onPressed: () {
                          setState(() {
                            amount += 1;
                            amount = (amount > 20) ? amount - 20 : amount; //antal kan ej vara mer än 30
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                // Switch-knappar (public och trade)
                Container(
                  width: 200,
                  height: 105,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 40, 40, 40),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Color.fromARGB(255, 44, 44, 44), width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 23, 23, 23),
                        spreadRadius: 4,
                        blurRadius: 8,
                        offset: Offset(0, 6)
                      )
                    ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //SWITCH 1 PUBLIK/PRIVAT
                      Container( //Källhänvisning 'Flutter increase height and width of Switch?' av diegoveloper //stackoverflow.com/questions/52568958/flutter-increase-height-and-width-of-switch hämtad 10 mars 2022, hämtad 8 maj 2025
                        height: 47,
                        width: 108,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 122, 255, 159),
                              spreadRadius: 1.5,
                              blurRadius: 4,
                              offset: Offset(0, 0)
                            )
                          ]
                        ),

                        /*Källhänvisning: 'flutter switch package': Copyright (c) 2020, Nichole John Romero All rights reserved, hämtad via //pub.dev/packages/flutter_switch,
                        publicerad 22 juni 2021, hämtad 9 maj 2025.*/
                        child: FlutterSwitch(
                          value: publicPrivate,
                          duration: Duration(milliseconds: 205),
                          width: 108,
                          height: 47,
                          borderRadius: 50,
                          valueFontSize: 17,
                          activeColor: Color.fromARGB(255, 122, 255, 159),
                          activeText: "Publik",
                          activeTextFontWeight: FontWeight.w400,
                          activeTextColor: Colors.black,
                          inactiveColor: Color.fromARGB(255, 42, 42, 42),
                          inactiveText: "Privat",
                          inactiveTextColor: Colors.white,
                          inactiveTextFontWeight: FontWeight.w400,
                          showOnOff: true,
                          onToggle: (bool value) {
                            setState(() {
                              publicPrivate = value;
                            });
                          },
                        ),
                      ),


                      //SWITCH 2 BYTBAR/EJ BYTBAR
                     /* Container(
                        height: 47,
                        width: 108,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 122, 255, 159),
                                  spreadRadius: 1.5,
                                  blurRadius: 4,
                                  offset: Offset(0, 0)
                              )
                            ]
                        ),
                        child: FlutterSwitch(
                          value: trade,
                          duration: Duration(milliseconds: 205),
                          width: 108,
                          height: 47,
                          borderRadius: 50,
                          valueFontSize: 17,
                          activeColor: const Color.fromARGB(255, 122, 255, 159),
                          activeText: "Bytbar",
                          activeTextFontWeight: FontWeight.w400,
                          activeTextColor: const Color.fromARGB(255, 27, 27, 27),
                          inactiveColor: const Color.fromARGB(255, 42, 42, 42),
                          inactiveText: "Ej bytbar",
                          inactiveTextColor: Colors.white,
                          inactiveTextFontWeight: FontWeight.w400,
                          showOnOff: true,
                          onToggle: (bool value) {
                            setState(() {
                              trade = value;
                            });
                          },
                        ),
                      ), */
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 20), //padding
            //SizedBox(width: 450), //spacing marginal till vänster

            SizedBox(height: 13), //padding

            Row(children: [
              SizedBox(width: 40), //spacing marginal till vänster
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
                      width: 120,
                      child: OutlinedButton(
                        onPressed: () {
                          if (patchNameController.text.isEmpty || klubbmasteriFieldController.text.isEmpty) {
                            // Show your existing warning dialog
                            showDialog(context: context, builder: (BuildContext context) {
                              return AlertDialog(
                                // Your existing dialog code remains the same...
                                  backgroundColor: Colors.white,
                                  content: Container(
                                    width: 350,
                                    height: 200,
                                    child: ListView(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(width: 226),
                                            Container(
                                              width: 38,
                                              height: 38,
                                              child: FloatingActionButton(
                                                  heroTag: "FAB3",
                                                  shape: const CircleBorder(),
                                                  backgroundColor: Color.fromARGB(255, 35, 35, 35),
                                                  elevation: 2,
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Icon(Icons.close, color: Colors.white, size: 18)
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        Row(
                                          children: [
                                            Text("VARNING!", style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'InknutAntiqua', fontWeight: FontWeight.w500)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("\nMärkesnamn-fältet och\nKlubbmästeri-fältet\nfår inte vara tomma.", style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: 'InknutAntiqua')),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                              );
                            });
                          } else {
                            _createPatchWithProvider(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PostLoginPage()));
                          }
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 42, 42, 42),
                            side: BorderSide(width: 1, color: Color.fromARGB(255, 122, 255, 186), strokeAlign: 1)
                        ),
                        child: Text("Spara", style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255), fontFamily: 'InknutAntiqua', fontSize: 16, fontWeight: FontWeight.w400)),
                      )
                  )
              ),
              SizedBox(width: 140), //spacing
              FloatingActionButton(
                  heroTag: "FAB4",
                  backgroundColor: Color.fromARGB(255, 243, 68, 255),
                  shape: const CircleBorder(),
                  hoverColor: Color.fromARGB(255, 139, 166, 255),
                  child: Icon(Icons.delete_outline_rounded, size: 30, color: Colors.white),
                  onPressed: () {
                  }
              ) //Soptunna-knapp action
            ],),
            SizedBox(height: 40),
//Column för Placement, 'Add patch' + papperskorg-icon
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

} //CLASS LAST PARENTES

