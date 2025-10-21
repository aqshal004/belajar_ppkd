import 'package:flutter/material.dart';

class DescriptionWidget extends StatefulWidget {
  const DescriptionWidget({super.key});

  @override
  State<DescriptionWidget> createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(child: Icon(Icons.person),),
            SizedBox(height: 12),
            Text("E-POS",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text("E-POS (Electronic Point of Sale) adalah kombinasi perangkat keras dan lunak untuk memproses transaksi, melacak inventaris, dan mengelola data penjualan secara elektronik di bisnis ritel, sementara epos dalam sastra adalah cerita kepahlawanan yang biasanya disampaikan dalam bentuk syair", textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text("Aqshal Mumtaz Giffariyanta", style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8,),
            Text("Marshmello 1.0.6",
            style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}