//27 maj ändringar

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patchappflutter/add_patch_page.dart';
import 'package:patchappflutter/bottomNavigationBar.dart';
import 'package:patchappflutter/faq_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int currentIndex = 3; //get this info from server
  double _itemExtent = 250;
  final CarouselController _controller = CarouselController();

  final TextEditingController biographyFieldController = TextEditingController();

  @override
  void dispose() { //clean up TextEditorController when leaving widget
    biographyFieldController.dispose();
    super.dispose();
  }

  String biography = '';

  //JSON call to backend,
  //get user profile with all details

  //BACKEND get variable of users overall-color

  //put inside array

  //Källhänvisning _updateCurrentIndex(): Handledning med Donald 22 maj kl 15:00.
  void _updateCurrentIndex() {
    if (_controller.hasClients) {
      final position = _controller.position;
      if (position.hasPixels) {
        final index = (position.pixels / _itemExtent).round();
        setState(() {
          currentIndex = index;
        });
      }
    }
  }

 //ej klar
  File ? _selectedImage;
  List<String> patchImages = ['', '']; //BACKEND lista med användarens alla patches
  List<String> overaller = ['assets/beige.PNG', 'assets/blue2.PNG', 'assets/brightpink.PNG', 'assets/brightred.PNG', 'assets/bubblegumpink.PNG', 'assets/darkblue.PNG', 'assets/darkgreen.PNG', 'assets/darkorange.PNG', 'assets/darkpurple.PNG', 'assets/darkred.PNG', 'assets/forestgreen.PNG', 'assets/grey.PNG',
    'assets/greyblue.PNG', 'assets/lavendel.PNG', 'assets/lightblue.PNG', 'assets/lighterpurple.PNG',
    'assets/lightgreen.PNG', 'assets/lightgrey.PNG', 'assets/lightpink.PNG', 'assets/limegreen.PNG', 'assets/orange.PNG', 'assets/purple.PNG', 'assets/rose.PNG', 'assets/royalblue.PNG', 'assets/sunorange.PNG', 'assets/washedpurple.PNG', 'assets/white.PNG', 'assets/yellow.PNG', 'assets/greybox_error_fix.PNG']; //24 Maj error fixade att man kan välja gul overall


  void initState() { //Kodrad lösning för att hämta första entry i list: källhänvisning: 'The instance member 'widget' can't be accessed in an initializer. Try replacing the reference to the instance member with a different expression', stackoverflow.com/questions/67501594/the-instance-member-widget-cant-be-accessed-in-an-initializer-try-replacing, av user 'MobIT', publicerad 12 maj 2021, hämtad 21 maj 2025
    super.initState();
    _controller.addListener(_updateCurrentIndex); //Källhänvisning _updateCurrentIndex(): Handledning med Donald 22 maj kl 15:00.
  }

@override
Widget build(BuildContext context) {
  var screenSize = MediaQuery.of(context).size; //screensize
  String userName = 'UserName here';
  bool clicked = false; //for changing overall colour

  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 31, 31, 31),
    //bottomNavigationBar: CustomBottomNavigationBar(),
    body: Scrollbar(
      //padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
      child: ListView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(0),
        children: [
          Column(
            children: [
              SizedBox(height: 65),

              Row(
                children: [
                  SizedBox(width: 30),

                  //SPARA-knapp
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green,
                          spreadRadius: 3,
                          blurRadius: 0,
                          offset: Offset(0, 0)
                        )
                      ]
                    ),
                    child: FloatingActionButton( //TODO: kolla om dessa inte längre behövs (pga onChanged() användning i textField).
                      shape: const CircleBorder(),
                      foregroundColor: Colors.white,
                        backgroundColor: Color.fromARGB(255, 167, 232, 170),
                        child: Icon(Icons.save_rounded, size: 26, color: Color.fromARGB(
                            255, 75, 161, 79)),
                        onPressed: () { //input text hantering
                                }
                              )
                          ),

                  SizedBox(width: 260),
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 140, 140, 140),
                          blurRadius: 0,
                          spreadRadius: 4
                        )
                      ]
                    ),
                    child: FloatingActionButton(
                      shape: const CircleBorder(),
                      onPressed: () {
                        showDialog(context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                surfaceTintColor: Colors.white, //bli av med default färgen
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                                contentTextStyle: TextStyle(color: Colors.black, fontSize: 15, fontFamily: 'InknutAntiqua'),
                               // title: Text("hello"),
                                //titlePadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                  content:
                                      SizedBox(
                                        height: 350,
                                        width: 360,
                                        child: ListView(
                                          children: [
                                              Container(
                                                color: Colors.white,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children :[
                                                      Text("Ändra färg på overallen:", style: TextStyle(fontWeight: FontWeight.w600))
                                                        ],
                                                       ),
                                                    Row(
                                                      children: [
                                                        Text("Du kan ändra färg på din overall genom att\nscrolla fram i den horisontella menyn\ntill den overallfärg du önskar byta till.",
                                                            style: TextStyle(fontSize: 11, height: 2)),
                                                      ],
                                                    ),
                                                    SizedBox(height: 8), //padding
                                                    Row(
                                                      children: [
                                                        Text("Lägg till profilbild:", style: TextStyle(fontWeight: FontWeight.w600)),
                                                      ]
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("Lägg till en profilbild genom att klicka på\nnågon av de gula knapparna, på antingen\nkamera-knappen och ta en bild, eller\ngalleri-knappen och ladda upp en bild.",
                                                        style: TextStyle(fontSize: 11, height: 2))
                                                      ],
                                                    ),
                                                    SizedBox(height: 8), //padding
                                                    Row(
                                                        children: [
                                                          Text("Din märkessamling:", style: TextStyle(fontWeight: FontWeight.w600)),
                                                        ]
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("I Din Märkessamling kan du se dina\nnuvarande klubbmästerimärken. Klicka på\nnågot av dem för att komma till dess sida.",
                                                            style: TextStyle(fontSize: 11, height: 2))
                                                      ],
                                                    ),

                                                    SizedBox(height: 20),

                                                    Text("Fler frågor?", style: TextStyle(color: Colors.black, fontSize: 15, fontFamily: 'InknutAntiqua')),

                                                    Container(
                                                      width: 190,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(30),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Color.fromARGB(
                                                                255, 255, 246,
                                                                144),
                                                            spreadRadius: 2,
                                                            blurRadius: 0,
                                                            offset: Offset(0, 3)
                                                          )
                                                        ]
                                                      ),
                                                      child: TextButton(
                                                        style: TextButton.styleFrom(
                                                          overlayColor: Colors.white,
                                                          backgroundColor: Color.fromARGB(255, 255, 237, 70)
                                                        ),
                                                        onPressed: () {
                                                          Navigator.push(context, MaterialPageRoute(builder: (context) => FAQPage()));
                                                        },
                                                        child: Text("Vanliga frågor", style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 12))
                                                      ),
                                                    ),

                                                    SizedBox(height: 10)
                                                  ],
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                              );
                            }
                        );
                      },
                      child: Icon(Icons.question_mark_rounded, size: 20, color: Colors.black)
                    ),
                  )
                ],
              ),

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
                              color: Colors.yellow,
                              offset: Offset(0, 0.5),
                              spreadRadius: 3,
                              blurRadius: 0
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

                  SizedBox(width: 20),

                  //PROFILBILD CIRCLEAVATAR
                  Container(
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow( //Skugga
                          color: Colors.black,
                          spreadRadius: 6,
                          blurRadius: 6,
                          offset: Offset(1, 1)
                        ),
                      ]
                    ),
                    child: Container(
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow( //Rosa border
                            color: Color.fromARGB(255, 226, 93, 246),
                            spreadRadius: 4,
                            blurRadius: 0,
                            offset: Offset(0, 0.5)
                          )
                        ]
                      )
                      ,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                          child: Icon(Icons.add, color: Colors.black, size: 30),
                          foregroundImage: _selectedImage != null ? FileImage(_selectedImage!) : null),
                    ),
                  ), //Kodrad Källhänvisning: youtu.be/qYCsxvbPDC8?si=QmZC_OoY8unh9ZRS, 'Flutter Image Picker & Cropper From Camera & Gallery | Learn Flutter Fast', av kanalen Marcus Ng, publicerad 11 november 2022, hämtad 19 maj 2025.

                  SizedBox(width: 20),

                  Padding(padding: EdgeInsets.all(0),
                    child: Container( //LÄGGA TILL PROFILBILD VIA GALLERI KNAPP
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.yellow,
                            offset: Offset(0, 0.5),
                            spreadRadius: 3,
                            blurRadius: 0
                          )
                        ]
                      ),
                      child: FloatingActionButton(
                        shape: const CircleBorder(),
                      onPressed: () {
                          _pickImageFromGallery();
                      },
                      child: Icon(Icons.add_photo_alternate_sharp, color: Colors.black, size: 20)),
                    ),
                  )
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.zero,
                      //child: (clicked == true) ? Image.asset(overaller.elementAt(i)) : Image.asset('assets/white.PNG', width: 280, height: 280),
                      child: Image.asset(overaller.elementAt(currentIndex), width: 280, height: 280)
                      ),
                  //),
                ],
              ),

              SizedBox(
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("$userName", style: TextStyle(color: Colors.white, fontSize: 25, fontFamily: 'InknutAntiqua')),
                  ],
                ),
              ),

              SizedBox(height: 20),

              //BIOGRAFI-BOX
              Row( //Biografi-rubrik
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 28), //spacing padding
                    Text("Biografi", style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: ('InknutAntiqua'), fontWeight: FontWeight.w400)),
                    SizedBox(width: 4), //spacing between text and icon
                    //Icon(Icons.border_color_sharp, size: 20),
                  ]),
              SizedBox(height: 10), //padding
              SizedBox(width: 340), //padding marginal till vänster

              //INPUTFIELD BIOGRAFI
              Row(
                children: [
                  SizedBox(width: 25),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                          BoxShadow( //Skugga
                              color: Color.fromARGB(255, 20, 20, 20),
                              spreadRadius: 4,
                              blurRadius: 7,
                              offset: Offset(10, 7)
                          ),
                      ]
                    ),
                    child: Container( //Beskrivning box
                        height: 90,
                        width: 330,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 122, 255, 186),
                                  spreadRadius: 1.2,
                                  blurRadius: 0,
                                  offset: Offset(7.5, 5)
                              )
                            ]
                        ),
                        //padding: EdgeInsets.symmetric(horizontal: 80),
                        //child: Text("History about your patch... lorem ipsum \nhejhejhej" , textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontFamily: ('HappyMonkey'), fontSize: 14)),
                        child: TextFormField(
                          style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 14),
                          obscureText: false,
                          cursorColor: const Color.fromARGB(255, 88, 166, 255),
                          cursorHeight: 22,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.multiline, //tillåt enter flera rader
                          maxLines: 4,
                          maxLength: 250,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          onChanged: (value) => biography = biographyFieldController.text, //Källhänvisning www.geeksforgeeks.org/retrieve-data-from-textfields-in-flutter/ publicerad 7 mars 2025, hämtad 25 maj 2025

                          scrollPadding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          decoration: InputDecoration(
                              counterStyle: TextStyle(fontFamily: 'InknutAntiqua', color: Colors.black, fontSize: 14, height: 2),
                              //labelText: 'History about your patch:',
                              contentPadding: EdgeInsets.fromLTRB(0, 15, 10, 20),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none
                              ),
                            )
                        ),
                  ),
                    ],
                  ),

              SizedBox(height: 32),

              Container( //KM NAME INFO BOX //BACKEND
                height: 50,
                width: 265,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color.fromARGB(255, 60, 60, 60), width: 2.5),
                    color: Color.fromARGB(255, 40, 40, 40),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 15, 15, 15),
                          spreadRadius: 3,
                          blurRadius: 8,
                          offset: Offset(0, 0)
                      )
                    ]
                ),
                alignment: Alignment.center,
                child: Text('var kmName here', style: TextStyle(color: Color.fromARGB(255, 210, 210, 210), fontSize: 16, fontFamily: 'InknutAntiqua')), //BACKEND userName-värde
              ),

              SizedBox(height: 15),

              Container( //UNIVERSITY NAME INFO BOX //BACKEND
                height: 50,
                width: 265,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color.fromARGB(255, 60,60, 60), width: 2.5),
                    color: Color.fromARGB(255, 40, 40, 40),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 15, 15, 15),
                          spreadRadius: 3,
                          blurRadius: 8,
                          offset: Offset(0, 0)
                      )
                    ]
                ),
                alignment: Alignment.center,
                child: Text('var university here', style: TextStyle(color: Color.fromARGB(255, 210, 210, 210), fontSize: 16, fontFamily: 'InknutAntiqua')), //BACKEND userName-värde
              ),

              SizedBox(height: 30),

              Row(
                children: [
                  SizedBox(width: 28),
                  Text("Välj färg på overall", style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'InknutAntiqua'))
                ],
              ),

              SizedBox(height: 15),

              //CAROUSEL MENU

              Column(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 39, 39, 39),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 20, 20, 20),
                            spreadRadius: 3,
                            blurRadius: 8,
                            offset: Offset(0.5, 4)
                        )
                      ]
                    ),
                    //width: 200,

                    //Källhänvisning:  'Flutter Release 3.24 | New CarouselView Tutorial' av kanalen CodeX, youtu.be/Nnxg-Jhhk6M?si=NQKtamBo3KXuZk3C publicerad 8 augusti 2024, hämtad 21 maj 2025
                    //Källhänvisning _updateCurrentIndex(): Handledning med Donald 22 maj kl 15:00.
                      child: CarouselView( //PLAN B make it CarouselView.weighted instead
                          padding: EdgeInsets.only(top: 13),
                          //overlayColor: WidgetStateColor.fromMap(),
                          controller: _controller,//sätta till aktuell ovve-färg,
                          itemExtent: _itemExtent, //width of element in carousel
                          itemSnapping: true,
                          enableSplash: false,
                          scrollDirection: Axis.horizontal,
                          children: List.generate(overaller.length, (int index) {
                            return Container(
                              color: const Color.fromARGB(255, 39, 39, 39), //bakgrund: 31, borde vara transparent
                              child: Image.asset( //Kodrad källhänvisning: 'Flutter Carousel with Smooth Animation & Navigation!', youtu.be/BTXTkQDNbSQ?si=MOcevsPnXjORAOeN av kanalen Mobile Programmer publicerad 3 mars 2025, hämtad 21 maj 2025
                                overaller[index],
                              ),
                            );
                          }
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 35),

              Container(
                width: 203,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 18, 18, 18),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(0, 2)
                    )
                  ]
                ),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 40, 40, 40),
                    side: BorderSide(color: Color.fromARGB(255, 226, 93, 246), width: 2),
                  ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PatchViewPage()));
                    },
                    child: Text("Lägg till ett märke", style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'InknutAntiqua'))
                ),
              ),

              SizedBox(height: 35), //padding

              Row(
                children: [
                  SizedBox(width: 30),
                  Text("Din märkessamling", style: TextStyle(color: Colors.white, fontSize: 25, fontFamily: 'InknutAntiqua')),
                  SizedBox(width: 65), //padding between 'Collection' and 'Filter' button
                ],
              ),

              SizedBox(height: 50),
              SizedBox(height: 320),

              Text("hejhejhejhej", style: TextStyle(color: Colors.white, fontSize: 30, fontFamily: 'InknutAntiqua')),


          /*   Expanded(
                 child:
                 GridView.builder(
                   itemCount: patchImages.length,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                      itemBuilder: (BuildContext ProfilePage, int index) {
                      return CircleAvatar(
                        backgroundColor: Colors.white,
                         foregroundImage: Image.network(src),
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