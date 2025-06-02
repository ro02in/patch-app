/*
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/stitches9.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
          children: [
            AppBar(
              title: const Text('Vanliga frågor', style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 22)),
              backgroundColor: Color(0xFFFF87FF),
              centerTitle: true,
              toolbarHeight: 57,
              leadingWidth: 125,
              titleSpacing: -23,
              elevation: 15,
              primary: true,
              shadowColor: Color.fromARGB(255, 40, 40, 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(100),
                  )
              ),
            ),

            SizedBox(height: 20),

            _buildFAQBox(
              question: 'Vad är en ensidig trade?',
              answer:
              'En ensidig trade betyder att du antingen ger bort ett märke utan att få något tillbaka, '
                  'eller att du får ett märke utan att ge ett märke i utbyte.',
            ),
            _buildFAQBox(
              question: 'Vad är en dubbelsidig trade?',
              answer:
              'En dubbelsidig trade betyder att du byter ett märke mot någon annans – alltså att '
                  'du ger ett märke och får ett nytt tillbaka.',
            ),
            _buildFAQBox(
              question: 'Kan jag ändra färg på min ovve (overall)?',
              answer:
              'Ja! Du kan välja olika färger till din ovve (overall) inne på Din profil.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQBox({required String question, required String answer}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 50),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 7,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Theme(
        data: ThemeData().copyWith(
          dividerColor: Colors.transparent, // Tar bort ful linje
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
          expansionAnimationStyle: AnimationStyle(curve: Curves.easeInOutCubicEmphasized, duration: const Duration(milliseconds: 350), reverseCurve: Curves.easeOutBack, reverseDuration: Duration(milliseconds: 450)),
          title: Text(
            question,
            style: const TextStyle(
              fontSize: 17.5,
              fontWeight: FontWeight.bold,
              color: Colors.black, fontFamily: 'InknutAntiqua'
            ),
          ),
          children: [
            Text(
              answer,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87, fontFamily: 'InknutAntiqua'
              ),
            ),
          ],
        ),
      ),
    );
  }
}


 */


import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/stitches9.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
          children: [
            AppBar(
              title: const Text('Vanliga frågor', style: TextStyle(color: Colors.black, fontFamily: 'InknutAntiqua', fontSize: 22)),
              backgroundColor: Color(0xFFFF87FF),
              centerTitle: true,
              toolbarHeight: 57,
              leadingWidth: 125,
              titleSpacing: -23,
              elevation: 15,
              primary: true,
              shadowColor: Color.fromARGB(255, 40, 40, 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(100),
                  )
              ),
            ),

            SizedBox(height: 20),

            _buildFAQBox(
              question: 'Kan jag ta bort ett märke?',
              answer:
              'Ja. För att ta bort ett märke, går du in i märket och klickar på knappen med soptunna-ikonen!',
            ),
            _buildFAQBox(
              question: 'Hur lägger jag till ett märke?',
              answer:
              'Tryck på lägg till märke och fyll i informationen!',
            ),
            _buildFAQBox(
              question: 'Kan jag ändra färg på min ovve (overall)?',
              answer:
              'Ja! Du kan välja olika färger till din ovve, inne på Din profil genom att scrolla bland ovvarna.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQBox({required String question, required String answer}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 50),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 7,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Theme(
        data: ThemeData().copyWith(
          dividerColor: Colors.transparent, // Tar bort ful linje
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
          expansionAnimationStyle: AnimationStyle(curve: Curves.easeInOutCubicEmphasized, duration: const Duration(milliseconds: 350), reverseCurve: Curves.easeOutBack, reverseDuration: Duration(milliseconds: 450)),
          title: Text(
            question,
            style: const TextStyle(
                fontSize: 17.5,
                fontWeight: FontWeight.bold,
                color: Colors.black, fontFamily: 'InknutAntiqua'
            ),
          ),
          children: [
            Text(
              answer,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87, fontFamily: 'InknutAntiqua'
              ),
            ),
          ],
        ),
      ),
    );
  }
}
