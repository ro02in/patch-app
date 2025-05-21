// huvudsidan för sökningar (scary)

/* LÄSKIG SIDA ATT BYGGA, innan vi börjar ska jag lägga 
  upp en plan så att jag försöker förstå detta

1. Ett sökfält behövs där användaren skriver in sitt sökord
Sökfältet ska ha:
- En TextField (Låta användaren skriva in text - textinmatning)
- En controller (hämtar användarens text in i TextField) Tar 
  textinmatning och lagrar den i en variabel
- Ikon (typ förstoringsglas)
- Eventuellt onChanged eller onSubmitted callback som körs
  varje gång användaren skriver/ändrar text

2. Användarinmatning
 Hanteras av en state management-lösning för att uppdatera
 resultat i realtid när anv skriver
 Antingen onChanged (realtidssök) eller onSubmitted (när enter tryckts)  
   
   
   Användare
 Vi behöver en klass som representerar varje användare (User class)
 Sedan behöver vi koppla mot listan av användare med BACKEND
 Sedan appliceras filtreringsfunktioner baserat på sökordet med
 hjälp av TextEditingController
 När användare är filtrerade kan resultat visas med ex en ListView

När anv skriver in namn skickas request till BACKEND som
hämtar matchande anv

Att anv är variabler = backend skickar lista med anvobjekt 
som loopas igenom och visas

String userName = user.name;
Text(userName);

*/

import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/stitches3.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            // Stor rosa bar med sökruta
            Container(
              width: double.infinity,
              height: 180, // Höjden kan justeras
              padding: const EdgeInsets.only(top: 100,left: 24, right: 24),
              color: const Color(0xFFF382F3),
              child: TextField(
                controller: _searchController,
                style: const TextStyle(color: Colors.black87),
                decoration: InputDecoration(
                  hintText: 'Sök efter användare...',
                  hintStyle: const TextStyle(color: Colors.black54),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.black54),
                ),
                onChanged: (value) {
                  // För söklogik senare!!!!!!!!
                  print('Sökord: $value');
                },
              ),
            ),
            // Här kommer resten av sidan som jag inte byggt än!!!!!!!!!!
          ],
        ),
      ),
    );
  }
}