// Elias skapade sidan man kommer till efter att trade gjorts
//24 maj ändringar

import 'package:flutter/material.dart';
import 'package:patchappflutter/Pages/trade_log_page.dart';

//25 maj

class TradeRequestSuccessPage extends StatefulWidget {
 final String username;

 const TradeRequestSuccessPage({super.key, required this.username});


 @override
 State<TradeRequestSuccessPage> createState() => _TradeRequestSuccessPageState();
}


class _TradeRequestSuccessPageState extends State<TradeRequestSuccessPage> {

 @override
 Widget build(BuildContext context) {
   var screenSize = MediaQuery.of(context).size; //screensize

   return Scaffold(
     body: ListView(
       padding: EdgeInsets.only(top: 0),
       physics: AlwaysScrollableScrollPhysics(),
       children: [
         Container(
           width: screenSize.width,
           height: screenSize.height,
           decoration: BoxDecoration(
             image: DecorationImage(
               image: AssetImage('assets/stitches9.png'),
               fit: BoxFit.cover,
             ),
           ),

           //padding: const EdgeInsets.all(24.0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               AppBar(
                 backgroundColor: Color.fromARGB(170, 35, 39, 25),
                 elevation: 40,
                 shadowColor: Colors.black,
                 toolbarHeight: 65,
                 leadingWidth: 400,
                 leading: Icon(Icons.check, color: Colors.green, size: 45),
                 centerTitle: true,
                 titleSpacing: -1,
                 primary: true,
                 //Källhänvisning: 'Rounded bottom on appbar', stackoverflow.com/questions/50242087/rounded-bottom-on-appbar publicerad 13 september 2020, hämtad 23 maj 2025
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.vertical(
                       bottom: Radius.circular(100),
                     )
                 ),
               ),

               SizedBox(height: 80),

               // Box 1 – success text + icon
               Container(
                 height: 170,
                 width: 300,
                 padding: const EdgeInsets.all(24),
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(30),
                   boxShadow: [
                     BoxShadow(
                         color: const Color.fromARGB(255, 63, 213, 40),
                         spreadRadius: 0.3,
                         blurRadius: 0,
                         offset: Offset(5, 7)
                     ),
                   ],
                 ),
                 child: Column(
                   children: [
                     // Här kan du lägga till checkmark-bild
                     // Image.asset('assets/check.png', height: 60),
                     //Källhänvisning: Kod från StackOverflow foruminlägg "How to add gradient on icons": stackoverflow.com/questions/73870549/how-to-add-gradient-on-icons hämtad 1/5-2025 kl 16:00
                     Container(
                       child: Container(
                         height: 60,
                         width: 60,
                         decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(100),
                         ),
                         child: ShaderMask(blendMode: BlendMode.srcIn,
                             shaderCallback: (Rect bounds) => LinearGradient(
                                 begin: Alignment.bottomLeft, //diagonal gradient
                                 end: Alignment.topRight, //diagonal gradient
                                 stops: [.3, 1],
                                 colors: [const Color.fromARGB(255, 36, 213, 77), const Color.fromARGB(
                                     255, 142, 255, 115)]).createShader(bounds),
                             child: Icon(
                               Icons.check_circle_outline_sharp,
                               size: 60,
                             )
                         ),
                       ),
                     ),
                     const SizedBox(height: 12),
                     const Text(
                       'Märkesbyteförfrågan har skickats!',
                       style: TextStyle(fontSize: 16, fontFamily: 'InknutAntiqua'),
                       textAlign: TextAlign.center,
                     ),
                   ],
                 ),
               ),

               const SizedBox(height: 37),

               // Box 2 – wait message
               Container(
                 width: 300,
                 height: 85,
                 padding: const EdgeInsets.all(20),
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(26),
                   boxShadow: [
                     BoxShadow(
                         color: Color.fromARGB(255, 234, 111, 255),
                         spreadRadius: 0.3,
                         blurRadius: 0,
                         offset: Offset(5, 7)
                     ),
                   ],
                 ),
                 child: Text(
                   'Vänta på att "${widget.username}" \nbesvarar din förfrågan.',
                   style: const TextStyle(fontSize: 16, fontFamily: 'InknutAntiqua'),
                   textAlign: TextAlign.center,
                 ),
               ),


               const SizedBox(height: 195),


               // Button – back to trade log
               Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(30),
                   boxShadow: [
                     BoxShadow(
                       color: Color.fromARGB(255, 234, 111, 255),
                       spreadRadius: 2,
                       blurRadius: 6,
                       offset: Offset(0.5, 1)
                     )
                   ]
                 ),
                 child: Container(
                   width: 295,
                   height: 58,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(30),
                       boxShadow: [
                         BoxShadow(
                             color: Color.fromARGB(255, 234, 111, 255),
                             spreadRadius: 0.5,
                             blurRadius: 0,
                             offset: Offset(0, 0)
                         )
                       ]
                   ),
                   child: ElevatedButton(
                       onPressed: () {
                         Navigator.pushReplacement(
                           context,
                           MaterialPageRoute(builder: (context) => TradeLogPage()),
                         );
                       },
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Color.fromARGB(255, 238, 125, 255),
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                       ), child: Text('Gå tillbaka till Byteslogg', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontFamily: 'InknutAntiqua', color: Colors.black))),
                 ),
               )
             ],
           ),
         ),
       ],
     ),
   );
 }
}
