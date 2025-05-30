import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/user_model.dart';

class UserService {
  final String baseUrl = 'https://group-4-15.pvt.dsv.su.se/api/user';

  // Register new user
  Future<UserModel> registerUser(UserModel user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to register user');
    }
  }

  // Update user info
  Future<UserModel> updateUser(String googleId, UserModel user) async {
    final response = await http.put(
      Uri.parse('$baseUrl/update/$googleId'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update user');
    }
  }

  // Search users
  Future<List<UserModel>> searchUsers(String query) async {
    final response = await http.get(
      Uri.parse('$baseUrl/search?query=$query'),
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to search users');
    }
  }


  // Get single user by Google ID
  Future<UserModel> getUser(String googleId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/$googleId'),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get user');
    }
  }
}
