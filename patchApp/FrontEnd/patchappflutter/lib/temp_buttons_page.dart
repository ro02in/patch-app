import 'package:flutter/material.dart';
import 'package:patchappflutter/profile_page.dart';

class TempButtonsPage extends StatelessWidget { 

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(children: [
              ElevatedButton(
                child: Text("Profile page"),
                onPressed: 
                () {
                  Navigator.push( //HÄNVISA TILL NY REGISTRERA KONTO-SIDA
									  	context,
										  MaterialPageRoute(builder: (context) => ProfilePage()),
									);
                } 
                )
            ],
            )
          ],
        )
      )

    );
  }
}