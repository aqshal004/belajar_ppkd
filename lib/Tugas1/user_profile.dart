import 'package:flutter/material.dart';

class Tugas1 extends StatelessWidget {
  const Tugas1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Profil Saya"), backgroundColor: Colors.blue,),
      body: Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Aqshal Mumtaz Giffariyanta", 
              style: TextStyle(fontSize: 25, color: Colors.red),
               ),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on, color: Colors.blue),
                Text(
                  "Jakarta", 
                  style: TextStyle(fontSize: 16, color: Colors.deepOrangeAccent, 
                  fontWeight: FontWeight.bold),
                  ),
              ],
            ),
            
            Text(
              "Seorang pelajar yang sedang belajar Flutter", 
              style: TextStyle(fontSize: 12),
              ),
          ],
          ),
      ),  
    );
  }
}