import 'package:belajar_ppkd/Tugas10/confir_text.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nomorController = TextEditingController();
  final TextEditingController domisiliController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("Formulir", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)), backgroundColor: Colors.lightBlueAccent,),
       body: Form(
        key: _formkey,
         child: Padding(
          padding: EdgeInsetsGeometry.all(16.0),
           child: Column(
            children: [
              TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                  labelText: "Email", 
                  hintText: "Enter Your Email", 
                  border: OutlineInputBorder()
                  ),
                  validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email tidak boleh kosong";
                      } else if (!value.contains('@')) {
                        return "Email tidak valid";
                      } else if (!RegExp(
                        r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
                      ).hasMatch(value)) {
                        return "Format Email tidak valid";
                      }
                      return null;
                    },
              ),
              SizedBox(height: 16),
              TextFormField(
                  obscureText: _obscurePassword,
                  controller: passwordController,
                  decoration: InputDecoration(
                  labelText: "Password", 
                  hintText: "Enter Your Password", 
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                  ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password tidak boleh kosong";
                    } else if (value.length < 6) {
                      return "Password minimal 6 karakter";
                    }
                    return null;
                  },
              ),
              SizedBox(height: 16),
              TextFormField(
                  controller: namaController,
                  decoration: InputDecoration(
                  labelText: "Nama", 
                  hintText: "Enter Your Name", 
                  border: OutlineInputBorder()
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Nama tidak boleh kosong";
                    } else if (value.length < 3) {
                      return "Nama terlalu pendek";
                    } else if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
                      return "Nama hanya boleh berisi huruf dan spasi";
                    }
                      return null;
                    },
              ),
              SizedBox(height: 16),
              TextFormField(
                  controller: nomorController,
                  decoration: InputDecoration(
                  labelText: "Nomor HP", 
                  hintText: "Enter Your Number", 
                  border: OutlineInputBorder()
                  ),
                    validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      // Jika diisi, pastikan hanya angka dan panjangnya antara 10-13 digit
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return "Nomor HP hanya boleh berisi angka";
                      } else if (value.length < 10 || value.length > 13) {
                        return "Nomor HP harus 10–13 digit";
                      }
                    }
                      return null;
                    },
              ),
              SizedBox(height: 16),
              TextFormField(
                  controller: domisiliController,
                  decoration: InputDecoration(
                  labelText: "Domisili", 
                  hintText: "Enter Your City", 
                  border: OutlineInputBorder()
                  ),
                  validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Kota domisili tidak boleh kosong";
                      } else if (value.length < 3) {
                        return "Nama kota terlalu pendek";
                      } else if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
                        return "Nama kota hanya boleh berisi huruf dan spasi";
                      }
                      return null;
                    },
              ),
              
            SizedBox(height: 16),
             SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Validasi form dulu
                    if (_formkey.currentState!.validate()) {
                      //Jika valid, tampilkan dialog ringkasan
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Konfirmasi Data"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Nama: ${namaController.text}"),
                                Text("Email: ${emailController.text}"),
                                Text("Nomor HP: ${nomorController.text.isEmpty ? '-' : nomorController.text}"),
                                Text("Domisili: ${domisiliController.text}"),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // tutup dialog
                                },
                                child: const Text("Batal"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // tutup dialog
                                  // 🔹 3. Arahkan ke halaman konfirmasi
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ConfirmTextWidget(
                                        nama: namaController.text,
                                        domisili: domisiliController.text,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text("Daftar"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}