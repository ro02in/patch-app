//Källhänvisning: 'GridView in flutter with network image', //youtu.be/dx3gj5hz6HU?si=wjKTv8aTdT_EFeDV, av Youtube-kanalen 'Lets Code That', publicerad 7 januari 2019, hämtad 27 maj 2025.

/*
//test igen 00:52

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:patchappflutter/patch_model.dart';
import 'dart:io';


class StorePatches {
  /*List<Map> imageGridList = [
    imageGridList.items(
        "https://group-4-15.pvt.dsv.su.se/api/patch/user/{googleId}")];  */

  //List<Map> imageGridList = [];

  //Källhänvisning: Handledning med Donald via mail, 28 maj
  Future<void> fetchImageList(String userId) async {
    //Källhänvisning: //github.com/flutter/flutter/issues/55848
    /* http.Response response = await http.post(
      context: StorePatches,
      url: 'pvt.dsv.su.se/badgelist/$userId',
      method: 'GET',
    ),
  ); */
    final response = await authHttpRequest(
      context: StorePatches,
      url: 'group-4-15.pvt.dsv.su.se/api/patch/user/',
      method: 'GET',
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        List<Map>imageGridList =
            data
                .map<Map<String, dynamic>>((url) =>
            {
              'group-4-15.pvt.dsv.su.se/api/patch/user/': url.toString()
            })
                .toList();
      });
    } else {
      print("Some error happened, bad userid maybe");
    }
  }

  authHttpRequest(
      {required Type context, required String url, required String method}) {
    //Skapad, autogenererad, utifrån röd-lampa knapp i IntelliJ, denna metod ville flutter ha annars rött meddelande vid authHttpRequest
  }

  void setState(Null Function() param0) {
  }
}



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/*
class StorePatches extends StatefulWidget {

  @override
  State<StorePatches> createState() => _StorePatchesState();
}

class _StorePatchesState extends State<StorePatches> {


  // List<Patch> storePatchesList = [StorePatches.items("https://group-4-15.pvt.dsv.su.se/api/patch/user/{googleId}")]
  //List<StorePatches> storePatchesList = [StorePatches.items("https://group-4-15.pvt.dsv.su.se/api/patch/user/{googleId}")];

  List<Map> imageGridList = [StorePatches.items("https://group-4-15.pvt.dsv.su.se/api/patch/user/{googleId}")];

  //StorePatches.items({required this.imageName, required this.itemImage});


//Källhänvisning: Handledning med Donald via mail, 28 maj
  Future<void> fetchImageList(String userId) async {

    //Källhänvisning: //github.com/flutter/flutter/issues/55848
   /* http.Response response = await http.post(
      context: StorePatches,
      url: 'pvt.dsv.su.se/badgelist/$userId',
      method: 'GET',
    ),
  ); */
   final response = await authHttpRequest(
      context: StorePatches,
      url: 'group-4-15.pvt.dsv.su.se/api/patch/user/',
      method: 'GET',
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        imageGridList =
            data
                .map<Map<String, dynamic>>((url) => {'group-4-15.pvt.dsv.su.se/api/patch/user/': url.toString()})
                .toList();
      });
    } else {
      print("Some error happened, bad userid maybe");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  authHttpRequest({required Type context, required String url, required String method}) { //Skapad, autogenererad, utifrån röd-lampa knapp i IntelliJ, denna metod ville flutter ha annars rött meddelande vid authHttpRequest

  }
}  */



/*
Future<List<PatchModel>> fetchUserPatches(String googleId) async {
  final response = await http.get(Uri.parse("https://group-4-15.pvt.dsv.su.se/api/patch/user/$googleId"));

  if (response.statusCode == 200) {
    List jsonList = jsonDecode(response.body);
    return jsonList.map((json) => PatchModel.fromJson(json)).toList();
  } else {
    throw Exception("Failed to load patches");
  }
} */
}*/