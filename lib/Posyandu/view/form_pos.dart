import 'package:belajar_ppkd/Posyandu/database/db_helper.dart';
import 'package:flutter/material.dart';

class FormPosyanduWidget extends StatefulWidget {
  const FormPosyanduWidget({super.key});

  @override
  State<FormPosyanduWidget> createState() => _FormPosyanduWidgetState();
}

class _FormPosyanduWidgetState extends State<FormPosyanduWidget> {
  final nameC = TextEditingController();
  final emailC = TextEditingController();
  getData(){
    DbHelper.getALLUser();
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: padding),
    );
  }
}