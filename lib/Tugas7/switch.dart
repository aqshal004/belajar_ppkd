import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool isSwithed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
  color: isSwithed ? Colors.black : Colors.white,
  child: Column(
    children: [
      Row(
        children: [
          Text(
            "Aktifkan Mode Gelap",
            style: TextStyle(
              color: isSwithed ? Colors.white : Colors.black,
            ),
          ),
          Switch(
            value: isSwithed, 
            onChanged: (value){
              setState(() {
                isSwithed = value;
              });
            },
          ),
        ],
      ),
      Text(
        isSwithed ? "Mode Gelap Aktif" : "Mode Terang Aktif",
        style: TextStyle(
          color: isSwithed ? Colors.white : Colors.black,
        ),
      ),
    ],
  ),
      ),
);
  }
}