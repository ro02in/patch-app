/**************************************************************************************************************************************/
//Källhänvisning: Denna fil använder kod från källan 'Flutter Nested Navigation with Persistent Bottom Nav Bar using GetX | Full Tutorial'
//youtu.be/HEQpP8YgJtg?si=u7gPMOCNpQkXq32p av Youtube kanalen Programming With FlexZ, publicerad 14 november 2024, hämtad 22 maj 2025.
/*************************************************************************************************************************************/

/*************************************************************************************************************************************************/
//Källhänvisning: Denna fil använder kod från källan 'Flutter Tutorial - NEW Material You Navigation Bar | The New Way | Flutter Navigation Bar'
//youtu.be/2emB2VFrRnA?si=3rIL8qaMfjoVHHk7 av Youtube kanalen HeyFlutter, publicerad 28 september 2021, hämtad 22 maj 2025
/*************************************************************************************************************************************************/


import 'package:flutter/material.dart';

class BottomNavigationBar extends StatefulWidget {

  @override
  State<BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 60,
      indicatorColor: Color.fromARGB(255, 239, 137, 254),
      backgroundColor: Color.fromARGB(255, 224, 224, 224),
      elevation: 10,
      selectedIndex: index,
      onDestinationSelected: (index) =>
        setState(() => this.index = index),
      destinations: [
          NavigationDestination( //SÖK ANVÄNDARE
              icon: Icon(Icons.search, color: Colors.black),
              label: "Sök användare",
          ),
        NavigationDestination( //SÖK ANVÄNDARE
          icon: Image.asset('assets/yellow.PNG', width: 7, height: 7), label: 'din profil'
        ),
        NavigationDestination(
          icon: Icon(Icons.search, color: Colors.black),
          label: "Sök användare",
        ),
        NavigationDestination(
          icon: Icon(Icons.compare_arrows_sharp, color: Colors.black),
          label: "Byt märken",
        ),
      ]
    );
  }
}