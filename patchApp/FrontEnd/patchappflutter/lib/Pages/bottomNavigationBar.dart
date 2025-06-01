/*************************************************************************************************************************************************/
//Källhänvisning: Denna fil använder kod från källan 'Flutter Tutorial - NEW Material You Navigation Bar | The New Way | Flutter Navigation Bar'
//youtu.be/2emB2VFrRnA?si=3rIL8qaMfjoVHHk7 av Youtube kanalen HeyFlutter, publicerad 28 september 2021, hämtad 22 maj 2025
/*************************************************************************************************************************************************/

import 'package:flutter/material.dart';
import 'package:patchappflutter/Pages/profile_page.dart';
import 'package:patchappflutter/Pages/search_page.dart';
import 'package:patchappflutter/Pages/trade_log_page.dart';

import '../Model/User_model.dart';
import '../global_user_info.dart';

class CustomBottomNavigationBar extends StatefulWidget {

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {

  List<Widget> screens = [SearchPage(), ProfilePage(user: GlobalUserInfo.currentUser), TradeLogPage()];
  int index = 1; //går direkt till 'Din profil' profile page

  @override
  Widget build(BuildContext context) => Scaffold(
    body: screens[index],
    bottomNavigationBar: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 236, 94, 255),
            spreadRadius: 8,
            blurRadius: 15,
            offset: Offset(0, 1)
          )
        ]
      ),    //Color.fromARGB(255, 44, 44, 44) grå
      child: NavigationBarTheme(
          data: NavigationBarThemeData( //obs man ändrar både indicatorColor, indicatorShape Color och overlayColor Color
            indicatorColor: Color.fromARGB(255, 236, 94, 255),
            indicatorShape: const CircleBorder(side: BorderSide(width: 45, color: Color.fromARGB(255, 236, 94, 255))),
            //indicatorShape: ShapeBorder,
            overlayColor: WidgetStateProperty.all(Color.fromARGB(255, 236, 94, 255),),
            labelTextStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white, fontSize: 15.5, fontFamily: 'DMSans', fontWeight: FontWeight.w500, letterSpacing: 0.1))
          ),
          child: NavigationBar(
          height: 122,
          //backgroundColor: Color.fromARGB(255, 50, 50, 50),
          backgroundColor: Color.fromARGB(255, 44, 44, 44),
          labelPadding: EdgeInsets.only(top: 15),
          //labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected, //dölja menyalt. för mer tydlig animation
          animationDuration: const Duration(milliseconds: 400),
          selectedIndex: index,
          onDestinationSelected: (index) =>
              setState(() => this.index = index),
              //setState(() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => screens[index]))), //NYTT
              destinations: [
              NavigationDestination( //SÖK ANVÄNDARE-SIDA
              icon: Icon(Icons.search, color: Colors.white, size: 38),
              label: "Sök användare",
              selectedIcon: Icon(Icons.search, color: Colors.black, size: 38),
          ),
            Padding(
              padding: EdgeInsets.zero,
              child: NavigationDestination( //PROFILE PAGE-SIDA
                icon: Image.asset('assets/yellow.PNG', width: 66, height: 66, fit: BoxFit.fill),
                label: 'Din profil',
              ),
            ),
            NavigationDestination( //BYT MÄRKE-SIDA
              icon: Icon(Icons.compare_arrows_sharp, color: Colors.white, size: 38),
              label: "Byt märken",
              selectedIcon: Icon(Icons.compare_arrows_sharp, color: Colors.black, size: 43),
            ),
            ]
         ),
      ),
    ),
  );
}

