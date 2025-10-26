import 'package:belajar_ppkd/Tugas1/user_profile.dart';
import 'package:belajar_ppkd/Tugas2/layout.dart';
import 'package:belajar_ppkd/Tugas3/gridview.dart';
import 'package:belajar_ppkd/Tugas4/listview.dart';
import 'package:belajar_ppkd/Tugas5/button.dart';
import 'package:belajar_ppkd/Tugas7/form_input.dart';
import 'package:belajar_ppkd/slicing.dart';
import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    FormInput(),
    Tugas2(),
    Tugas3(),
    Tugas4(),
    Tugas5(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HomeScreen",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: _widgetOptions[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Business'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('School'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
        leading: const Icon(Icons.logout),
        title: const Text('Logout'),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Logout'),
              content: const Text('Apakah Anda yakin ingin logout?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context), // batal
                  child: const Text('Batal'),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Tambahkan logika logout di sini
                    // Navigator.pop(context); // tutup dialog
                    // Navigator.pop(context); // tutup drawer
                    // Misal arahkan ke halaman login:
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SlicingWidget()));
                  },
                  child: const Text('Logout'),
                ),
              ],
            ),
          );
        },
         ),
          ],
        ),
      ),
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
        child: Icon(Icons.search),
        label: 'Search',
      ),
      CurvedNavigationBarItem(
        child: Icon(Icons.chat_bubble_outline),
        label: 'Chat',
      ),
      CurvedNavigationBarItem(
        child: Icon(Icons.newspaper),
        label: 'Feed',
      ),
      CurvedNavigationBarItem(
        child: Icon(Icons.perm_identity),
        label: 'Personal',
      ),
    ],
      ),

      // bottomNavigationBar: NavigationBar(
      //   onDestinationSelected: (int index) {
      //     setState(() {
      //       _selectedIndex = index;
      //     });
      //   },
      //   indicatorColor: Colors.amber,
      //   selectedIndex: _selectedIndex,
      //   destinations: const <NavigationDestination>[
      //     NavigationDestination(
      //       selectedIcon: Icon(Icons.home),
      //       icon: Icon(Icons.home_outlined),
      //       label: 'Home',
      //     ),
      //     NavigationDestination(
      //       icon: Badge(label:Text('2'), child: Icon(Icons.notifications_sharp)),
      //       label: 'Notifications',
      //     ),
      //     NavigationDestination(
      //       icon: Icon(Icons.messenger_sharp),
      //       label: 'Messages',
      //     ),
      //     NavigationDestination(
      //       icon: Icon(Icons.alarm),
      //       label: 'Alarm',
      //     ),
      //   ],
      // ),
    );
  }
}
