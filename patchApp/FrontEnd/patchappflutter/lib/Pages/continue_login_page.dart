import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:patchappflutter/Pages/temp_buttons_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/stitches1.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.only(top: 0),
          children: [
            AppBar(
              title: const Text('Logga in', style: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 22)),
              backgroundColor: Color.fromARGB(170, 38, 42, 27), //Color.fromARGB(255, 243, 92, 255) rosa
              centerTitle: true,
              toolbarHeight: 57,
              leadingWidth: 125,
              leading: Icon(Icons.arrow_back, color: Colors.white),
              titleSpacing: -23,
              elevation: 15,
              primary: true,
              shadowColor: Color.fromARGB(255, 40, 40, 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(100),
                  )
              ),
            ),

            SizedBox(height: 140),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(26),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 53, 53, 53).withOpacity(0.85),
                    borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Color.fromARGB(255, 70, 70, 70), width: 1.5),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 30, 30, 30),
                        spreadRadius: 4,
                        blurRadius: 20,
                        offset: Offset(0, 2)
                      )
                    ]
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Logga in', style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: 'InknutAntiqua'),
                      ),
                      SizedBox(height: 25),

                      //EMAIL TEXTFIELD
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(120, 20, 20, 20),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 2)
                              )
                            ]
                        ),
                        child: SizedBox(
                          height: 55,
                          width: 260,
                          child: TextField(
                            controller: _emailController,
                            cursorColor: Colors.purpleAccent,
                            cursorHeight: 22,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 15),
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              filled: true,
                              fillColor: Colors.white12,
                              contentPadding: EdgeInsets.only(top: 5, left: 20, bottom: 5, right: 20),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.purpleAccent, width: 1.5),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromARGB(255, 85, 85, 85), width: 1.5),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      //PASSWORD TEXTFIELD
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(120, 20, 20, 20),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 2)
                            )
                          ]
                        ),
                        child: SizedBox(
                          height: 55,
                          width: 260,
                          child: TextField(
                            controller: _passwordController,
                            cursorColor: Colors.purpleAccent,
                            cursorHeight: 22,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.white, fontFamily: 'InknutAntiqua', fontSize: 15),
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              filled: true,
                              fillColor: Colors.white12,
                              contentPadding: EdgeInsets.only(top: 5, left: 20, bottom: 5, right: 20),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.purpleAccent, width: 1.5),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromARGB(255, 85, 85, 85), width: 1.5),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SizedBox(
                          width: 200,
                          height: 50,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 32, 32, 32),
                              side: BorderSide(color: Colors.purpleAccent, width: 1)
                            ),
                            onPressed: handleLogin,
                            child: Text(
                                'Logga in',
                                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'InknutAntiqua')),
                            ),
                          ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}