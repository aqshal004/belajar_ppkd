import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({super.key});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? selectedPicked = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(DateFormat('EEEE, dd MMMM yyyy', "id_ID").format(selectedPicked!)),
          ElevatedButton(
            onPressed: () async {
              final DateTime? picked = await showDatePicker(
              context: context, 
              firstDate: DateTime(1000), 
              lastDate: DateTime(2100),
              );
              if (picked != null){
                print(picked);
                setState(() {
                  selectedPicked = picked;
                });
              }
            },
            child: Text("Pilih Tanggal Lahir"),
          ),
        ],
      ),
    );
  }
}