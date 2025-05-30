class UserModel {
  final String googleId;
  final String firstName;
  final String surName;
  final String kmName;
  final String university;
  final String emailAddress;
  String biography;

  UserModel({
    required this.googleId,
    required this.firstName,
    required this.surName,
    required this.kmName,
    required this.university,
    required this.emailAddress,
    required this.biography,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      googleId: json['googleId'] ?? '',
      firstName: json['firstName'] ?? '',
      surName: json['surName'] ?? '',
      kmName: json['kmName'] ?? '',
      university: json['university'] ?? '',
      emailAddress: json['emailAddress'] ?? '',
      biography: json['biography'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'googleId': googleId,
    'firstName': firstName,
    'surName': surName,
    'kmName': kmName,
    'university': university,
    'emailAddress': emailAddress,
    'biography': biography,
  };
}
