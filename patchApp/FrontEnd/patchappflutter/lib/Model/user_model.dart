import 'dart:typed_data';

class UserModel {
  final int? id;
  final String firstName;
  final String surName;
  final String kmName;
  final String university;
  final String emailAddress;
  String biography;
  final String username;
  final String? password;
  final Uint8List? pictureData;

  UserModel({
    this.id,
    required this.firstName,
    required this.surName,
    required this.kmName,
    required this.university,
    required this.emailAddress,
    required this.biography,
    this.pictureData,
    required this.username,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['firstName'] ?? '',
      surName: json['surName'] ?? '',
      kmName: json['kmName'] ?? '',
      university: json['university'] ?? '',
      emailAddress: json['emailAddress'] ?? '',
      biography: json['biography'] ?? '',
      pictureData: json['pictureData'] != null
          ? Uint8List.fromList(List<int>.from(json['pictureData']))
          : null,
      username: json['username'] ?? '',
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'firstName': firstName,
    'surName': surName,
    'kmName': kmName,
    'university': university,
    'emailAddress': emailAddress,
    'biography': biography,
    'pictureData': pictureData?.toList(),
    'username': username,
    'password': password,
  };
}