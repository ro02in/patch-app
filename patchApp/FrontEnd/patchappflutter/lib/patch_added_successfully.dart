// Sana skapade sidan man kommer till efter att ha lagt till ett märke

import 'package:flutter/material.dart';
import 'add_patch_page.dart';

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
        child: Stack(
          children: [
            // Den stora "congratulations"-rutan centrerad
            Align(
              alignment: const Alignment(0, -0.3),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                      mainAxisAlignment: MainAxisAlignment.center,
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
                  const SizedBox(height: 80),
                  // De två större knapparna
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
context,
                      MaterialPageRoute(builder: (context) => PatchViewPage()),
                      );
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
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
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

            // Den lilla "Radera märke"-knappen i övre vänstra hörnet under AppBar med ikon
            Positioned(
              top: 16,  // Avstånd från toppen
              left: 32, // Samma padding som i body
              child: GestureDetector(
                onTap: () {
                  print('Radera märke klickad');
                  _showDeleteDialog(context);
                },
                child: Container(
                  width: 160,
                  height: 40,
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
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.delete,
                        size: 20,
                        color: Colors.black87,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Radera märke',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
    //POP-UP rutan när man trycker på "radera märke" knappen
  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text(
            'Är du säker att du vill radera detta märke?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Nej-knappen
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Stäng dialogrutan
                },
                child: const Text(
                  'Nej',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ),

              // Ja-knappen
              TextButton(
                onPressed: () {
                  // radera-funktionalitet
                  print('Märket raderat');
                  Navigator.of(context).pop(); // Stäng dialogrutan
                },
                child: const Text(
                  'Ja, radera märket',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color.fromARGB(255, 226, 50, 50),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}