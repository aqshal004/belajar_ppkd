import 'package:belajar_ppkd/Tugas9/list_viewlist.dart';
import 'package:belajar_ppkd/Tugas9/list_viewmap.dart';
import 'package:belajar_ppkd/Tugas9/list_viewmodel.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
 int _selectedIndex = 0;
 
  static const List<Widget> _widgetOptions = <Widget>[
    ListViewListWidget(),
    ListViewMapWidget(),
    ListViewmodelWidget(),
  ];
  
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List View"),
      centerTitle: true,
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
              title: const Text('Kategori List',style: TextStyle(color: Colors.blue),),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
              ),
              ListTile(
              title: const Text('Kategori List Map'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
              ),
              ListTile(
              title: const Text('Kategori Model'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
              ),
              // ListTile(
              // title: const Text('Pilih Tanggal Lahir'),
              // selected: _selectedIndex == 3,
              // onTap: () {
              //   _onItemTapped(3);
              //   Navigator.pop(context);
              // },
              // ),
              // ListTile(
              // title: const Text('Atur Pengingat'),
              // selected: _selectedIndex == 4,
              // onTap: () {
              //   _onItemTapped(4);
              //   Navigator.pop(context);
              // },
              // ),
              Divider(),
              ListTile(
        leading: const Icon(Icons.logout,color: Colors.red,),
        title: const Text('Logout',style: TextStyle(color: Colors.red)),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Logout',),
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
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
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
    );
  }
}