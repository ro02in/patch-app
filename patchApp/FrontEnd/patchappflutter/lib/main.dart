import 'package:flutter/material.dart';
import 'package:patchappflutter/continue_register_page.dart';
import 'package:patchappflutter/register_page.dart';
import 'package:patchappflutter/temp_buttons_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // Controllers for the login/register form fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Call the login endpoint using email and password
  Future<void> handleLogin() async {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    try {
      final response = await http.post(
        Uri.parse('https://group-4-15.pvt.dsv.su.se/api/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'emailAddress': email,
          'password': password,
        }),
      );

      final responseData = jsonDecode(response.body);
      // Check status or message in the response to determine success.
      if (response.statusCode == 200 && responseData['message'] == 'Login successful.') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TempButtonsPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['message'] ?? 'Login failed')),
        );
      }
    } catch (error) {
      print('Login error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: $error')),
      );
    }
  }

  // Call the register endpoint using email and password
  // (For fields you don’t ask for, you can either use empty values or add extra form fields as needed.)
  Future<void> handleRegister() async {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    try {
      final response = await http.post(
        Uri.parse('https://group-4-15.pvt.dsv.su.se/api/auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'firstName': '',    // Adjust or add fields if needed
          'surName': '',
          'kmName': '',
          'university': '',
          'emailAddress': email,
          'password': password,
          'biography': '',
          'pictureData': null,
        }),
      );

      final responseData = jsonDecode(response.body);
      if (response.statusCode == 200 && responseData['message'] == 'User registered successfully.') {
        // On registration success, you could navigate to a registration details page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => RegisterPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['message'] ?? 'Registration failed')),
        );
      }
    } catch (error) {
      print('Registration error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/stitches1.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 53, 53, 53).withOpacity(0.8),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Color.fromARGB(255, 226, 93, 246), width: 1),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 39, 39, 39),
                  blurRadius: 5,
                  spreadRadius: 2,
                  offset: Offset(1, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "WELCOME TO PATCH APP",
                  style: TextStyle(
                    color: Color.fromARGB(255, 239, 137, 254),
                    fontFamily: 'InknutAntiqua',
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 20),
                // Email input field
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white12,
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20),
                // Password input field
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white12,
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 30),
                buildButton("LOG IN", handleLogin, Colors.green),
                SizedBox(height: 20),
                buildButton("REGISTER", handleRegister, Colors.blue),
                SizedBox(height: 20),
                buildButton("DEV MENY", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TempButtonsPage()),
                  );
                }, Colors.orange),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton(String text, Function handler, Color color) {
    return SizedBox(
      width: 240,
      height: 45,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1.2, color: color),
          backgroundColor: Color.fromARGB(255, 39, 39, 39),
        ),
        onPressed: () => handler(),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'InknutAntiqua',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}