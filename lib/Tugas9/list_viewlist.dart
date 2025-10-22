import 'package:flutter/material.dart';

class ListViewListWidget extends StatefulWidget {
  const ListViewListWidget({super.key});

  @override
  State<ListViewListWidget> createState() => _ListViewListWidgetState();
}

class _ListViewListWidgetState extends State<ListViewListWidget> {
  final List<String> namaElektronik = [
    "Tv", 
    "Smartphone", 
    "Playstation", 
    "Radio", 
    "Speaker", 
    "Camera", 
    "Kulkas", 
    "Rice Cooker", 
    "Laptop", 
    "Monitor",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: namaElektronik.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(namaElektronik[index]),
        );
      },
    );
  }
}
