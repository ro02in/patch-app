import 'package:flutter/material.dart';
import '../Model/user_model.dart';
import '../Service/user_service.dart';

class UserProvider with ChangeNotifier {
  final UserService _userService = UserService();

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
});
  void setCompleteName() async {
    completeName = firstName + " \"" + kmName + "\" " + surName;
  }

  void changeUserName({
    required String newUserName,
}) async{
    userName = newUserName;
    notifyListeners();
  }
  void changeId({
    required int newUserId,
  }) async{
    id = newUserId;
    notifyListeners();
  }
  void changeOvveIndex({
    required int newOvveIndex,
  }) async{
    ovveIndex = newOvveIndex;
    notifyListeners();
  }

  // Hämta användare via Google ID
  Future<void> fetchUser(String googleId) async {
    try {
      _user = await _userService.getUser(googleId);
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
  Future<void> updateUser(String googleId, UserModel updatedUser) async {
    try {
      _user = await _userService.updateUser(googleId, updatedUser);
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
