
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:patchappflutter/Pages/bottomNavigationBar.dart';

// ===== USER MODELL =====
class User {
  final String id;
  final String firstName;
  final String surName;
  final String kmName;
  final String emailAddress;

  User({
    required this.id,
    required this.firstName,
    required this.surName,
    required this.kmName,
    required this.emailAddress,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id']?.toString() ?? '',
      firstName: json['firstName'] ?? '',
      surName: json['surName'] ?? '',
      kmName: json['kmName'] ?? '',
      emailAddress: json['emailAddress'] ?? '',
    );
  }
}

// ===== SEARCH PAGE =====
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<User> _searchResults = [];
  bool _isLoading = false;

  final String baseUrl = 'https://group-4-15.pvt.dsv.su.se/api/user/search';

  Future<List<User>> fetchUsers(String query) async {
    final response = await http.get(
      Uri.parse('$baseUrl?query=$query'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Misslyckades att hämta användare');
    }
  }

  void _onSearchChanged(String query) async {
    if (query.isEmpty) {
      setState(() => _searchResults = []);
      return;
    }

    setState(() => _isLoading = true);

    try {
      final users = await fetchUsers(query);
      setState(() => _searchResults = users);
    } catch (e) {
      print('Fel vid sökning: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/stitches7.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            // Sökruta
            Container(
              width: double.infinity,
              height: 180,
              padding: const EdgeInsets.only(top: 100, left: 24, right: 24),
              color: const Color(0xFFF382F3),
              child: TextField(
                controller: _searchController,
                style: const TextStyle(color: Colors.black87),
                decoration: InputDecoration(
                  hintText: 'Sök efter användare...',
                  hintStyle: TextStyle(color: Colors.black54, fontFamily: 'InknutAntiqua'),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.black),
                ),
                onChanged: _onSearchChanged,
              ),
            ),

            // Resultatlista
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _searchResults.isEmpty
                  ? const Center(child: Text('Inga användare hittades'))
                  : ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  final user = _searchResults[index];
                  return ListTile(
                    title: Text(
                      '${user.firstName} ${user.surName}',
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'InknutAntiqua'
                      ),
                    ),
                   // subtitle: Text(user.emailAddress),
                  );
                },
              ),
            ), //Expanded
          ],
        ),
      ),
    );
  }
}
