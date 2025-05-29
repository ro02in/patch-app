import 'package:flutter/material.dart';
import '../Model/user_model.dart';
import '../Service/user_service.dart';

class UserProvider with ChangeNotifier {
  final UserService _userService = UserService();

  UserModel? _user;
  List<UserModel> _searchResults = [];

  UserModel? get user => _user;
  List<UserModel> get searchResults => _searchResults;

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
