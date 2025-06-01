import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:patchappflutter/Pages/search_page.dart';
import 'package:patchappflutter/Provider/user_provider.dart';
import '../Model/patch_model.dart';
import '../Service/patch_service.dart';

class PatchProvider with ChangeNotifier {
  final PatchService _patchService = PatchService();
  PatchModel? latestPatch = null;
  PatchModel? _patch;
  List<PatchModel> _userPatches = [];
  List<Uint8List> _userPatchImages = [];
  bool _isLoading = false;
  String? _error;
  List<PatchModel> get userPatches => _userPatches;
  List<Uint8List> get userPatchImages => _userPatchImages;
  bool get isLoading => _isLoading;
  String? get error => _error;
  int? ownerId = UserProvider().id;
  String description;
  Uint8List? pictureData;
  bool isPublic;
  String placement;
  String klubbmasteri;
  String patchName;
  String color;

  PatchProvider({
    this.ownerId = 0,
    this.description = "test",
    this.isPublic = true,
    this.placement = "SKREV",
    this.klubbmasteri = "Hej",
    this.patchName = "MärkesNamn",
    this.color = "SVART",
});

  get patches => null; //ändra från null



  bool savePatch({required PatchModel patch}) {
    this.latestPatch = patch;
    if(latestPatch != null){
      return true;
    }
    else{
      return false;
    }
  }

  Future<PatchModel> createSavedPatch(PatchModel patch) async {
    Future<PatchModel> patchMade;
     return patchMade = _patchService.createPatch(patch);

  }


  void setOwnerId() async{
    ownerId = UserProvider().id;
  }


  void changeOwnerId({
    required int newOwnerId,
  }) async{
    ownerId = newOwnerId;
    notifyListeners();
  }
  // Set loading state and notify listeners
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Fetch patches for a specific user
  Future<void> fetchUserPatches(int googleId) async {
    _setLoading(true);
    try {
      _userPatches = await _patchService.getUserPatches(googleId);
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _setLoading(false);
  }

  // Fetch patch images for a specific user
  Future<void> fetchUserPatchImages(int googleId) async {
    _setLoading(true);
    try {
      _userPatchImages = await _patchService.getUserPatchImages(googleId);
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _setLoading(false);
  }

  // Create a new patch
  Future<PatchModel?> createPatch(PatchModel patch) async {
    _setLoading(true);
    try {
      final newPatch = await _patchService.createPatch(patch);
      _userPatches.add(newPatch);
      _error = null;
      notifyListeners();
      _setLoading(false);
      return newPatch;
    } catch (e) {
      _error = e.toString();
      _setLoading(false);
      return null;
    }
  }
  Future<void> registerPatchTester(PatchModel newPatch) async {
    try {
      _patch = await _patchService.registerNewPatch(newPatch);
      notifyListeners();
    } catch (e) {
      throw Exception('Could not register patch: $e');
    }
  }

  // Delete a patch
  Future<bool> deletePatch(int patchId) async {
    _setLoading(true);
    try {
      await _patchService.deletePatch(patchId);
      _userPatches.removeWhere((patch) => patch.patchId == patchId);
      _error = null;
      notifyListeners();
      _setLoading(false);
      return true;
    } catch (e) {
      _error = e.toString();
      _setLoading(false);
      return false;
    }
  }
}
