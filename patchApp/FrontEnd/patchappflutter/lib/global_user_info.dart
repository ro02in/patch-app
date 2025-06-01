import 'dart:typed_data';
import 'package:patchappflutter/Model/user_model.dart';
import 'package:patchappflutter/Provider/Patch_Provider.dart';

import 'Model/patch_model.dart';

class GlobalUserInfo {
  static UserModel? currentUser;
  static UserModel? otherUser;
  static int? id;
  static String firstName = "I";
  static String surName= "Uninitialized";
  static String kmName = "am";
  static String university = "hey";
  static String emailAddress = "emayl";
  static String biography = "Biobiobobiobio";
  static String username = "oosrnaem";
  static Uint8List? pictureData;
  static String completeName = "Compname";
  static List<PatchModel> patches = [];
  static List<Uint8List> patchPictures = [];
  static PatchModel patchTester = PatchModel(description: "description", ownerId: 21, isPublic: true, placement: "placement", klubbmasteri: "klubbmasteri", patchName: "patchName", color: "color", pictureData: null);

  static void settingStuff(){
    id = currentUser!.id;
    firstName = currentUser!.firstName;
    surName = currentUser!.surName;
    kmName = currentUser!.kmName;
    university = currentUser!.university;
    emailAddress = currentUser!.emailAddress;
    biography = currentUser!.biography;
    username = currentUser!.username;
    completeName = firstName + " \"" + kmName + "\" " + surName;
    }

  }

