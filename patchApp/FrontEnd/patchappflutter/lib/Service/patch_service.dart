import 'dart:convert';
import 'package:http/http.dart' as http;
import ''
import '../Model/patch_model.dart';,


class PatchService {
// our spring boot app is running on the port: 8080
// if you change your spring boot port make sure u change here.
  final String baseUrl = 'https://group-4-15.pvt.dsv.su.se/api/patches';

  Future<List<PatchModel>> getPatches() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((patch) => PatchModel.fromJson(patch)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<PatchModel> createPatch(patch) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(patch.toJson()),
    );
    if (response.statusCode == 200) {
      return PatchModel(patchid: patchid, description: description, ownerGoogleId: ownerGoogleId, pictureData: pictureData, isPublic: isPublic, placement: placement, klubbmasteri: klubbmasteri, patchName: patchName, color: color).fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create Patch');
    }
  }

  Future<void> deletePatch(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/delete/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete todo');
    }
  }

  Future<void> getPatchImage(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id/image'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete todo');
    }
  }

  Future<void> getUserPatches(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/delete/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete todo');
    }
  }
}