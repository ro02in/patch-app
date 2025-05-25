
import 'package:flutter/material.dart';

class PatchInventoryPage extends StatelessWidget {
  final String name = "Neonhjärta";
  final String description = "Ett färgstarkt neonmärke som lyser upp overallen.";
  final String color = "Svart";
  final String club = "Ultunesaren";
  final String placement = "Vänster arm";
  final bool isPublic = true;
  final bool isTradable = true;
  final int amount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 31, 31),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/stitches3.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: [
              // Antal + Bild (ny Stack-layout)
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  // Bild + namn i mitten
                  Column(
                    children: [
                      const SizedBox(height: 10),
                      CircleAvatar(
                        radius: 60,
                        //backgroundColor: Colors.white,
                        foregroundImage: AssetImage("assets/neonheart.png"),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'InknutAntiqua',
                        ),
                      ),
                    ],
                  ),

                  // Antal till vänster
                  Positioned(
                    top: 40,
                    left: 20,
                    child: Column(
                      children: [
                        const Text(
                          "Antal",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'InknutAntiqua',
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 5),
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: Color.fromARGB(255, 37, 37, 54),
                          child: Text(
                            "$amount",
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'CalSans',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Info-boxar
              _glowBox(description),
              _glowBox(color),
              _glowBox(club),
              _glowBox(placement),

              const SizedBox(height: 20),

              // Public & Bytesbar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _neonTag("Public", isPublic),
                  _neonTag("Bytesbar", isTradable),
                ],
              ),

              const SizedBox(height: 30),

              // Edit-knapp
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 243, 68, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 14),
                  ),
                  child: const Text(
                    'Edit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'InknutAntiqua',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Glow box för info
  Widget _glowBox(String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Center(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 122, 255, 186),
                blurRadius: 5,
                spreadRadius: 2,
                offset: Offset(1, 2),
              )
            ],
          ),
          child: Text(
            value,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'InknutAntiqua',
            ),
          ),
        ),
      ),
    );
  }

  // Neon knapp (Public/Bytesbar)
  Widget _neonTag(String text, bool active) {
    return Container(
      width: 130,
      height: 45,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 122, 255, 159),
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 239, 137, 254),
            blurRadius: 4,
            spreadRadius: 1,
          )
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontFamily: 'InknutAntiqua',
          fontSize: 14,
        ),
      ),
    );
  }
}