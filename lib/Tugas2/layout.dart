import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

import 'package:flutter/material.dart';

class Tugas2 extends StatelessWidget {
  const Tugas2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profil Lengkap", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)), backgroundColor: Colors.lightBlueAccent,),
      body: Center(
        child: Column(
          children: [
            Text("Aqshal Mumtaz Giffariyanta", 
            style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.email,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'aqshal@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
           //Baris 3: Nomor Telepon
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: const [
                 Spacer(),
                Icon(
                  Icons.phone,
                  color: Colors.green,
                ),
                Text(
                  '0812-3456-7890',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
           //Baris 4: Alamat
          Row(
            children: [
              const SizedBox(width: 12),
              Expanded(child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'Postingan',
                        style: TextStyle(fontSize: 16,color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'Followers',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
            ],   
          ),
          SizedBox(height: 16),
           Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: DashedBorder.fromBorderSide(
                  side: const BorderSide(color: Colors.black, width: 2
                ), dashLength: 5.0,
               ),
              ),
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(8.0),
        child: const Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam suscipit urna in turpis ullamcorper, sed congue nunc molestie. Curabitur porttitor, tortor at facilisis laoreet, magna purus molestie nulla, eu vulputate turpis felis non nisi. Etiam tincidunt euismod leo, eget pretium lacus aliquam ut. Ut rhoncus nisi ut sapien fringilla, quis pretium risus tristique. Fusce sed felis vel libero tincidunt malesuada eget eu tellus. Quisque molestie fermentum vehicula. Nam ultrices aliquet ipsum, et pharetra sem bibendum id. Pellentesque ultrices, urna quis maximus efficitur, augue tellus elementum metus, ut consequat lectus ipsum et massa.",
          style: TextStyle(fontSize: 14),
        ),
      ),
            ),
               Spacer(),
            Container(
              //supaya tidak terlalu mepet ke bawah
              margin: EdgeInsets.only(bottom: 8),
              height: 50,
              decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                "Terima Kasih Sudah Mengunjungi Profil Saya",
                style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}