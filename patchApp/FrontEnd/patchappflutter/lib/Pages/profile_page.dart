//27 maj ändringar

//test igen 00:52

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patchappflutter/Pages/add_patch_page.dart';
import 'package:patchappflutter/Pages/bottomNavigationBar.dart';
import 'package:patchappflutter/Pages/faq_page.dart';
import 'package:patchappflutter/Pages/patch_inventory_page.dart';
import 'package:patchappflutter/Pages/search_page.dart';
import 'package:patchappflutter/global_user_info.dart';
import 'package:patchappflutter/Pages/store_patches.dart';
import 'package:patchappflutter/Model/patch_model.dart';
import 'package:patchappflutter/Provider/user_provider.dart';
import 'package:patchappflutter/Provider/Patch_Provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:patchappflutter/Model/patch_model.dart';
import 'package:patchappflutter/Model/user_model.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import '../Provider/Patch_Provider.dart';
import '../Provider/user_provider.dart';

const String apiKey = 'J4Mhmg9sFFHmuKw7tmzaQg==D9qZtXhRG3nTiOB9';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required UserModel? user});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

void showDrinkInputDialog(BuildContext context) {
  final TextEditingController _drinkNameController = TextEditingController();

  // State variables inside the dialog
  List<String> ingredients = [];
  String instructions = '';
  String drinkName = '';
  bool isLoading = false;
  String errorMessage = '';

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          Future<void> fetchDrinkDetails(String name) async {
            setState(() {
              isLoading = true;
              ingredients = [];
              instructions = '';
              drinkName = '';
              errorMessage = '';
            });

            try {
              final response = await http.get(
                Uri.parse('https://api.api-ninjas.com/v1/cocktail?name=$name'),
                headers: {
                  'X-Api-Key': 'J4Mhmg9sFFHmuKw7tmzaQg==D9qZtXhRG3nTiOB9',
                  'accept': 'application/json',
                },
              );

              if (response.statusCode == 200) {
                final List<dynamic> data = jsonDecode(response.body);

                if (data.isEmpty) {
                  setState(() {
                    errorMessage = 'No drinks found.';
                  });
                } else {
                  final drink = data[0];
                  setState(() {
                    drinkName = drink['name'] ?? 'Unnamed Drink';
                    ingredients = List<String>.from(drink['ingredients'] ?? []);
                    instructions =
                        drink['instructions'] ?? 'No instructions available.';
                  });
                }
              } else {
                setState(() {
                  errorMessage = 'Failed to load data.';
                });
              }
            } catch (e) {
              setState(() {
                errorMessage = 'Error: $e';
              });
            } finally {
              setState(() {
                isLoading = false;
              });
            }
          }

          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            content: SizedBox(
              height: 550,
              width: 550,
              child: ListView(
                padding: EdgeInsets.all(25),
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(30),
                        width: 400,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 30, 30, 30),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Enter Drink Name",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontFamily: 'InknutAntiqua',
                              ),
                            ),
                            SizedBox(height: 20),
                            Center(
                              child: Container(
                                width: 170,
                                height: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.purpleAccent,
                                      Color.fromARGB(255, 255, 121, 12),
                                      Color.fromARGB(255, 83, 254, 106),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.bottomRight,
                                    stops: [0.009, 0.5, 1.06],
                                  ),
                                ),
                                child: SizedBox(
                                  width: 190,
                                  height: 48,
                                  child: TextField(
                                    cursorHeight: 22,
                                    cursorColor: Colors.white,
                                    controller: _drinkNameController,
                                    maxLength: 60,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    decoration: InputDecoration(
                                      labelText: 'Drink Name',
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      counterText: "",
                                      //göm counter-texten
                                      contentPadding: EdgeInsets.only(
                                        top: 10,
                                        left: 15,
                                        bottom: 10,
                                        right: 15,
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'InknutAntiqua',
                                        fontSize: 15,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                          color: Colors.purpleAccent,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'InknutAntiqua',
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 20),

                            Center(
                              child: Container(
                                width: 180,
                                height: 42,
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.fromARGB(
                                      255,
                                      255,
                                      255,
                                      255,
                                    ),
                                    overlayColor: Colors.white,
                                  ),
                                  onPressed: () {
                                    final input =
                                        _drinkNameController.text.trim();
                                    if (input.isNotEmpty) {
                                      fetchDrinkDetails(input);
                                    }
                                  },
                                  child: Text(
                                    "Get recipe",
                                    style: TextStyle(
                                      fontFamily: 'InknutAntiqua',
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 20),

                            if (isLoading)
                              Center(child: CircularProgressIndicator()),
                            if (errorMessage.isNotEmpty)
                              Center(
                                child: Text(
                                  errorMessage,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'InknutAntiqua',
                                    fontSize: 14,
                                  ),
                                ),
                              ),

                            if (drinkName.isNotEmpty)
                              Text(
                                'Name: $drinkName',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontFamily: 'InknutAntiqua',
                                  color: Colors.white,
                                ),
                              ),

                            if (ingredients.isNotEmpty) ...[
                              SizedBox(height: 10),
                              Text(
                                'Ingredients:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'InknutAntiqua',
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              ...ingredients.map(
                                (ing) => Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "• $ing",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'InknutAntiqua',
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],

                            if (instructions.isNotEmpty) ...[
                              SizedBox(height: 10),
                              Text(
                                'Instructions:',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'InknutAntiqua',
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  instructions,
                                  style: TextStyle(
                                    fontFamily: 'InknutAntiqua',
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],

                            SizedBox(height: 30),

                            Center(
                              child: Container(
                                width: 135,
                                height: 40,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Color.fromARGB(
                                      255,
                                      30,
                                      30,
                                      30,
                                    ),
                                    side: BorderSide(
                                      color: Colors.purpleAccent,
                                      width: 1,
                                    ),
                                  ),
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text(
                                    "Close",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'InknutAntiqua',
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

class _ProfilePageState extends State<ProfilePage> {
  int currentIndex = 3; //get this info from server
  double _itemExtent = 250;
  final CarouselController _controller = CarouselController();
  final TextEditingController biographyFieldController =
      TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    //clean up TextEditorController when leaving widget
    biographyFieldController.dispose();
    super.dispose();
  }

  String biography = '';
  int? Id = GlobalUserInfo.id;
  String getUrl =
      'https://group-4-15.pvt.dsv.su.se/api/patch/user/' +
      GlobalUserInfo.id
          .toString(); //Källhänvisning: DISK handledning 29 maj kl 15
  List<Uint8List> images = [];
  List<File> imageFiles = [];

  /////////////////////////// /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false).setCompleteName();
    currentIndex = Provider.of<UserProvider>(context, listen: false).ovveIndex;
    biography = Provider.of<UserProvider>(context, listen: false).biography;
    int id = GlobalUserInfo.id ?? 0;
    Provider.of<PatchProvider>(context, listen: false).fetchUserPatchImages(id);
    images = Provider.of<PatchProvider>(context, listen: false).userPatchImages;
    imageFiles = uint8ListToFile(images);
    _controller.addListener(_updateCurrentIndex);
    int tempId = GlobalUserInfo.id ?? 0;
    Provider.of<PatchProvider>(
      context,
      listen: false,
    ).fetchUserPatchImages(tempId);
    images = Provider.of<PatchProvider>(context, listen: false).userPatchImages;

    super.initState();
  }

  //Källhänvisning: Handledning med Donald via mail 28 maj.
  Future<void> fetchImageList(int userId) async {
    /*final response = await authHttpRequest(
      context: ProfilePage,
      url: getUrl,
      method: 'GET',
    );

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);

      print("Fetched ${json.length} patches for user $userId");

      if (json.isNotEmpty) {
        print("Example patch object: ${json[0]}");
      }

      setState(() {
        userPatchesImages = json.map<Uint8List?>((jsonPatchObject) {
          return PatchModel.fromJson(jsonPatchObject).pictureData;
        }).toList();
      });
    } else {
      print("Some error happened, bad userid maybe, statusCode=${response.statusCode}");
    }*/
  }

  authHttpRequest({
    required Type context,
    required String url,
    required String method,
  }) {
    //Skapad, autogenererad, utifrån röd-lampa knapp i IntelliJ, denna metod ville flutter ha annars rött meddelande vid authHttpRequest
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //put inside array

  //Källhänvisning _updateCurrentIndex(): Handledning med Donald 22 maj kl 15:00.
  void _updateCurrentIndex() {
    if (_controller.hasClients) {
      final position = _controller.position;
      if (position.hasPixels) {
        final index = (position.pixels / _itemExtent).round();
        setState(() {
          Provider.of<UserProvider>(
            context,
            listen: false,
          ).changeOvveIndex(newOvveIndex: index);
          currentIndex =
              Provider.of<UserProvider>(context, listen: false).ovveIndex;
          int id = GlobalUserInfo.id ?? 0;
          Provider.of<PatchProvider>(
            context,
            listen: false,
          ).fetchUserPatchImages(id);
          images =
              Provider.of<PatchProvider>(
                context,
                listen: false,
              ).userPatchImages;
        });
      }
    }
  }

  File? _selectedImage;
  List<String> overaller = [
    'assets/beige.PNG',
    'assets/blue2.PNG',
    'assets/brightpink.PNG',
    'assets/brightred.PNG',
    'assets/bubblegumpink.PNG',
    'assets/darkblue.PNG',
    'assets/darkgreen.PNG',
    'assets/darkorange.PNG',
    'assets/darkpurple.PNG',
    'assets/darkred.PNG',
    'assets/forestgreen.PNG',
    'assets/grey.PNG',
    'assets/greyblue.PNG',
    'assets/lavendel.PNG',
    'assets/lightblue.PNG',
    'assets/lighterpurple.PNG',

    'assets/lightgreen.PNG',
    'assets/lightgrey.PNG',
    'assets/lightpink.PNG',
    'assets/limegreen.PNG',
    'assets/orange.PNG',
    'assets/purple.PNG',
    'assets/rose.PNG',
    'assets/royalblue.PNG',
    'assets/sunorange.PNG',
    'assets/washedpurple.PNG',
    'assets/white.PNG',
    'assets/yellow.PNG',
    'assets/greybox_error_fix.PNG',
  ]; //24 Maj error fixade att man kan välja gul overall

  //get imageGridList => fetchImageList.

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size; //screensize
    bool clicked = false; //for changing overall colour
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final patchProvider = Provider.of<PatchProvider>(context, listen: false);

    //_updatePatchList();
    String userName = GlobalUserInfo.completeName;

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
                SizedBox(height: 45),

                Row(
                  children: [
                    SizedBox(width: 28),

                    //DRINK-KNAPP
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.3, 0.7, 0.9],
                          colors: [
                            Colors.purpleAccent,
                            Color.fromARGB(255, 255, 121, 12),
                            Color.fromARGB(255, 83, 254, 106),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purpleAccent,
                            blurRadius: 0,
                            spreadRadius: 4,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {
                          showDrinkInputDialog(context);
                        },
                        icon: Image.asset('assets/drinkglass4_drinkAPI.png'),
                      ),
                    ),

                    SizedBox(width: 185),

                    //SPARA-knapp
                    Container(
                      width: 39,
                      height: 39,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green,
                            spreadRadius: 4,
                            blurRadius: 0,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: FloatingActionButton(
                        //TODO: kolla om dessa inte längre behövs (pga onChanged() användning i textField).
                        heroTag: "FAB8",
                        shape: const CircleBorder(),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.white,
                        tooltip: "Spara ändringar",
                        child: Icon(
                          Icons.save_rounded,
                          size: 26,
                          color: Color.fromARGB(255, 75, 161, 79),
                        ),
                        onPressed: () {
                          //input text hantering
                        },
                      ),
                    ),

                    SizedBox(width: 18),
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 140, 140, 140),
                            blurRadius: 0,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      child: FloatingActionButton(
                        heroTag: "FAB9",
                        shape: const CircleBorder(),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                surfaceTintColor: Colors.white,
                                //bli av med default färgen
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                contentTextStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'InknutAntiqua',
                                ),
                                // title: Text("hello"),
                                //titlePadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                content: SizedBox(
                                  height: 350,
                                  width: 360,
                                  child: ListView(
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Ändra färg på overallen:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Du kan ändra färg på din overall genom att\nscrolla fram i den horisontella menyn\ntill den overallfärg du önskar byta till.",
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    height: 2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            //padding
                                            Row(
                                              children: [
                                                Text(
                                                  "Lägg till profilbild:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Lägg till en profilbild genom att klicka på\nnågon av de gula knapparna, på antingen\nkamera-knappen och ta en bild, eller\ngalleri-knappen och ladda upp en bild.",
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    height: 2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            //padding
                                            Row(
                                              children: [
                                                Text(
                                                  "Din märkessamling:",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "I Din Märkessamling kan du se dina\nnuvarande klubbmästerimärken. Klicka på\nnågot av dem för att komma till dess sida.",
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    height: 2,
                                                  ),
                                                ),
                                              ],
                                            ),

                                            SizedBox(height: 20),

                                            Text(
                                              "Fler frågor?",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontFamily: 'InknutAntiqua',
                                              ),
                                            ),

                                            Container(
                                              width: 190,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color.fromARGB(
                                                      255,
                                                      255,
                                                      246,
                                                      144,
                                                    ),
                                                    spreadRadius: 2,
                                                    blurRadius: 0,
                                                    offset: Offset(0, 3),
                                                  ),
                                                ],
                                              ),
                                              child: TextButton(
                                                style: TextButton.styleFrom(
                                                  overlayColor: Colors.white,
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                        255,
                                                        255,
                                                        237,
                                                        70,
                                                      ),
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                              FAQPage(),
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                  "Vanliga frågor",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'InknutAntiqua',
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ),

                                            SizedBox(height: 10),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Icon(
                          Icons.question_mark_rounded,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 12),

                //RAD PROFILBILD + 2 RUNDA KNAPPAR
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      //LÄGGA TILL PROFILBILD KNAPP
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
                            blurRadius: 0,
                          ),
                        ],
                      ),
                      child: FloatingActionButton(
                        heroTag: "FAB10",
                        shape: const CircleBorder(),
                        onPressed: () {
                          _pickImageFromCamera();
                        },
                        child: Icon(
                          Icons.add_a_photo_sharp,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),

                    SizedBox(width: 20),

                    //PROFILBILD CIRCLEAVATAR
                    Container(
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            //Skugga
                            color: Colors.black,
                            spreadRadius: 6,
                            blurRadius: 6,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                      child: Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              //Rosa border
                              color: Color.fromARGB(255, 226, 93, 246),
                              spreadRadius: 4,
                              blurRadius: 0,
                              offset: Offset(0, 0.5),
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.add, color: Colors.black, size: 30),
                          foregroundImage:
                              _selectedImage != null
                                  ? FileImage(_selectedImage!)
                                  : null,
                        ),
                      ),
                    ),

                    //Kodrad Källhänvisning: youtu.be/qYCsxvbPDC8?si=QmZC_OoY8unh9ZRS, 'Flutter Image Picker & Cropper From Camera & Gallery | Learn Flutter Fast', av kanalen Marcus Ng, publicerad 11 november 2022, hämtad 19 maj 2025.
                    SizedBox(width: 20),

                    Padding(
                      padding: EdgeInsets.all(0),
                      child: Container(
                        //LÄGGA TILL PROFILBILD VIA GALLERI KNAPP
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
                              blurRadius: 0,
                            ),
                          ],
                        ),
                        child: FloatingActionButton(
                          heroTag: "FAB11",
                          shape: const CircleBorder(),
                          onPressed: () {
                            _pickImageFromGallery();
                          },
                          child: Icon(
                            Icons.add_photo_alternate_sharp,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      //child: (clicked == true) ? Image.asset(overaller.elementAt(i)) : Image.asset('assets/white.PNG', width: 280, height: 280),
                      child: Image.asset(
                        overaller.elementAt(currentIndex),
                        width: 280,
                        height: 280,
                      ),
                    ),
                    //),
                  ],
                ),

                SizedBox(
                  height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$userName",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'InknutAntiqua',
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                //BIOGRAFI-BOX
                Row(
                  //Biografi-rubrik
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 28), //spacing padding
                    Text(
                      "Biografi",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: ('InknutAntiqua'),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 4), //spacing between text and icon
                    //Icon(Icons.border_color_sharp, size: 20),
                  ],
                ),
                SizedBox(height: 10),
                //padding
                SizedBox(width: 340),
                //padding marginal till vänster

                //INPUTFIELD BIOGRAFI
                Row(
                  children: [
                    SizedBox(width: 25),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            //Skugga
                            color: Color.fromARGB(255, 20, 20, 20),
                            spreadRadius: 4,
                            blurRadius: 7,
                            offset: Offset(10, 7),
                          ),
                        ],
                      ),
                      child: Container(
                        //Beskrivning box
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
                              offset: Offset(7.5, 5),
                            ),
                          ],
                        ),
                        //padding: EdgeInsets.symmetric(horizontal: 80),
                        //child: Text("History about your patch... lorem ipsum \nhejhejhej" , textAlign: TextAlign.left, style: TextStyle(color: Colors.black, fontFamily: ('HappyMonkey'), fontSize: 14)),
                        child: TextFormField(
                          initialValue: GlobalUserInfo.biography,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'InknutAntiqua',
                            fontSize: 14,
                          ),
                          obscureText: false,
                          cursorColor: const Color.fromARGB(255, 88, 166, 255),
                          cursorHeight: 22,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.multiline,
                          //tillåt enter flera rader
                          maxLines: 4,
                          maxLength: 250,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          onChanged:
                              (value) =>
                                  biography = biographyFieldController.text,

                          //Källhänvisning www.geeksforgeeks.org/retrieve-data-from-textfields-in-flutter/ publicerad 7 mars 2025, hämtad 25 maj 2025
                          scrollPadding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          decoration: InputDecoration(
                            counterStyle: TextStyle(
                              fontFamily: 'InknutAntiqua',
                              color: Colors.black,
                              fontSize: 14,
                              height: 2,
                            ),
                            //labelText: 'History about your patch:',
                            contentPadding: EdgeInsets.fromLTRB(0, 15, 10, 20),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 32),

                Container(
                  //KM NAME INFO BOX //BACKEND
                  height: 50,
                  width: 265,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Color.fromARGB(255, 60, 60, 60),
                      width: 2.5,
                    ),
                    color: Color.fromARGB(255, 40, 40, 40),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 15, 15, 15),
                        spreadRadius: 3,
                        blurRadius: 8,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    GlobalUserInfo.kmName,
                    style: TextStyle(
                      color: Color.fromARGB(255, 210, 210, 210),
                      fontSize: 16,
                      fontFamily: 'InknutAntiqua',
                    ),
                  ), //BACKEND userName-värde
                ),

                SizedBox(height: 15),

                Container(
                  //UNIVERSITY NAME INFO BOX //BACKEND
                  height: 50,
                  width: 265,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Color.fromARGB(255, 60, 60, 60),
                      width: 2.5,
                    ),
                    color: Color.fromARGB(255, 40, 40, 40),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 15, 15, 15),
                        spreadRadius: 3,
                        blurRadius: 8,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    GlobalUserInfo.university,
                    style: TextStyle(
                      color: Color.fromARGB(255, 210, 210, 210),
                      fontSize: 16,
                      fontFamily: 'InknutAntiqua',
                    ),
                  ), //BACKEND userName-värde
                ),

                SizedBox(height: 30),

                Row(
                  children: [
                    SizedBox(width: 28),
                    Text(
                      "Välj färg på overall",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'InknutAntiqua',
                      ),
                    ),
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
                            offset: Offset(0.5, 4),
                          ),
                        ],
                      ),
                      //width: 200,

                      //Källhänvisning:  'Flutter Release 3.24 | New CarouselView Tutorial' av kanalen CodeX, youtu.be/Nnxg-Jhhk6M?si=NQKtamBo3KXuZk3C publicerad 8 augusti 2024, hämtad 21 maj 2025
                      //Källhänvisning _updateCurrentIndex(): Handledning med Donald 22 maj kl 15:00.
                      child: CarouselView(
                        //PLAN B make it CarouselView.weighted instead
                        padding: EdgeInsets.only(top: 13),
                        //overlayColor: WidgetStateColor.fromMap(),
                        controller: _controller,
                        //sätta till aktuell ovve-färg,
                        itemExtent: _itemExtent,
                        //width of element in carousel
                        itemSnapping: true,
                        enableSplash: false,
                        scrollDirection: Axis.horizontal,
                        children: List.generate(overaller.length, (int index) {
                          return Container(
                            color: const Color.fromARGB(255, 39, 39, 39),
                            //bakgrund: 31, borde vara transparent
                            child: Image.asset(
                              //Kodrad källhänvisning: 'Flutter Carousel with Smooth Animation & Navigation!', youtu.be/BTXTkQDNbSQ?si=MOcevsPnXjORAOeN av kanalen Mobile Programmer publicerad 3 mars 2025, hämtad 21 maj 2025
                              overaller[index],
                            ),
                          );
                        }),
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
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 40, 40, 40),
                      side: BorderSide(
                        color: Color.fromARGB(255, 226, 93, 246),
                        width: 2,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PatchViewPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Lägg till ett märke",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'InknutAntiqua',
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 35),

                //padding
                Row(
                  children: [
                    SizedBox(width: 30),
                    Text(
                      "Din märkessamling",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'InknutAntiqua',
                      ),
                    ),
                    SizedBox(width: 65),

                    //padding between 'Collection' and 'Filter' button
                  ],
                ),

                // SizedBox(height: 50),
                // SizedBox(height: 320),
                SizedBox(height: 20),
                /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                //Källhänvisning: 'GridView in flutter with network image', //youtu.be/dx3gj5hz6HU?si=wjKTv8aTdT_EFeDV, av Youtube-kanalen 'Lets Code That', publicerad 7 januari 2019, hämtad 27 maj 2025.
                GridView.builder(
                  physics: ClampingScrollPhysics(),
                  //löste problemet med att GridView fastnade vid scrolling
                  shrinkWrap: true,
                  padding: EdgeInsets.all(20),
                  primary: true,
                  //itemCount: patchProvider.fetchUserPatchImages(Id),
                  itemCount: images.length,
                  //namnPåLista.length user
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    if (images.isNotEmpty) {
                      return Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: Color.fromARGB(255, 40, 40, 40),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 3,
                                blurRadius: 15,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 20,
                            foregroundImage: MemoryImage(
                              images[index],
                            ), //1 juni ändrat till index. Handledning med Donald via mail 28 maj, DISK handledning 29 maj kl 15
                          ),
                        ),

                      );

                    } else {
                      return Text(
                        "Failed!",
                        style: TextStyle(color: Colors.red, fontSize: 30),
                      );
                    }

                  },
                ),
                ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              ], //CHILDREN MAIN COLUMN
            ),
          ],
        ),
      ),
    );
  }

  //Kamera-galleri eller kamera
  Future _pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }

  Future _pickImageFromCamera() async {
    final returnedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }

  List<File> uint8ListToFile(List<Uint8List> imageData) {
    List<File> imageList = [];
    for (Uint8List e in imageData) {
      File image = File.fromRawPath((e));
      imageList.add(image);
    }
    return imageList;
  }
} //Class ProfilePage
