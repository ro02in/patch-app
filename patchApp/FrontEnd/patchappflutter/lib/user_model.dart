class User {
  final String googleId;
  final String firstName;
  final String surName;
  final String kmName;
  final String university;
  final String emailAddress;
  String biography;

  User({
    required this.googleId,
    required this.firstName,
    required this.surName,
    required this.kmName,
    required this.university,
    required this.emailAddress,
    required this.biography,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
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
