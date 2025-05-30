
import 'package:flutter/material.dart';
import 'package:patchappflutter/Pages/bottomNavigationBar.dart';

class PostLoginPage extends StatefulWidget {
  const PostLoginPage({super.key});

  @override
  State<PostLoginPage> createState() => _PostLoginPageState();
}

class _PostLoginPageState extends State<PostLoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}