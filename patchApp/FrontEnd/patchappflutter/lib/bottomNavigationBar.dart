/**************************************************************************************************************************************/
//Källhänvisning: Denna fil använder kod från källan 'Flutter Nested Navigation with Persistent Bottom Nav Bar using GetX | Full Tutorial'
//youtu.be/HEQpP8YgJtg?si=u7gPMOCNpQkXq32p av Youtube kanalen Programming With FlexZ, publicerad 14 november 2024, hämtad 22 maj 2025.
/*************************************************************************************************************************************/

/*************************************************************************************************************************************************/
//Källhänvisning: Denna fil använder kod från källan 'Flutter Tutorial - NEW Material You Navigation Bar | The New Way | Flutter Navigation Bar'
//youtu.be/2emB2VFrRnA?si=3rIL8qaMfjoVHHk7 av Youtube kanalen HeyFlutter, publicerad 28 september 2021, hämtad 22 maj 2025
/*************************************************************************************************************************************************/

import 'package:flutter/material.dart';
import 'package:patchappflutter/profile_page.dart';
import 'package:patchappflutter/search_page.dart';
import 'package:patchappflutter/trade_log_page.dart';

class CustomBottomNavigationBar extends StatefulWidget {

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  List<Widget> screens = [SearchPage(), ProfilePage(), TradeLogPage()];
  int index = 1; //går direkt till profile page

  @override
  Widget build(BuildContext context) => Scaffold(
    body: screens[index],
    bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Color.fromARGB(255, 239, 137, 254),
          backgroundColor: Color.fromARGB(255, 224, 224, 224),
          elevation: 10,
        ),
        child: NavigationBar(
        height: 80,
        backgroundColor: Color.fromARGB(255, 224, 224, 224),
        //selectedIndex: index,
        onDestinationSelected: (index) =>
            setState(() => this.index = index),
            //setState(() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => screens[index]))), //NYTT
            destinations: [
            NavigationDestination( //SÖK ANVÄNDARE
            icon: Icon(Icons.search, color: Colors.black),
            label: "Sök användare",
        ),
          NavigationDestination( //SÖK ANVÄNDARE
            icon: Image.asset('assets/yellow.PNG', width: 55, height: 55),
            label: 'Din profil',
          ),
          NavigationDestination(
            icon: Icon(Icons.compare_arrows_sharp, color: Colors.black),
            label: "Byt märken",
          ),
          ]
       )
    ),
  );
}

