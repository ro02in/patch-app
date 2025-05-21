// Sidan man kommer till efter att ha lagt till ett märke

import 'package:flutter/material.dart';
import 'add_patch_page.dart';

import 'package:flutter/material.dart';

class PatchAddSuccessPage extends StatelessWidget {
  const PatchAddSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF382F3), // Samma som FAQPage
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/stitches9.png'), // Samma bakgrund
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        alignment: const Alignment(0, -0.5),
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Congratulations-rutan
            Container(
              width: 260,
              height: 238,
              padding: const EdgeInsets.all(32.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFF382F3).withOpacity(0.6),
                    blurRadius: 20,
                    offset: const Offset(0, 0),
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center, // Centrerar vertikalt
                children: [
                  Text(
                    'Grattis!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Märket har lagts till \ni din samling.',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 48), // Mellanrum under rutan

            // Knapp 1 - Lägg till fler märken
            GestureDetector(
              onTap: () {
                // TODO: Lägg till funktionalitet här
                print('Lägg till fler märken klickad');
              },
              child: Container(
                width: 307,
                height: 59,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Lägg till fler märken',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16), // Mellanrum mellan knapparna

            // Knapp 2 - Gå till min profil
            GestureDetector(
              onTap: () {
                // TODO: Lägg till funktionalitet här
                print('Gå till min profil klickad');
              },
              child: Container(
                width: 307,
                height: 59,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Gå till min profil',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}