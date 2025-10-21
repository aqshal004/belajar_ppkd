import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({super.key});

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  String? dropDownValue;
  final List<String> listText = ["Pakaian", "Makanan", "Minuman"];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: DropdownButton(
            value: dropDownValue,
            items: listText.map((String val) {
              return DropdownMenuItem(
                value: val,
                child: Text(val, style: TextStyle(color: Colors.black)),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                dropDownValue = value;
              });
              print(dropDownValue);
            },
          ),
        ),
         //Tambahan teks hasil pilihan
    if (dropDownValue != null)
      Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Center(
          child: Text(
            "Anda memilih kategori: $dropDownValue",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
      ],
    );
  }
}