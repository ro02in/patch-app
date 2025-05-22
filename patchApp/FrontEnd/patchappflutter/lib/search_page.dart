// huvudsidan för sökningar (scary)

/* LÄSKIG SIDA ATT BYGGA, innan vi börjar ska jag lägga 
  upp en plan så att jag försöker förstå detta

1. Ett sökfält behövs där användaren skriver in sitt sökord
Sökfältet ska ha:
- En TextField (Låta användaren skriva in text - textinmatning)
- En controller (hämtar användarens text in i TextField) Tar 
  textinmatning och lagrar den i en variabel
- Ikon (typ förstoringsglas)
- Eventuellt onChanged eller onSubmitted callback som körs
  varje gång användaren skriver/ändrar text

2. Användarinmatning
 Hanteras av en state management-lösning för att uppdatera
 resultat i realtid när anv skriver
 Antingen onChanged (realtidssök) eller onSubmitted (när enter tryckts)  
   
   
   Användare
 Vi behöver en klass som representerar varje användare (User class)
 Sedan behöver vi koppla mot listan av användare med BACKEND
 Sedan appliceras filtreringsfunktioner baserat på sökordet med
 hjälp av TextEditingController
 När användare är filtrerade kan resultat visas med ex en ListView

När anv skriver in namn skickas request till BACKEND som
hämtar matchande anv

Att anv är variabler = backend skickar lista med anvobjekt 
som loopas igenom och visas

String userName = user.name;
Text(userName);


import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/stitches3.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            // Stor rosa bar med sökruta
            Container(
              width: double.infinity,
              height: 180, // Höjden kan justeras
              padding: const EdgeInsets.only(top: 100,left: 24, right: 24),
              color: const Color(0xFFF382F3),
              child: TextField(
                controller: _searchController,
                style: const TextStyle(color: Colors.black87),
                decoration: InputDecoration(
                  hintText: 'Sök efter användare...',
                  hintStyle: const TextStyle(color: Colors.black54),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.black54),
                ),
                onChanged: (value) {
                  // För söklogik senare!!!!!!!!
                  print('Sökord: $value');
                },
              ),
            ),
            // Här kommer resten av sidan som jag inte byggt än!!!!!!!!!!
          ],
        ),
      ),
    );
  }
}


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Modellklass för användare
class User {
  final String id;
  final String kmName;

  User({required this.id, required this.kmName});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'].toString(),
      kmName: json['kmName'],
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<User> _results = [];
  bool _isLoading = false;

  Future<List<User>> searchUsers(String query) async {
    final url = Uri.parse('https://your-api.com/api/users/search?query=$query'); // <-- ändra denna URL till din riktiga
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Fel vid sökning');
    }
  }

  void _onSearchChanged(String value) async {
    if (value.length < 2) return;

    setState(() => _isLoading = true);
    try {
      final users = await searchUsers(value);
      setState(() => _results = users);
    } catch (e) {
      print('Sökfel: $e');
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
            image: AssetImage('assets/stitches3.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            // Stor rosa bar med sökruta
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
                  hintStyle: const TextStyle(color: Colors.black54),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.black54),
                ),
                onChanged: _onSearchChanged,
              ),
            ),

            // Resultatlista
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                itemCount: _results.length,
                itemBuilder: (context, index) {
                  final user = _results[index];
                  return ListTile(
                    title: Text(user.kmName),
                    onTap: () {
                      // TODO: navigera till profil eller starta trade
                      print('Vald användare: ${user.kmName}');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



 */

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
      id: json['id'],
      firstName: json['firstName'],
      surName: json['surName'],
      kmName: json['kmName'],
      emailAddress: json['emailAddress'],
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

  // Byt till localhost om du kör på iOS eller web, annars använd 10.0.2.2 för Android emulator
  final String baseUrl = 'http://10.0.2.2:8080/api/user/search';

  // Hämta användare från backend
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

  // Körs varje gång text ändras
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
            image: AssetImage('assets/stitches3.png'),
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
                  hintStyle: const TextStyle(color: Colors.black54),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.black54),
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
                    title: Text('${user.firstName} ${user.surName}'),
                    subtitle: Text(user.emailAddress),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
