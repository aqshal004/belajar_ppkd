import 'package:belajar_ppkd/Tugas9/models/electronik.dart';
import 'package:belajar_ppkd/extensions/rupiah.dart';
import 'package:flutter/material.dart';
import 'package:belajar_ppkd/constant/appimage.dart';

class ListViewmodelWidget extends StatefulWidget {
  const ListViewmodelWidget({super.key});

  @override
  State<ListViewmodelWidget> createState() => _ListViewmodelWidgetState();
}

class _ListViewmodelWidgetState extends State<ListViewmodelWidget> {
  final List<ElectronikModel> namaElektronik = [
    ElectronikModel(
    name: "Tv",
    price: 5000,
    image: AppImages.tv,
    description: "adalah perangkat elektronik.",
  ),
   ElectronikModel(
    name: "Smartphone",
    price: 5000,
    image: AppImages.smartphone,
    description: "adalah ponsel pintar.",
  ),
   ElectronikModel(
    name: "Playstation",
    price: 5000,
    image: AppImages.playstation,
    description: "adalah konsol permainan video.",
  ),
   ElectronikModel(
    name: "Radio",
    price: 5000,
    image: AppImages.radio,
    description: "adalah perangkat elektronik yang menerima sinyal.",
  ),
   ElectronikModel(
    name: "Speaker",
    price: 5000,
    image: AppImages.speaker,
    description: "adalah alat elektronik yang mengubah sinyal.",
  ),
   ElectronikModel(
    name: "Camera",
    price: 5000,
    image: AppImages.camera,
    description: "adalah perangkat untuk mengambil foto.",
  ),
   ElectronikModel(
    name: "Kulkas",
    price: 5000,
    image: AppImages.kulkas,
    description: "adalah perangkat elektronik untuk untuk mendinginkan dan mengawetkan makanan.",
  ),
   ElectronikModel(
    name: "Rice Cooker",
    price: 5000,
    image: AppImages.ricecooker,
    description: "adalah perangkat elektronik untuk memasak nasi secara otomatis.",
  ),
   ElectronikModel(
    name: "Laptop",
    price: 5000000,
    image: AppImages.laptop,
    description: "komputer portable yang bisa dibawa ke mana saja.",
  ),
   ElectronikModel(
    name: "Monitor",
    price: 5000000,
    image: AppImages.monitor,
    description: "layar yang digunakan untuk menampilkan output visual.",
  ),
  ];
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: namaElektronik.length,
      itemBuilder: (BuildContext context, int index) {
        final item = namaElektronik[index];
        return SingleChildScrollView(
          physics: ScrollPhysics(),
          child: ListTile(
            onTap: (){
          
            },
            leading: Image.asset(item.image, width: 60),
            title: Text(item.name),
            subtitle: Text(item.description),
          ),
        );
      },
    );
  }
}