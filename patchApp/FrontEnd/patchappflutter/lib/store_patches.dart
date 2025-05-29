//Källhänvisning: 'GridView in flutter with network image', //youtu.be/dx3gj5hz6HU?si=wjKTv8aTdT_EFeDV, av Youtube-kanalen 'Lets Code That', publicerad 7 januari 2019, hämtad 27 maj 2025.

//test igen 00:52

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:patchappflutter/patch_model.dart';

class StorePatches{

  //String imageName;
  //String itemImage;
  //List<StorePatches> storePatchesList;


  // List<Patch> storePatchesList = [StorePatches.items("https://group-4-15.pvt.dsv.su.se/api/patch/user/{googleId}")]
  List<Patch> storePatchesList = [StorePatches.items("https://group-4-15.pvt.dsv.su.se/api/patch/user/{googleId}")]
  //StorePatches.items({required this.imageName, required this.itemImage});
}

//Källhänvisning: Handledning med Donald via mail, 28 maj
Future<void> fetchImageList(String userId) async {
  final response = await authHttpRequest(
    context: context,
    url: 'pvt.dsv.su.se/badgelist/$userId',
    method: 'GET',
  );
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    setState(() {
      storePatchesList = data.map<Map<String, dynamic>>((url) => {'url': url.toString()}).toList();
    });
  } else {
    print(“Some error happened, bad userid maybe");
        );
      }
    }


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

/* List<StorePatches> storePatchesList = [
      StorePatches.items()
    ]; */

/*List<StorePatches> storePatchesList = [
      StorePatches.items(
      //entry nr 1
      itemImage: "https://www.agria.se/imagevault/publishedmedia/3yeuof282l7xb635mg4w/hund-som-ater-skonkost-iStock.jpg",
      imageName: "patch1"),
      //entry nr2 ...

      StorePatches.items(
        //entry nr 1
          itemImage: "https://www.agria.se/imagevault/publishedmedia/3yeuof282l7xb635mg4w/hund-som-ater-skonkost-iStock.jpg",
          imageName: "patch1"),

      StorePatches.items(
        //entry nr 1
          itemImage: "https://www.agria.se/imagevault/publishedmedia/b67oc7wqzuob2nddkpfe/ragdoll-and-norweigan-forest-cat.jpg",
          imageName: "patch1"),

      StorePatches.items(
        //entry nr 1
          itemImage: "https://www.agria.se/imagevault/publishedmedia/b67oc7wqzuob2nddkpfe/ragdoll-and-norweigan-forest-cat.jpg",
          imageName: "patch1"),
  ]; */