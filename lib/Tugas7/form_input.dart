import 'package:belajar_ppkd/Tugas7/checkbox.dart';
import 'package:belajar_ppkd/Tugas7/date_picker.dart';
import 'package:belajar_ppkd/Tugas7/switch.dart';
import 'package:belajar_ppkd/Tugas7/dropdown.dart';
import 'package:belajar_ppkd/Tugas7/time_picker.dart';
import 'package:flutter/material.dart';

class FormInput extends StatefulWidget {
  const FormInput({super.key});

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  int _selectedIndex = 0;
 
  static const List<Widget> _widgetOptions = <Widget>[
    CheckBoxWidget(),
    SwitchWidget(),
    DropdownWidget(),
    DatePickerWidget(),
    TimePickerWidget(),
  ];
  
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Input"),
      // centerTitle: true,
      ),
      body: _widgetOptions[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text("Drawer Header")
              ),
              ListTile(
              title: const Text('Syarat Ketentuan',style: TextStyle(color: Colors.blue),),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
              ),
              ListTile(
              title: const Text('Mode Gelap'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
              ),
              ListTile(
              title: const Text('Kategori Produk'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
              ),
              ListTile(
              title: const Text('Pilih Tanggal Lahir'),
              selected: _selectedIndex == 3,
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
              ),
              ListTile(
              title: const Text('Atur Pengingat'),
              selected: _selectedIndex == 4,
              onTap: () {
                _onItemTapped(4);
                Navigator.pop(context);
              },
              ),
              Divider(),
          ],
        ),
      ),
    // bottomNavigationBar: CurvedNavigationBar(
    // backgroundColor: Colors.blueAccent,
    // index: _selectedIndex,
    // onTap: (index){
    //   setState(() {
    //     _selectedIndex = index;
    //   });
    // },
    // items: [
    //   CurvedNavigationBarItem(
    //     child: Icon(Icons.home_outlined),
    //     label: 'Home',
    //   ),
    //   CurvedNavigationBarItem(
    //     child: Icon(Icons.description),
    //     label: 'Description',
    //   ),
    // ],
    //   ),
    );
  }
}