import 'package:flutter/material.dart';
import 'package:belajar_ppkd/extensions/rupiah.dart';
import  'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';

class ListViewMapWidget extends StatefulWidget {
  const ListViewMapWidget({super.key});

  @override
  State<ListViewMapWidget> createState() => _ListViewMapWidgetState();
}

class _ListViewMapWidgetState extends State<ListViewMapWidget> {
  final List<Map<String, dynamic>> namaElektronik = [
    {
      "name": "Tv",
      "icon": Icons.tv,
    },
        {
      "name": "Smartphone",
      "icon": Icons.smartphone,
    },
        {
      "name": "Playstation",
      "icon": Icons.playlist_add,
    },
        {
      "name": "Radio",
      "icon": Icons.radio,
    },
        {
      "name": "Speaker",
      "icon": Icons.speaker,
    },
        {
      "name": "Camera",
      "icon": Icons.camera,
    },
        {
      "name": "Kulkas",
      "icon": Icons.restore_from_trash_outlined,
    },
        {
      "name": "Rice Cooker",
      "icon": Icons.rice_bowl,
    },
        {
      "name": "Laptop",
      "icon": Icons.laptop,
    },
        {
      "name": "Monitor",
      "icon": Icons.monitor,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: namaElektronik.length,
      itemBuilder: (BuildContext context, int index) {
        final item = namaElektronik[index];
        return ListTile(
        leading: Icon(item['icon']),title: Text(item['name']),);
          // onTap: () {
            //Versi 1
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     backgroundColor: AppColor.army1,
            //     content: Text(
            //       "${item["name"]} ${item["price"].toString().toRPCurrency()} aja",
            //     ),
            //   ),
            // );

            //Versi 2
            // Fluttertoast.showToast(
            //   backgroundColor: Colors.blue,
            //   msg:
            //       "${item["name"]} ${item["price"].toString().toRPCurrency()} aja",
            // );

            //Versi 3
          //   DelightToastBar(
          //     autoDismiss: true,
          //     snackbarDuration: Duration(milliseconds: 2000),
          //     builder: (context) => ToastCard(
          //       leading: Icon(Icons.flutter_dash, size: 28),
          //       title: Text(
          //         "${item["name"]} ${item["price"].toString().toRPCurrency()} aja",
          //         style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
          //       ),
          //     ),
          //   ).show(context);
          // },
          // leading: Image.asset(item["icon"], width: 60),
          // title: Text(item["name"]),
          // subtitle: Text(item["price"].toString().toRPCurrency()),
      },
    );
  }
}