
import 'package:flutter/material.dart';
import 'package:patchappflutter/trade_log_page.dart';


class TradeRequestSuccessPage extends StatefulWidget {
 final String username;


 const TradeRequestSuccessPage({super.key, required this.username});


 @override
 State<TradeRequestSuccessPage> createState() => _TradeRequestSuccessPageState();
}


class _TradeRequestSuccessPageState extends State<TradeRequestSuccessPage> {
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text('Trade Request Sent'),
       backgroundColor: const Color(0xFFF382F3),
     ),
     body: Container(
       decoration: const BoxDecoration(
         image: DecorationImage(
           image: AssetImage('assets/stitches9.png'),
           fit: BoxFit.cover,
         ),
       ),
       child: Padding(
         padding: const EdgeInsets.all(24.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             // Box 1 – success text + icon
             Container(
               padding: const EdgeInsets.all(24),
               decoration: BoxDecoration(
                 color: Colors.white.withOpacity(0.95),
                 borderRadius: BorderRadius.circular(16),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.black.withOpacity(0.2),
                     blurRadius: 6,
                     offset: const Offset(0, 3),
                   ),
                 ],
               ),
               child: Column(
                 children: [
                   // Här kan du lägga till checkmark-bild
                   // Image.asset('assets/check.png', height: 60),
                   const Icon(Icons.check_circle, color: Colors.green, size: 60),
                   const SizedBox(height: 12),
                   const Text(
                     'Trade request was successfully sent!',
                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                     textAlign: TextAlign.center,
                   ),
                 ],
               ),
             ),


             const SizedBox(height: 24),


             // Box 2 – wait message
             Container(
               padding: const EdgeInsets.all(20),
               decoration: BoxDecoration(
                 color: Colors.white.withOpacity(0.9),
                 borderRadius: BorderRadius.circular(16),
               ),
               child: Text(
                 'Wait for "${widget.username}" to respond to the request.',
                 style: const TextStyle(fontSize: 16),
                 textAlign: TextAlign.center,
               ),
             ),


             const SizedBox(height: 40),


             // Button – back to trade log
             ElevatedButton(
               onPressed: () {
                 Navigator.pushReplacement(
                   context,
                   MaterialPageRoute(builder: (context) => TradeLogPage()),
                 );
               },
               style: ElevatedButton.styleFrom(
                 backgroundColor: const Color(0xFFDDD7E1),
                 padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                 textStyle: const TextStyle(fontSize: 16),
               ),
               child: const Text('Back to Trade Log'),
             ),
           ],
         ),
       ),
     ),
   );
 }
}
