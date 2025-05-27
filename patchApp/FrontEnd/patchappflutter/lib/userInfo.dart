//Källhänvisning: 'Simple app state management', docs.flutter.dev/data-and-backend/state-mgmt/simple, publicerad 19 maj 2025, hämtad 27 maj 2025
//Källhänvisning: 'ChangeNotifyer class', api.flutter.dev/flutter/foundation/ChangeNotifier-class.html, publicerad u.å, hämtad 27 maj 2025
import 'package:flutter/material.dart';

class UserInfo with ChangeNotifier {
  String _userName = '';
  String? _profileImagePath;

  String get username => _userName;
  String? get profileImagePath => _profileImagePath;

  //set userName
  void setUsername(String name) {
    _userName = name;
    notifyListeners(); // meddelar UI att uppdateras
  }

  //set ProfileImage
  void setProfileImagePath(String path) {
    _profileImagePath = path;
    notifyListeners();
  }
}