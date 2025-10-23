import 'package:flutter/material.dart';
import 'package:belajar_ppkd/Tugas10/text_field.dart';

class ConfirmTextWidget extends StatefulWidget {
  const ConfirmTextWidget({super.key, required this.nama, required this.domisili});
  final String nama;
  final String domisili;

  @override
  State<ConfirmTextWidget> createState() => _ConfirmTextWidgetState();
}

class _ConfirmTextWidgetState extends State<ConfirmTextWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Confirm Pendaftaran"),),
      body: Center(
        child: Text(
          "Terima kasih, ${widget.nama} dari ${widget.domisili} telah mendaftar.",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}