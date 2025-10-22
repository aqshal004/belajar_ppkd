import 'package:belajar_ppkd/Tugas7/description.dart';
import 'package:belajar_ppkd/Tugas7/form_input.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  static const List<Widget> _widgetOptions = <Widget>[
    FormInput(),
    DescriptionWidget(),
  ];
  
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
    backgroundColor: Colors.blueAccent,
    index: _selectedIndex,
    onTap: (index){
      setState(() {
        _selectedIndex = index;
      });
    },
    items: [
      CurvedNavigationBarItem(
        child: Icon(Icons.home_outlined),
        label: 'Home',

      ),
      CurvedNavigationBarItem(
        child: Icon(Icons.description),
        label: 'Description',
      ),
    ],
      ),
    );
  }
}