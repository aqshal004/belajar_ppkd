import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              activeColor: Color(0xFF1055C9),
              value: isChecked, 
              onChanged: (value){
              print(value);
              setState(() {
                isChecked = value!;
              });
            }
            ),
        Text("Saya menyetujui semua persyaratan yang berlaku"),
          ],
        ),
         Text(
          isChecked? "Lanjutkan Pendaftaran Diperbolehkan" : "Anda belum bisa melanjutkan",style:TextStyle(color: isChecked ? Colors.green : Colors.red)), 
        ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF3396D3)),
          onPressed: isChecked ? (){} : null, 
        child: Text("Daftar")    
        ),
          ],
    );
  }
}