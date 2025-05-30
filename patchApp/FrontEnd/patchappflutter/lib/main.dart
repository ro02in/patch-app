
import 'package:flutter/material.dart';
import 'package:patchappflutter/Model/patch_model.dart';
import 'package:patchappflutter/Pages/add_patch_page.dart';
import 'package:patchappflutter/Pages/continue_login_page.dart';
import 'package:patchappflutter/Pages/continue_register_page.dart';
import 'package:patchappflutter/Pages/start_page.dart';
import 'package:patchappflutter/Pages/temp_buttons_page.dart';
import 'package:patchappflutter/Provider/user_provider.dart';
import 'package:patchappflutter/Provider/Patch_Provider.dart';
import 'package:patchappflutter/Provider/trade_request_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => PatchProvider()),
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => TradeProvider()),
    ],
    child: MaterialApp(
      home: StartPage(),
  ),
    builder: (context, child) {
      // No longer throws
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StartPage(),);
    }
  );
 }
}
