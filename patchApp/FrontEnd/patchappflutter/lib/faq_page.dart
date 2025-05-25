
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vanliga frågor'),
        backgroundColor: const Color(0xFFF382F3),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/stitches9.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildFAQBox(
              question: 'Vad är en ensidig trade?',
              answer:
              'En ensidig trade betyder att du antingen ger bort ett märke utan att få något tillbaka, '
                  'eller att du får ett märke utan att ge något i utbyte.',
            ),
            _buildFAQBox(
              question: 'Vad är en dubbelsidig trade?',
              answer:
              'En dubbelsidig trade betyder att du byter ett märke mot någon annans – alltså att '
                  'du ger ett märke och får ett nytt tillbaka.',
            ),
            _buildFAQBox(
              question: 'Kan jag ändra färg på min ovve?',
              answer:
              'Ja! Du kan välja olika färger till din ovve inne på din profil.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQBox({required String question, required String answer}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Theme(
        data: ThemeData().copyWith(
          dividerColor: Colors.transparent, // Tar bort ful linje
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          title: Text(
            question,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          children: [
            Text(
              answer,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
