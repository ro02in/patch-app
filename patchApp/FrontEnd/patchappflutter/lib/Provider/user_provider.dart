import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:patchappflutter/global_user_info.dart';
import '../Model/user_model.dart';
import '../Service/user_service.dart';
import 'dart:typed_data';

class UserProvider with ChangeNotifier {
  final UserService _userService = UserService();
  UserModel? currentUser;
  UserModel? _user;
  List<UserModel> _searchResults = [];
  UserModel? get user => _user;
  List<UserModel> get searchResults => _searchResults;
  String userName;
  int? id;
  int ovveIndex;
  String biography;
  String kmName;
  String university;
  String firstName;
  String surName;
  String completeName;
  Uint8List? pictureData;


  UserProvider(
      {
        this.userName = "Users name:",
        this.id,
        this.ovveIndex = 0,
        this.biography = "",
        this.kmName = "Pog",
        this.university = "",
        this.firstName = "Hej",
        this.surName = "Svej",
        this.completeName = "",
        this.pictureData,
});
  void setCompleteName() async {
    completeName = firstName + " \"" + kmName + "\" " + surName;
  }
  void setCurrentUser(UserModel user){
    currentUser = user;
  }
  void setGlobalUser(UserModel user){
    GlobalUserInfo.currentUser = user;
  }
  void setCurrentUserVariables(UserModel currentUser){
    userName = currentUser.username;
    biography = currentUser.biography;
    kmName = currentUser.kmName;
    university = currentUser.university;
    firstName = currentUser.firstName;
    surName = currentUser.surName;
    pictureData = currentUser.pictureData;
    setCompleteName();
  }

  void changeOvveIndex({
    required int newOvveIndex,
  }) async{
    ovveIndex = newOvveIndex;
    notifyListeners();
  }

  // Hämta användare via
  Future<void> fetchUser(int id) async {
    try {
      _user = await _userService.getUser(id);
      notifyListeners();
    } catch (e) {
      throw Exception('Could not fetch user: $e');
    }
  }

  // Registrera användare
  Future<void> registerUser(UserModel newUser) async {
    try {
      _user = await _userService.registerUser(newUser);
      notifyListeners();
    } catch (e) {
      throw Exception('Could not register user: $e');
    }
  }

  // Uppdatera användare
  Future<void> updateUser(int id, UserModel updatedUser) async {
    try {
      _user = await _userService.updateUser(id, updatedUser);
      notifyListeners();
    } catch (e) {
      throw Exception('Could not update user: $e');
    }
  }

  // Sök användare
  Future<void> searchUsers(String query) async {
    try {
      _searchResults = await _userService.searchUsers(query);
      notifyListeners();
    } catch (e) {
      throw Exception('Could not search users: $e');
    }
  }

  // Rensa användardata (om man loggar ut till exempel)
  void clearUser() {
    _user = null;
    notifyListeners();
  }
}
