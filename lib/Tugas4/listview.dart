import 'package:flutter/material.dart';

class Tugas4 extends StatelessWidget {
  const Tugas4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kit Store"),
        centerTitle: true,
        ),
      body: ListView(
        padding:const EdgeInsets.all(8.0 ),
        physics: AlwaysScrollableScrollPhysics(),
        children : [
          Text("Nama"),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Masukan Nama Anda"
            ),
          ),
          SizedBox(height: 16,),
           Text("Email"),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Masukan Email Anda"
            ),
          ),
          SizedBox(height: 16,),
           Text("No HP"),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Masukan No HP Anda"
            ),
          ),
          SizedBox(height: 16,),
           Text("Deskripsi"),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Ini Deskripsi Anda"
            ),
          ),
          SizedBox(height: 16,),
          // ListView.builder(
          //   itemCount: 6,
          //   shrinkWrap: true,
          //   itemBuilder: (BuildContext context, int index){
          //     return 
              ListTile(      
                leading: Image.asset("assets/images/bayern.png"),
                title: Text("Jersey Bayern Munich", style: TextStyle(fontSize: 16),),
                subtitle: Text("Rp.5.000.000"),
                trailing: Icon(Icons.more_horiz),
              ),
              ListTile(      
                leading: Image.asset("assets/images/barcelona.png"),
                title: Text("Jersey Barcelona", style: TextStyle(fontSize: 16),),
                subtitle: Text("Rp.5.000.000"),
                trailing: Icon(Icons.more_horiz),
              ),
              ListTile(      
                leading: Image.asset("assets/images/mancity.png"),
                title: Text("Jersey Manchester City", style: TextStyle(fontSize: 16),),
                subtitle: Text("Rp.5.000.000"),
                trailing: Icon(Icons.more_horiz),
              ),
              ListTile(      
                leading: Image.asset("assets/images/muhome.png"),
                title: Text("Jersey MU Home", style: TextStyle(fontSize: 16),),
                subtitle: Text("Rp.5.000.000"),
                trailing: Icon(Icons.more_horiz),
              ),
              ListTile(      
                leading: Image.asset("assets/images/muaway.png"),
                title: Text("Jersey MU Away", style: TextStyle(fontSize: 16),),
                subtitle: Text("Rp.5.000.000"),
                trailing: Icon(Icons.more_horiz),
              ),
              ListTile(      
                leading: Image.asset("assets/images/madrid.png"),
                title: Text("Jersey Real Madrid", style: TextStyle(fontSize: 16),),
                subtitle: Text("Rp.5.000.000"),
                trailing: Icon(Icons.more_horiz),
              ),
          //   }
          // ),
        ],
      ),
    );
  }
}