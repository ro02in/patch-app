import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';
import 'package:http/http.dart' as http;
import '../Model/patch_model.dart';


class PatchService {
// our spring boot app is running on the port: 8080
// if you change your spring boot port make sure u change here.
  final String baseUrl = 'https://group-4-15.pvt.dsv.su.se/api/patch';

  Future<List<PatchModel>> getUserPatches(String googleId) async {
    final response = await http.get(Uri.parse('$baseUrl/user/$googleId'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((patch) => PatchModel.fromJson(patch)).toList();
    } else {
      throw Exception('Failed to load patches');
    }
  }
  Future<List<PatchModel>> getUserPatchesTest(String googleId) async {
    final response = await http.get(Uri.parse('$baseUrl/user/$googleId'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<PatchModel> patchList = [];
      for(var patchObject in jsonResponse){
        PatchModel patch = PatchModel.fromJson(patchObject);
        patchList.add(patch);
      }
      return patchList;
    } else {
      throw Exception('Failed to load patches');
    }
  }

  Future<List<Uint8List>> getUserPatchImages(String googleId) async {
    final response = await http.get(Uri.parse('$baseUrl/images/belongs/$googleId'));
    if (response.statusCode == 200) {
      List<dynamic> base64List = jsonDecode(response.body);
      return base64List.map((base64Str) => base64Decode(base64Str as String)).toList();
    } else {
      throw Exception('Failed to load images');
    }
  }

  Future<PatchModel> createPatch(PatchModel patch) async {
    final response = await http.post(
      Uri.parse('$baseUrl/add'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(patch.toJson()),
      //  final response = await http.get(Uri.parse('$baseUrl?description=$description?ownerGoogleId=$ownerGoogleId?is_public=
      //  $isPublic?colors=$color?image=$imageFile?patchName=$patchName?klubbmasteri=$klubbMasteri?placement=$placement'),
    );
    if (response.statusCode == 200) {
      return PatchModel.fromJson(json.decode(response.body));
      //return PatchModel(patchid: patchid, description: description, ownerGoogleId: ownerGoogleId, pictureData: pictureData, isPublic: isPublic, placement: placement, klubbmasteri: klubbmasteri, patchName: patchName, color: color).fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create Patch');
    }
  }

  Future<void> deletePatch(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/delete/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete patch');
    }
  }

  Future<Image> getPatchImage(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id/image'));
    if (response.statusCode == 200) {
      Image jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to load image');
    }
  }



}