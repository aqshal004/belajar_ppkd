import 'package:flutter/material.dart';

class Tugas5 extends StatefulWidget {
const Tugas5({super.key});
  @override
  State<Tugas5> createState() => _Tugas5State();
}

class _Tugas5State extends State<Tugas5> {
  bool showNama = false;
  bool isFavorite = false;
  bool isShare = false;
  bool showMore = false;
  int  counter = 0;
  bool showText = false;
  int  angka = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Button"), centerTitle:true,),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,),
                  onPressed: (){
                    print("Tombol di tekan");
                     showNama = !showNama;
                    setState(() {    
                    });
                  },
                     onLongPress: () {
                      print("Tombol di tekan lama");
                      showNama = !showNama;
                      setState(() {         
                      });
                      },
                  child: Text(showNama ? "Sembunyikan Nama" : "Tampilkan Nama"),
                ),
              ),
              if(showNama) ...[
              Row(
                children: [
                  SizedBox(height: 20,),
                  Image.asset(  
                    'assets/images/griezmann.png',
                    width: 80,
                    height: 80,
                  ), 
                  Text("Aqshal Mumtaz Giffariyanta", style: TextStyle(fontSize: 12, color: Colors.black),),
                ],
              ),
            ],
            SizedBox(height: 20,),
            Container(
              height: 250,
              width: double.infinity,
                decoration: BoxDecoration(color: Colors.transparent),
                child: Center(
                  child: Image.asset( 
                    'assets/images/indo.jpg',
                    width: 450,
                    height: 450,
                  ),
                  // Text(
                  //   "Ciie ga tampil",
                  //   style: TextStyle(color: Colors.white, fontSize: 30),
                  // ),
                ), 
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Column(
                  children: [
                    IconButton(
                    icon: Icon(Icons.favorite, color: isFavorite ? Colors.red : Colors.grey,), 
                    onPressed: (){
                      isFavorite = !isFavorite;
                      setState(() {         
                      });
                    }),
                    Text(isFavorite ? "Disukai" : ""),
                  ],
                ),
                SizedBox(width: 12,),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.share, color:isShare ? Colors.green : Colors.grey,),
                      onPressed: (){
                        isShare = !isShare;
                        setState(() {         
                        });
                      }),
                     Text(isShare ? "Dibagikan" : ""),
                  ],  
                ),
              ],
            ),
            Divider(),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  margin: EdgeInsets.only(top: 4),
                  width: double.infinity,
                  child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam dignissim nulla luctus ultrices feugiat. Curabitur blandit arcu libero, vel eleifend eros mattis vulputate. Nunc a orci dolor. Donec tempor viverra condimentum. Integer arcu arcu, posuere non mollis in, auctor et nulla. Nunc interdum cursus turpis vitae condimentum. Nam luctus nunc nisi, iaculis vehicula tortor auctor non. Pellentesque eu magna vel ipsum ultricies iaculis id vel risus.Nam non facilisis justo. Phasellus volutpat commodo purus non feugiat. Vivamus gravida ipsum imperdiet accumsan varius. Sed eget lorem viverra, dapibus lectus ut,",
                  maxLines: showMore ? 30 : 3,
                  
                  overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        showMore = !showMore;
                        setState(() {         
                        });
                      },
                      child: Text(showMore ? "Lihat Sedikit" : "Lihat Selengkapnya"),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("$counter",style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 12,
                    children: [FloatingActionButton(onPressed: (){
                      counter++;
                      setState(() {         
                      });
                    },
                    child: Icon(Icons.add),
                    ),
                    FloatingActionButton(onPressed:(){
                      counter--;
                      setState(() {         
                      });
                    },
                    child: Icon(Icons.remove),
                    ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.all(12),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(22),
              ),
              child: InkWell(
                onTap: (){
                  print("Tombol di tekan");
                  showText = !showText;
                  setState(() {         
                  });
                },
                child: Center(
                  child: Text(showText ? "" : "Tombol InkWell", style: TextStyle(color: Colors.black, fontSize: 20),),
                ),
              )
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.all(12),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(22),
              ),
              child: GestureDetector(
                onTap: (){
                  print("Tombol di tekan");
                  angka++;
                  setState(() {         
                  });
                },
                onDoubleTap: () {
                  print("Tombol di tekan dua kali");
                  angka+= 2;
                  setState(() {         
                  });
                },
                onLongPress: () {
                  print("Tombol di tekan lama");
                  angka+= 3;
                  setState(() {         
                  });
                },
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Tombol GestureDetector" , style: TextStyle(color: Colors.black, fontSize: 20),),
                      Text("$angka" , style: TextStyle(color: Colors.black, fontSize: 20),),
                    ],
                  ),
                ),
              )
            ),
        ],
        ),
      ),
    );
  }
}