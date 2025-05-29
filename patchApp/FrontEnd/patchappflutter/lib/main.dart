import 'package:flutter/material.dart';
import 'package:patchappflutter/add_patch_page.dart';
import 'package:patchappflutter/continue_register_page.dart';
import 'package:patchappflutter/register_page.dart';
import 'package:patchappflutter/temp_buttons_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LogInPage());
  }
}

class LogInPage extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId:
    '627806627643-dm5alpgkrqa3jdhml17v06m5p0s35p7v.apps.googleusercontent.com',
  );

  Future<void> handleLogin(BuildContext context) async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        final GoogleSignInAuthentication auth = await account.authentication;
        final idToken = auth.idToken;

        if (idToken != null) {
          final response = await http.post(
            Uri.parse('https://group-4-15.pvt.dsv.su.se/api/auth/login'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'idToken': idToken}),
          );

          final responseData = jsonDecode(response.body);
          if (responseData['status'] == 'success') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => TempButtonsPage()),
            );
          } else if (responseData['status'] == 'not_found') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ContinueRegisterPage()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(responseData['message'] ?? 'Login failed')),
            );
          }
        }
      }
    } catch (error) {
      print('Login error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: $error')),
      );
    }
  }

  Future<void> handleRegister(BuildContext context) async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        final GoogleSignInAuthentication auth = await account.authentication;
        final idToken = auth.idToken;

        if (idToken != null) {
          final response = await http.post(
            Uri.parse('https://group-4-15.pvt.dsv.su.se/api/auth/register'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'idToken': idToken}),
          );

          final responseData = jsonDecode(response.body);
          if (responseData['status'] == 'success') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => RegisterPage()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(responseData['message'] ?? 'Registration failed')),
            );
          }
        }
      } else {
        print('Login aborted by user');
      }
    } catch (error) {
      print('Google Sign-In error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign-in failed: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: screenSize.width,
              height: screenSize.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/stitches1.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 200),
                  Text(
                    "WELCOME TO",
                    style: TextStyle(
                      color: Color.fromARGB(255, 239, 137, 254),
                      fontFamily: 'InknutAntiqua',
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 3),
                  Image.asset('assets/sbpinklogo.png', width: 150, height: 150),
                  Image.asset('assets/syttbyttljusrosatext.png', height: 20, width: 400),
                  SizedBox(height: 20),
                  Container(
                    width: 310,
                    height: 310,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 53, 53, 53),
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
                      children: [
                        SizedBox(height: 95),
                        buildButton(context, "LOG IN", handleLogin),
                        SizedBox(height: 25),
                        buildButton(context, "REGISTER", handleRegister),
                        SizedBox(height: 25),
                        buildButton(context, "DEV MENY", (_) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TempButtonsPage()),
                          );
                        }, color: Colors.orange),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context, String text, Function(BuildContext) onPressed,
      {Color color = const Color.fromARGB(255, 122, 255, 186)}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 39, 39, 39),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset.fromDirection(1, 3),
          ),
        ],
      ),
      child: SizedBox(
        width: 240,
        height: 45,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(width: 1.2, color: color),
            backgroundColor: Color.fromARGB(255, 39, 39, 39),
          ),
          onPressed: () => onPressed(context),
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
      ),
    );
  }
}
