//NYTT FÖRSÖK NY BRANCH

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:patchappflutter/Pages/post_log_in_page.dart';
import 'package:patchappflutter/Pages/profile_page.dart';
import 'package:patchappflutter/Pages/register_user_confirmed.dart'; //sidan RegisterUserConfirmedPage
import 'package:image_picker/image_picker.dart';
import 'package:patchappflutter/Pages/search_page.dart';
import 'package:patchappflutter/Pages/temp_buttons_page.dart';
import 'package:patchappflutter/global_user_info.dart';
import 'package:provider/provider.dart';

import '../Model/user_model.dart';
import '../Provider/user_provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  File? _selectedImage; //lägga till från kamera eller bibliotek variabel
  //25 maj text controller
  final nameFieldController = TextEditingController();
  final kmNameFieldController = TextEditingController();
  final sectionFieldController = TextEditingController();
  final universityFieldController = TextEditingController();
  final  emailFieldController = TextEditingController();
  final  passwordFieldController = TextEditingController();
  final userNameFieldController = TextEditingController();
  final surNameFieldController = TextEditingController();
  final biographyFieldController = TextEditingController();

  String name = '';
  String surName = '';
  String kmName = '';
  String section = '';
  String university = '';
  bool _isLoading = false;
  String _statusMessage = '';
  String userName = '';
  String email = '';
  String password = '';
  String biography = '';
  int id = 0;


  @override
  void dispose() {
    //clean up textcontroller
    nameFieldController.dispose();
    kmNameFieldController.dispose();
    sectionFieldController.dispose();
    universityFieldController.dispose();
    emailFieldController.dispose();
    passwordFieldController.dispose();
    userNameFieldController.dispose();
    surNameFieldController.dispose();
    biographyFieldController.dispose();
    super.dispose();
  }
  Future<Uint8List> _fileToUint8List(File file) async {
    return await file.readAsBytes();
  }

  Future<void> _handleRegisterButton() async {
    try {
      Uint8List imageData = Uint8List(0); // Default empty
      if (_selectedImage != null) {
        imageData = await _fileToUint8List(_selectedImage!);
      }

      final userProvider = Provider.of<UserProvider>(context, listen:false);
      UserModel newUser = UserModel(
          firstName: name,
          surName: surName,
          kmName: kmName,
          emailAddress: email,
          university: university,
          biography: biography,
          pictureData: imageData,
          username: userName,
          password: password);
      GlobalUserInfo.currentUser = newUser;
      GlobalUserInfo.settingStuff();
      await userProvider.registerUser(newUser);
      UserModel? registeredUser = userProvider.user;
      GlobalUserInfo.id = registeredUser!.id;
      userProvider.setCurrentUser(newUser);
      userProvider.setCurrentUserVariables(newUser);
      userProvider.setCompleteName();


      await Future.delayed(const Duration(seconds: 2)); // Simulate API call

      setState(() {
        print( 'User Provider action completed successfully!');
      });
    } catch (e) {
      setState(() {
        print('User Provider error: $e');
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size; //screensize

    return Scaffold(
      
      body: Scrollbar(child :
      ListView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 0),

        //ta bort glapp mellan appbar och bakgrundsbild

        children: [
          SingleChildScrollView(child:
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/stitches10.png'),
                fit: BoxFit.cover,
              ),
            ),
            //padding: EdgeInsets.only(top: 20),
            //color: const Color.fromARGB(255, 241, 241, 241),

            //bakgrunden bakom inputfields-Container
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AppBar(
                    backgroundColor: Color.fromARGB(170, 38, 42, 27),
                    //Color.fromARGB(255, 243, 92, 255) rosa
                    elevation: 15,
                    shadowColor: Colors.black,
                    toolbarHeight: 57,
                    leading: Icon(Icons.arrow_back, color: Colors.white),
                    leadingWidth: 120,
                    titleSpacing: -18,
                    centerTitle: true,
                    primary: true,
                    //Källhänvisning: 'Rounded bottom on appbar', stackoverflow.com/questions/50242087/rounded-bottom-on-appbar publicerad 13 september 2020, hämtad 23 maj 2025
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(100),
                      ),
                    ),
                    title: Text(
                      "Registera nytt konto",
                      style: TextStyle(
                        fontFamily: 'InknutAntiqua',
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purpleAccent,
                          spreadRadius: 1,
                          blurRadius: 0,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      //LÄGG TILL PROFILBILD
                      radius: 80,
                      backgroundColor: Colors.purpleAccent,
                      foregroundImage:
                          _selectedImage != null
                              ? FileImage(_selectedImage!)
                              : AssetImage('assets/sbpinklogo.png'),
                      child:
                          _selectedImage == null
                              ? Icon(Icons.add, color: Colors.black, size: 30)
                              : null,
                    ),
                  ),

                  SizedBox(height: 16),
                  //padding

                  //Add profile picture knapp
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.yellow,
                              blurRadius: 0,
                              spreadRadius: 1,
                              offset: Offset(0.5, 0.5),
                            ),
                          ],
                        ),
                        child: FloatingActionButton(
                          heroTag: "FAB12",
                          backgroundColor: Colors.white,
                          shape: const CircleBorder(),
                          hoverColor: Color.fromARGB(255, 255, 255, 255),
                          focusColor: Colors.white,
                          child: Icon(
                            Icons.add_photo_alternate_sharp,
                            size: 31,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            _pickImageFromGallery();
                          },
                        ),
                      ),

                      SizedBox(height: 21), //simulated padding
                      SizedBox(width: 20),

                      Container(
                        padding: EdgeInsets.all(5),
                        //styr tjocklek på gul ram
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.yellow,
                              blurRadius: 0,
                              spreadRadius: 1,
                              offset: Offset(0.5, 0.5),
                            ),
                          ],
                        ),
                        child: FloatingActionButton(
                          heroTag: "FAB13",
                          backgroundColor: Colors.white,
                          shape: const CircleBorder(),
                          hoverColor: Color.fromARGB(255, 255, 255, 255),
                          focusColor: Colors.white,
                          child: Icon(
                            Icons.add_a_photo_sharp,
                            size: 31,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            _pickImageFromCamera();
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 40),
                  //padding

                  //KNAPP 1


                      SizedBox(width: 23),
                      Container(
                        padding: EdgeInsets.only(bottom: 10, top: 30),
                        height: 735,
                        width: 373,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color.fromARGB(110, 40, 40, 40),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(140, 20, 20, 20),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 2)
                            )
                          ]
                        ),
                        child: Column(
                          children: [
                            //DITT FÖRNAMN TEXTFIELD NY VARIANT 1 JUNI 17:13
                            SizedBox(
                              height: 86,
                              width: 300,
                              child: TextField(
                                controller: nameFieldController,
                                maxLength: 60,
                                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                onChanged:
                                    (value) => name = nameFieldController.text,  //Källhänvisning www.geeksforgeeks.org/retrieve-data-from-textfields-in-flutter/ publicerad 7 mars 2025, hämtad 25 maj 2025
                                cursorColor: Color.fromARGB(255, 246, 154, 255),
                                cursorHeight: 22,
                                obscureText: false,
                                decoration: InputDecoration(
                                  counterStyle: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 15),
                                  labelText: 'Ditt förnamn:',
                                  labelStyle: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 15),
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  filled: true,
                                  fillColor: Color.fromARGB(40, 255, 255, 255),
                                  contentPadding: EdgeInsets.only(top: 5, left: 20, bottom: 5, right: 20),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.purpleAccent, width: 1.5),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color.fromARGB(255, 85, 85, 85), width: 1.5),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                style: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 15),
                              ),
                            ),
                            SizedBox(width: 20),

                          //SizedBox(height: 20), //padding
                          SizedBox(height: 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 30),
                              //SURNAME TEXTFIELD FIXAD 1 JUNI 17:20
                              SizedBox(
                                height: 86,
                                width: 300,
                                child: TextField(
                                  controller: surNameFieldController,
                                  maxLength: 60,
                                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                  onChanged:
                                      (value) => name = surNameFieldController.text,  //Källhänvisning www.geeksforgeeks.org/retrieve-data-from-textfields-in-flutter/ publicerad 7 mars 2025, hämtad 25 maj 2025
                                  cursorColor: Color.fromARGB(255, 246, 154, 255),
                                  cursorHeight: 22,
                                  obscureText: false,
                                  expands: false,
                                  decoration: InputDecoration(
                                    counterStyle: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 15),
                                    labelText: 'Ditt efternamn:',
                                    labelStyle: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 15),
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    filled: true,
                                    fillColor: Color.fromARGB(40, 255, 255, 255),
                                    contentPadding: EdgeInsets.only(top: 5, left: 20, bottom: 5, right: 20),
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.purpleAccent, width: 1.5),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color.fromARGB(255, 85, 85, 85), width: 1.5),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  style: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 15),
                                ),
                              ),
                              SizedBox(width: 30),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 30),
                              //DITT KM-NAMN TEXTFIELD NY VARIANT 1 JUNI 16:58
                              SizedBox(
                                height: 86,
                                width: 300,
                                child: TextField(
                                  controller: kmNameFieldController,
                                  maxLength: 60,
                                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                  onChanged:
                                      (value) => kmName = kmNameFieldController.text,  //Källhänvisning www.geeksforgeeks.org/retrieve-data-from-textfields-in-flutter/ publicerad 7 mars 2025, hämtad 25 maj 2025
                                  cursorColor: Color.fromARGB(255, 246, 154, 255),
                                  cursorHeight: 22,
                                  obscureText: false,
                                  expands: false,
                                  decoration: InputDecoration(
                                    counterStyle: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 15),
                                    labelText: 'Ditt KM namn:',
                                    labelStyle: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 15),
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    filled: true,
                                    fillColor: Color.fromARGB(40, 255, 255, 255),
                                    contentPadding: EdgeInsets.only(top: 5, left: 20, bottom: 5, right: 20),
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.purpleAccent, width: 1.5),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color.fromARGB(255, 85, 85, 85), width: 1.5),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  style: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 15),
                                ),
                              ),
                              SizedBox(width: 30),
                            ],
                          ),

                          SizedBox(height: 2),

                          //padding mellan KM namn textfield och Sektion textfield
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 30),
                              //DITT UNIVERSITET TEXTFIELD NY VARIANT 1 JUNI 16:58
                              SizedBox(
                                height: 86,
                                width: 300,
                                child: TextField(
                                  controller: universityFieldController,
                                  maxLength: 60,
                                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                  onChanged:
                                      (value) => university = universityFieldController.text,  //Källhänvisning www.geeksforgeeks.org/retrieve-data-from-textfields-in-flutter/ publicerad 7 mars 2025, hämtad 25 maj 2025
                                  cursorColor: Color.fromARGB(255, 246, 154, 255),
                                  cursorHeight: 22,
                                  obscureText: false,
                                  expands: false,
                                  decoration: InputDecoration(
                                    counterStyle: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 15),
                                    labelText: 'Ditt universitet:',
                                    labelStyle: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 15),
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    filled: true,
                                    fillColor: Color.fromARGB(40, 255, 255, 255),
                                    contentPadding: EdgeInsets.only(top: 5, left: 20, bottom: 5, right: 20),
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.purpleAccent, width: 1.5),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color.fromARGB(255, 85, 85, 85), width: 1.5),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  style: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 15),
                                ),
                              ),
                              SizedBox(width: 30),
                            ],
                          ),

                          SizedBox(height: 2),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 30),
                              //USERNAME TEXTFIELD NY VARIANT 1 JUNI 16:58
                              SizedBox(
                                height: 86,
                                width: 300,
                                child: TextField(
                                  controller: userNameFieldController,
                                  maxLength: 35,
                                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                  expands: false,
                                  onChanged:
                                      (value) => userName = userNameFieldController.text,  //Källhänvisning www.geeksforgeeks.org/retrieve-data-from-textfields-in-flutter/ publicerad 7 mars 2025, hämtad 25 maj 2025
                                  cursorColor: Color.fromARGB(255, 246, 154, 255),
                                  cursorHeight: 22,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    counterStyle: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 15),
                                    labelText: 'Ditt användarnamn:',
                                    labelStyle: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 15),
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    filled: true,
                                    fillColor: Color.fromARGB(40, 255, 255, 255),
                                    contentPadding: EdgeInsets.only(top: 5, left: 20, bottom: 5, right: 20),
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.purpleAccent, width: 1.5),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color.fromARGB(255, 85, 85, 85), width: 1.5),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  style: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 15),
                                ),
                              ),
                              SizedBox(width: 30),
                            ],
                          ),

                          SizedBox(height: 2),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 30),
                              //EMAIL TEXTFIELD NY VARIANT 1 JUNI 16:56
                              SizedBox(
                                height: 86,
                                width: 300,
                                child: TextField(
                                  controller: emailFieldController,
                                  expands: false,
                                  maxLength: 100,
                                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                  onChanged: (value) =>
                                  email = emailFieldController.text,  //Källhänvisning www.geeksforgeeks.org/retrieve-data-from-textfields-in-flutter/ publicerad 7 mars 2025, hämtad 25 maj 2025
                                  cursorColor: Color.fromARGB(255, 246, 154, 255),
                                  cursorHeight: 22,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    counterStyle: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 15),
                                    labelText: 'Email:',
                                    labelStyle: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 15),
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    filled: true,
                                    fillColor: Color.fromARGB(40, 255, 255, 255),
                                    contentPadding: EdgeInsets.only(top: 5, left: 20, bottom: 5, right: 20),
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.purpleAccent, width: 1.5),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color.fromARGB(255, 85, 85, 85), width: 1.5),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  style: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 15),
                                ),
                              ),
                              SizedBox(width: 30),
                            ],
                          ),

                          SizedBox(height: 2),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 30),
                              //PASSWORD TEXTFIELD
                              SizedBox(
                                height: 86,
                                width: 300,
                                child: TextField(
                                  controller: passwordFieldController,
                                  maxLength: 60,
                                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                  onChanged:
                                      (value) => password = passwordFieldController.text,
                                  cursorColor: Color.fromARGB(255, 246, 154, 255),
                                  cursorHeight: 22,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    counterStyle: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 15),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 15),
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    filled: true,
                                    fillColor: Color.fromARGB(40, 255, 255, 255),
                                    contentPadding: EdgeInsets.only(top: 5, left: 20, bottom: 5, right: 20),
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.purpleAccent, width: 1.5),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color.fromARGB(255, 85, 85, 85), width: 1.5),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  style: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 15),
                                ),
                              ),

                              SizedBox(width: 30),
                            ],
                          ),
                          SizedBox(height: 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 30),

                              //BIOGRAFI NYTT TEXTFIELD
                              SizedBox(
                                height: 70,
                                width: 300,
                                child: TextField(
                                  expands: true,
                                  maxLines: null,
                                  controller: biographyFieldController,
                                  maxLength: 150,
                                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                  onChanged:
                                      (value) => biography = biographyFieldController.text,
                                  cursorColor: Color.fromARGB(255, 246, 154, 255),
                                  cursorHeight: 22,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    counterStyle: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 15),
                                    labelText: 'Biografi',
                                    labelStyle: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 15),
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    filled: true,
                                    fillColor: Color.fromARGB(40, 255, 255, 255),
                                    contentPadding: EdgeInsets.only(top: 5, left: 20, bottom: 5, right: 20),
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.purpleAccent, width: 1.5),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.purpleAccent, width: 1.5),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  style: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 15),
                                ),
                              ),
                          ],
                        )
                          ],
                      ),

                      ),


                  //KNAPP 2
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 150),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 10),
                        width: 406,
                        height: MediaQuery.of(context).size.height * 0.110,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 43, 43, 43),
                          borderRadius: new BorderRadius.vertical(
                            //rundad kant container källhänvisning: 'Rounded Bottom on appbar', stackoverflow.com/questions/50242087/rounded-bottom-on-appbar av user "Rémi Rousselet" publicerad 8 maj 2018, hämtad 25 maj 2025
                            top: new Radius.elliptical(
                              MediaQuery.of(context).size.width,
                              100,
                            ),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 20, 20, 20),
                              spreadRadius: 3,
                              blurRadius: 35,
                              offset: Offset(0.5, 1),
                            ),
                          ],
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.purpleAccent, //
                                spreadRadius: 1.5,
                                blurRadius: 7,
                                offset: Offset.fromDirection(0, 0),
                              ),
                            ],
                          ),

                          child: SizedBox(
                            // alignment: Alignment.center,
                            height: 58,
                            width: 295,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                //side: BorderSide(width: 0.8, color: const Color.fromARGB(255, 0, 0, 0)),
                                backgroundColor: Color.fromARGB(
                                  255,
                                  244,
                                  115,
                                  255,
                                ),
                                //lila Color.fromARGB(255, 195, 76, 255)
                                //shadowColor: const Color.fromARGB(255, 255, 198, 43),
                                overlayColor: Colors.white,
                              ),
                              onPressed: () {
                                //vad som sker när man trycker på knappen
                                setState(() {
                                  nameFieldController.text.isEmpty
                                      ? showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor: Colors.white,
                                            content: Container(
                                              alignment: Alignment.center,
                                              width: 350,
                                              height: 50,
                                              child: Text(
                                                "Namn-fältet får inte vara tomt.",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontFamily: 'InknutAntiqua',
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                  ) : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => PostLoginPage(),
                                    ),
                                  ); //hänvisa till confirmation page
                                });
                                _handleRegisterButton();
                              },
                              child: Text(
                                "Registrera konto",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'InknutAntiqua',
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          ),
          )
        ],
      ),
      )
    );
  }

  //Lägga till bild från kameragalleri
  Future _pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }

  //Lägga till bild från kamera
  Future _pickImageFromCamera() async {
    final returnedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }
}
