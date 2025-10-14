import 'package:flutter/material.dart';

class Tugas3 extends StatelessWidget {
  const Tugas3({super.key});

  @override  
  Widget build(BuildContext context) {
    final List listcolor = [
      Color (0xffF5AD18),
      Color (0xffBF092F),
      Color (0xff3B9797),
      Color (0xffFF9D00),
      Color (0xffFFCF71),
      Color (0xffF4E9D7),

    ];
    return Scaffold(
      appBar: AppBar(title: Text("GridView")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nama"),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Masukan Nama Anda"
                ),
              ),
              SizedBox(height: 16,),
              Text("Email"),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Masukan Nama Anda"
                ),
              ),
              SizedBox(height: 16,),
              Text("No HP"),
               TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Masukan Nama Anda"
                ),
              ),
              SizedBox(height: 16,),
              Text("Deskripsi"),
               TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Masukan Nama Anda"
                ),
              ),
              SizedBox(height: 16,),
              GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: listcolor[index],
                        borderRadius:  BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Text(
                            "Container ${index +1}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
}
}