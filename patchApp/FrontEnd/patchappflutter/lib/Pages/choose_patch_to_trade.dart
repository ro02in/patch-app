import 'dart:convert';
import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';

import 'package:flutter/material.dart';
import 'package:patchappflutter/Pages/profile_page.dart';
import 'package:patchappflutter/Pages/trade_action_page.dart';

import '../Model/patch_model.dart';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:patchappflutter/Pages/add_patch_page.dart';
import 'package:patchappflutter/Pages/bottomNavigationBar.dart';
import 'package:patchappflutter/Pages/faq_page.dart';
import 'package:patchappflutter/Pages/search_page.dart';
import 'package:patchappflutter/global_user_info.dart';
import 'package:patchappflutter/Pages/store_patches.dart';
import 'package:patchappflutter/Model/patch_model.dart';
import 'package:patchappflutter/Provider/user_provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:patchappflutter/Model/patch_model.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import '../Provider/user_provider.dart';


class ChoosePatchToTrade extends StatefulWidget {
  const ChoosePatchToTrade({Key? key}) : super(key: key);

  @override
  State<ChoosePatchToTrade> createState() => _ChoosePatchToTradeState();

}

  class _ChoosePatchToTradeState extends State<ChoosePatchToTrade> {

  List<Uint8List?> patchImageList = [];
  String getUrl = 'https://group-4-15.pvt.dsv.su.se/api/patch/user/' + GlobalUserInfo.id.toString(); //Källhänvisning: DISK handledning 29 maj kl 15


  //HANTERA HÄMTA MÄRKESSAMLING
    //Källhänvisning: Handledning med Donald via mail 28 maj.
    Future<void> fetchImageList(int userId) async {
      final response = await authHttpRequest(
        context: ChoosePatchToTrade,
        url: getUrl,
        method: 'GET',
      );
      if (response.statusCode == 200) {
        //final List<Map<String, dynamic>> data = jsonDecode(response.body);
        setState(() {
          //Källhänvisning: DISK handledning 29 maj kl 15
          final List<dynamic> json = jsonDecode(response.body);
          List<Uint8List?> patchImageList = [];
          for (Map<String, dynamic> jsonPatchObject in json) {
            patchImageList.add(PatchModel.fromJson(jsonPatchObject).pictureData);
          }
        });
      } else {
        print("Some error happened, bad userid maybe");
      }
    }

  authHttpRequest({required Type context, required String url, required String method})

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          body: Container(
          decoration: const BoxDecoration(
          image: DecorationImage(
          image: AssetImage('assets/stitches9.png'),
          fit: BoxFit.cover,
          ),
      ),
      child: ListView(
      padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
      children: [

        AppBar( //30 maj fixad
          backgroundColor: Color.fromARGB(170, 34, 42, 22), //Color.fromARGB(255, 243, 92, 255) rosa
          toolbarHeight: 57,
          leadingWidth: 117,
          title: Text("Välj märke att ge bort"),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 17, fontFamily: 'InknutAntiqua'),
          leading: Builder( //Källhänvisning: 'leading property', //api.flutter.dev/flutter/material/AppBar/leading.html publicerad u.å, hämtad 30 maj 2025
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TradeActionPage()),
                  );
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          automaticallyImplyLeading: true,
          titleSpacing: -30,
          elevation: 10,
          primary: true,
          shadowColor: Color.fromARGB(255, 40, 40, 40),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(100),
                  )
              ),
            ),

        SizedBox(height: 50),

        //Källhänvisning: 'GridView in flutter with network image', //youtu.be/dx3gj5hz6HU?si=wjKTv8aTdT_EFeDV, av Youtube-kanalen 'Lets Code That', publicerad 7 januari 2019, hämtad 27 maj 2025.
        GridView.builder(
          physics: ClampingScrollPhysics(), //löste problemet med att GridView fastnade vid scrolling
          shrinkWrap: true, //gör visible
          padding: EdgeInsets.all(20),
          primary: true,
          itemCount: patchImageList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) { //context was profilePage
            if (patchImageList.isNotEmpty){
              return Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Color.fromARGB(255, 40, 40, 40), width: 1),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            spreadRadius: 3,
                            blurRadius: 15,
                            offset: Offset(0, 2)
                        )
                      ]
                  ),
                  child: CircleAvatar(
                    radius: 20,
                    foregroundImage: MemoryImage(patchImageList[currentIndex]!), //Handledning med Donald via mail 28 maj, DISK handledning 29 maj kl 15
                  ),
                ),
              );
            } else {
              return Text(
                "Failed!", style: TextStyle(color: Colors.red, fontSize: 30),
                );
              }
            },
          ),
          ], //LISTVIEW CHILDREN
       ),//ListView MAIN CHOOSEPATCHTOTRADE
      )
    );
  }

}