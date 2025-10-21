import 'package:flutter/material.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({super.key});

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
         ElevatedButton(
            onPressed: () async {
              final TimeOfDay? picked = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (picked != null) {
                print(picked);
                setState(() {
                  selectedTime = picked;
                });
              }
            },
            child: Text("Pilih waktu pengingat"),
          ),
           if (selectedTime != null)
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            "Pengingat diatur pukul: ${selectedTime!.format(context)}",
            style: TextStyle(fontSize: 16),
          ),
        ),
        ],
      ),
    );
  }
}