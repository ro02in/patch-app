
import 'package:flutter/material.dart';
import 'package:patchappflutter/Model/user_model.dart';
import 'package:patchappflutter/Pages/add_patch_page.dart';
import 'package:patchappflutter/Pages/continue_register_page.dart';
import 'package:patchappflutter/Pages/other_profile_page.dart';
import 'package:patchappflutter/Pages/patch_inventory_page.dart';
import 'package:patchappflutter/Pages/post_log_in_page.dart';
import 'package:patchappflutter/Pages/profile_page.dart';
import 'package:patchappflutter/Pages/register_page.dart';
import 'package:patchappflutter/Pages/register_user_confirmed.dart';
import 'package:patchappflutter/Pages/trade_action_page.dart';
import 'package:patchappflutter/Pages/trade_log_page.dart'; // Import för TradeLogPage
import 'package:patchappflutter/Pages/faq_page.dart';
import 'package:patchappflutter/Pages/trade_request_success_page.dart'; // Import för din nya sida
import 'package:patchappflutter/Pages/patch_added_successfully.dart';
import 'package:patchappflutter/Pages/search_page.dart';
import 'package:patchappflutter/Provider/user_provider.dart';
import 'package:patchappflutter/global_user_info.dart';

//25 maj

class TempButtonsPage extends StatelessWidget {
  const TempButtonsPage({super.key});

 @override
 Widget build(BuildContext context) {
   //Future<PatchModel> patch = Provider.of<PatchProvider>(context, listen: false).getPatch(23);
   UserModel? user = GlobalUserInfo.currentUser;

   return Scaffold(
     appBar: AppBar(title: Text('TEMP MENY')),
     body: Padding(
       padding: const EdgeInsets.all(2.0),
       child: ListView(
         children: [
           _navButton(context, 'Add Patch Page', PatchViewPage()),
           _navButton(context, 'Continue Register Page', ContinueRegisterPage()),
           _navButton(context, 'Profile Page', ProfilePage(user: user)),
           _navButton(context, 'Register Page', RegisterPage()),
           _navButton(context, 'Trade Action Page', TradeActionPage()),
           _navButton(context, 'Trade Log Page', TradeLogPage()),
           _navButton(context, 'FAQ Page', FAQPage()),
           _navButton(context, 'Patch Added Successfully Page', PatchAddedSuccessfully()),
           _navButton(context, 'Search main page', SearchPage()),
           _navButton(context, 'Patch Inventory Page', PatchInventoryPage()),
           _navButton(context, 'Register user confirmed Page', RegisterUserConfirmedPage()),
           _navButton(context,'Trade Request Success Page', TradeRequestSuccessPage(username: 'Oscar')),
           nav2Button(context, "setGlobalVariables"),
           _navButton(context, 'otherProfile Page', OtherProfilePage()),
           _navButton(context, "PostLogIn Page", PostLoginPage()),


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

  Widget nav2Button(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: () {
          UserModel testingUser = UserModel(firstName: "john", surName: "Testerton", kmName: "Test", university: "Test University", emailAddress: "Test@Email.org", biography: "Testography", username: "Testnameeee", password: "pezword", pictureData: null);
          UserModel othertestingUser = UserModel(id : 21, firstName: "asdasd", surName: "asdasd", kmName: "asd", university: "Test asd", emailAddress: "Test@Email.org", biography: "Testography", username: "Testnameeee", password: "pezword", pictureData: null);
          GlobalUserInfo.otherUser = othertestingUser;
          GlobalUserInfo.currentUser = testingUser;
          GlobalUserInfo.settingStuff();
          GlobalUserInfo.id = 23;
          UserProvider().setCurrentUser(testingUser);
          UserProvider().setCurrentUserVariables(testingUser);
          UserProvider().setCompleteName();
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

