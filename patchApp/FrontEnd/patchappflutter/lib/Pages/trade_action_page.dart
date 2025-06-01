//NYTT FÖRSÖK NY BRANCH

//Denna fil använder kod från källa Youtube-video youtu.be/vwSY5Q-mVMs?si=9jipUg8rNTfF9PAs, 'Flutter Tutorial - Image Picker From Gallery & Camera' av kanalen Flutter Guys,
//publicerad 9 juli 2023, hämtad 18 maj 2025. Samt i kodrad 35 i pubspec.yaml för dependencies.


//Denna fil använder kod från källa Youtube-video 'Flutter Image Picker & Cropper From Camera & Gallery | Learn Flutter Fast',
// youtu.be/qYCsxvbPDC8?si=1U4WiVS3sKaa-Usd av kanalen Marcus Ng på Youtube publicerad 11 november 2022, hämtad 2025-05-17.
//Även filen i path ios/Flutter/Info.plist kodrad 48 och 49 är kod hämtad från samma källa, samt dependencies i pubspec.yaml*/

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:patchappflutter/Pages/choose_patch_to_trade.dart';
import 'package:patchappflutter/Pages/profile_page.dart';
import 'package:patchappflutter/Pages/search_page.dart';
import 'package:patchappflutter/Pages/trade_request_success_page.dart';

import '../Model/user_model.dart';
import '../global_user_info.dart';

//25  maj
class TradeActionPage extends StatefulWidget {
  const TradeActionPage({Key? key}) : super(key : key);
  /*const TradeActionPage({
    super.key}); */

  @override
  State<TradeActionPage> createState() => _TradeActionPageState();
}

class _TradeActionPageState extends State<TradeActionPage> {
  File ? _selectedImage;

  final TextEditingController _searchController = TextEditingController();
  List<UserModel> _searchResults = [];
  bool _isLoading = false;

  final String baseUrl = 'https://group-4-15.pvt.dsv.su.se/api/user/search';

  Future<List<UserModel>> fetchUsers(String query) async {
    final response = await http.get(
      Uri.parse('$baseUrl?query=$query'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Misslyckades att hämta användare');
    }
  }

  void _onSearchChanged(String query) async {
    if (query.isEmpty) {
      setState(() => _searchResults = []);
      return;
    }

    setState(() => _isLoading = true);

    try {
      final users = await fetchUsers(query);
      setState(() => _searchResults = users);
    } catch (e) {
      print('Fel vid sökning: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }





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
              leadingWidth: 150,
              centerTitle: true,
              titleSpacing: -1,
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
                  SizedBox(height: 64), //vertical padding
                  Text("Ge märke till:", style: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 22)),
                  SizedBox(height: 10),

                  // Sökruta SEARCHPAGE //30 maj fixad
                  Container(
                    width: 290,
                    height: 100,
                    child: TextField(
                      controller: _searchController,
                      style: const TextStyle(color: Colors.black87),
                      decoration: InputDecoration(
                        hintText: 'Sök efter användare...',
                        hintStyle: TextStyle(color: Colors.black54, fontFamily: 'InknutAntiqua'),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(Icons.search, color: Colors.black),
                      ),
                      onSubmitted: (String? a) { //fixa 31 maj
                        _onSearchChanged;
                        showDialog(context: context, builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            content: _isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : _searchResults.isEmpty
                                  ? const Center(child: Text('Inga användare hittades')) //true
                                      : ListView.builder( //false
                                  itemCount: _searchResults.length,
                                  itemBuilder: (context, index) {
                                  final user = _searchResults[index];
                                  return ListTile(
                                  title: Text(
                                  '${user.firstName} ${user.surName}',
                                  style: const TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'InknutAntiqua'
                                   ),
                                  ),
                          // subtitle: Text(user.emailAddress),
                                 );
                               },
                             ),
                          );
                        });
                      },
                    ),
                  ),

                  // Resultatlista
                  Expanded(
                    child: _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : _searchResults.isEmpty
                        ? const Center(child: Text('Inga användare hittades'))
                        : ListView.builder(
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final user = _searchResults[index];
                        return ListTile(
                          title: Text(
                            '${user.firstName} ${user.surName}',
                            style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'InknutAntiqua'
                            ),
                          ),
                          // subtitle: Text(user.emailAddress),
                        );
                      },
                    ),
                  ), //Expanded


                  SizedBox(height: 2),

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
                              heroTag: "FAB14",
                              backgroundColor: Colors.white,
                              shape: const CircleBorder(),
                              hoverColor: Color.fromARGB(255, 255, 255, 255),
                              focusColor: Colors.white,
                              child: Icon(Icons.add_circle_outline_sharp, size: 30, color: Colors.purpleAccent),
                              onPressed: () {
                                //TODO: BACKEND KOPPLING TILL MÄRKESMENY
                                Navigator.push(
                                  context,
                                 // MaterialPageRoute(builder: (context) => ChoosePatchToTrade()), //hänvisa till confirmation page
                                  MaterialPageRoute(builder: (context) => ProfilePage(user : GlobalUserInfo.currentUser)), //user index
                                );
                              }),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 50),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.only(top: 10),
                        width: 390,
                        height: 90,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 50, 50, 50),
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
                                    color: Colors.purpleAccent, //
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: Offset.fromDirection(0, 2)
                                )
                              ]
                          ),

                          child: SizedBox(
                            // alignment: Alignment.center,
                              height: 53,
                              width: 268,
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                    //side: BorderSide(width: 0.8, color: const Color.fromARGB(255, 0, 0, 0)),
                                      backgroundColor: Color.fromARGB(255, 244, 115, 255), //lila Color.fromARGB(255, 195, 76, 255)
                                      //shadowColor: const Color.fromARGB(255, 255, 198, 43),
                                      overlayColor: Colors.white
                                  ),
                                  onPressed: () { //vad som sker när man trycker på knappen
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => TradeRequestSuccessPage(username: 'Oscar',)), //hänvisa till confirmation page
                                    );
                                  },
                                  child: Text("Gör märkesbytesförfrågan", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'InknutAntiqua', color: Colors.black, fontSize: 15)))
                          ),
                        ),
                      ),
                    ],
                  ),

                  Container(
                      width: 390,
                      height: 35,
                      color: Color.fromARGB(255, 50, 50, 50)
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
