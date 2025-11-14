import 'package:belajar_ppkd/day33/models/register_model.dart';
import 'package:belajar_ppkd/day33/service/api.dart';
import 'package:belajar_ppkd/preferences/preferences_handler.dart';
import 'package:flutter/material.dart';

class RegisterUserWidget extends StatefulWidget {
  const RegisterUserWidget({super.key});

  @override
  State<RegisterUserWidget> createState() => _RegisterUserWidgetState();
}

class _RegisterUserWidgetState extends State<RegisterUserWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _domisiliController = TextEditingController();
  final TextEditingController _nomorhpController = TextEditingController();
  bool isLoading = false;
  RegisterUserModel user = RegisterUserModel();
  final _formkey = GlobalKey<FormState>();
  bool isVisibile = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 397,
            decoration: const BoxDecoration(
              color: Color(0xFF4169E1),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40),

                  // Logo
                  Image.asset(
                    'assets/images/logo.png',
                    width: 28,
                    height: 28,
                  ),
                  const SizedBox(height: 16),

                  // Title
                  const Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    'Your Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 32),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: 'Nama Lengkap',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Nama Tidak Boleh Kosong';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
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
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: !isVisibile,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    isVisibile
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isVisibile = !isVisibile;
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
                            SizedBox(height: 24),
                            // TextFormField(
                            //   controller: _domisiliController,
                            //   decoration: InputDecoration(
                            //     labelText: 'Domisili',
                            //     border: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(8),
                            //     ),
                            //   ),
                            //    validator: (value) {
                            //     if (value == null || value.isEmpty) {
                            //       return 'Domisili Tidak Boleh Kosong';
                            //     }
                            //     return null;
                            //   },
                            // ),
                            // SizedBox(height: 24),
                            // TextFormField(
                            //   controller: _nomorhpController,
                            //   decoration: InputDecoration(
                            //     labelText: 'Nomor HP',
                            //     border: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(8),
                            //     ),
                            //   ),
                            //   validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return "Nomor HP tidak boleh kosong";
                            //   } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                            //     return "Nomor HP hanya boleh berisi angka";
                            //   } else if (value.length < 10 || value.length > 13) {
                            //     return "Nomor HP harus 10–13 digit";
                            //   }
                            //   return null;
                            // },

                            // ),
                            const SizedBox(height: 22),
                            ElevatedButton(
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                print(_emailController.text);
                                setState(() {
                                  isLoading = true;
                                });

                                try {
                                  final result = await AuthAPI.registerUser(
                                    email: _emailController.text,
                                    name: _nameController.text,
                                    password: _passwordController.text,
                                  );

                                  setState(() {
                                    isLoading = false;
                                    user = result;
                                  });

                                  // Simpan token
                                  await PreferenceHandler.saveToken(user.data!.token!);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Register Success')),
                                  );

                                  Navigator.pop(context);
                                } catch (e) {
                                  setState(() {
                                    isLoading = false;
                                  });

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Register gagal: $e')),
                                  );
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4169E1),
                              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // kembali ke halaman sebelumnya
                            },
                            child: const Text(
                              "Back",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          ],
                          
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
