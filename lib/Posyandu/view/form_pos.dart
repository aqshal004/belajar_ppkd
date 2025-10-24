import 'package:belajar_ppkd/Posyandu/database/db_helper.dart';
import 'package:belajar_ppkd/Posyandu/model/user_model.dart';
import 'package:flutter/material.dart';

class CRWidgetDay19 extends StatefulWidget {
  const CRWidgetDay19({super.key});

  @override
  State<CRWidgetDay19> createState() => _CRWidgetDay19State();
}

class _CRWidgetDay19State extends State<CRWidgetDay19> {
  final nameC = TextEditingController();
  final emailC = TextEditingController();
  
  getData() {
    DbHelper.getALLUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 12,
          children: [
            Text("Pendaftaran Siswa", style: TextStyle(fontSize: 24)),
            buildTextField(hintText: "Name", controller: nameC),
            buildTextField(hintText: "Email", controller: emailC),
            LoginButton(
              text: "Tambahkan",
              onPressed: () {
                if (nameC.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Nama belum diisi");
                } else if (emailC.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Email belum diisi");
                } else {
                  final UserModel dataStudent = UserModel(
                    name: nameC.text,
                    email: emailC.text,
                  );
                  DbHelper.createStudent(dataStudent).then((value) {
                    emailC.clear();
                    nameC.clear();
                    getData();
                    Fluttertoast.showToast(msg: "Data berhasil ditambahkan");
                  });
                }
              },
            ),
            SizedBox(height: 30),
            FutureBuilder(
              future: DbHelper.getALLUser(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  final data = snapshot.data as List<UserModel>;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final items = data[index];
                        return Column(
                          children: [
                            ListTile(
                              title: Text(items.name),
                              subtitle: Text(items.email),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildTextField({
    String? hintText,
    bool isPassword = false,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
      ),
    );
  }
}