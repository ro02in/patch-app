
/*

import 'package:flutter/material.dart';
import 'package:patchappflutter/add_patch_page.dart';
import 'package:patchappflutter/continue_register_page.dart';
import 'package:patchappflutter/profile_page.dart';
import 'package:patchappflutter/register_page.dart';
import 'package:patchappflutter/trade_action_page.dart';
import 'package:patchappflutter/trade_log_page.dart'; // Import för TradeLogPage
import 'package:patchappflutter/faq_page.dart';
import 'package:patchappflutter/patch_added_successfully.dart';

class TempButtonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TEMP MENY')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            _navButton(context, 'Add Patch Page', PatchViewPage()),
            _navButton(context, 'Continue Register Page', ContinueRegisterPage()),
            _navButton(context, 'Profile Page', ProfilePage()),
            _navButton(context, 'Register Page', RegisterPage()),
            _navButton(context, 'Trade Action Page', TradeActionPage()),
            _navButton(context, 'Trade Log Page', TradeLogPage()),
            _navButton(context, 'FAQ Page', FAQPage()),
            _navButton(context, 'Patch Added Successfully Page', PatchAddSuccessPage()),

          ],
        ),
      ),
    );
  }

  Widget _navButton(BuildContext context, String title, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Text(title),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
          textStyle: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

*/
import 'package:flutter/material.dart';
import 'package:patchappflutter/add_patch_page.dart';
import 'package:patchappflutter/continue_register_page.dart';
import 'package:patchappflutter/patch_inventory_page.dart';
import 'package:patchappflutter/profile_page.dart';
import 'package:patchappflutter/register_page.dart';
import 'package:patchappflutter/register_user_confirmed.dart';
import 'package:patchappflutter/trade_action_page.dart';
import 'package:patchappflutter/trade_log_page.dart'; // Import för TradeLogPage
import 'package:patchappflutter/faq_page.dart';
import 'package:patchappflutter/trade_request_success_page.dart'; // Import för din nya sida
import 'package:patchappflutter/patch_added_successfully.dart';
import 'package:patchappflutter/search_page.dart';

class TempButtonsPage extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text('TEMP MENY')),
     body: Padding(
       padding: const EdgeInsets.all(2.0),
       child: ListView(
         children: [
           _navButton(context, 'Add Patch Page', PatchViewPage()),
           _navButton(context, 'Continue Register Page', ContinueRegisterPage()),
           _navButton(context, 'Profile Page', ProfilePage()),
           _navButton(context, 'Register Page', RegisterPage()),
           _navButton(context, 'Trade Action Page', TradeActionPage()),
           _navButton(context, 'Trade Log Page', TradeLogPage()),
           _navButton(context, 'FAQ Page', FAQPage()),
           _navButton(context, 'Patch Added Successfully Page', PatchAddSuccessPage()),
           _navButton(context, 'Search main page', SearchPage()),
           _navButton(context, 'Patch Inventory Page', PatchInventoryPage()),
           _navButton(context, 'Register user confirmed Page', RegisterUserConfirmedPage()),
           _navButton(context,'Trade Request Success Page', TradeRequestSuccessPage(username: 'Oscar'),
           ),
         ],
       ),
     ),
   );
 }


 Widget _navButton(BuildContext context, String title, Widget page) {
   return Padding(
     padding: const EdgeInsets.symmetric(vertical: 8),
     child: ElevatedButton(
       onPressed: () {
         Navigator.push(
           context,
           MaterialPageRoute(builder: (context) => page),
         );
       },
       child: Text(title),
       style: ElevatedButton.styleFrom(
         padding: EdgeInsets.symmetric(vertical: 16),
         textStyle: TextStyle(fontSize: 16),
       ),
     ),
   );
 }
}

