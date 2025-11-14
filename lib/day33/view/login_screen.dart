import 'package:belajar_ppkd/Tugas6/custom_widget.dart';
import 'package:belajar_ppkd/Tugas8/bottom_nav.dart';
import 'package:belajar_ppkd/day33/service/api.dart';
import 'package:belajar_ppkd/day33/service/api_login.dart';
import 'package:belajar_ppkd/day33/view/profile.dart';
import 'package:belajar_ppkd/day33/view/register_screen.dart';
import 'package:belajar_ppkd/preferences/preferences_handler.dart';
import 'package:flutter/material.dart';

class LoginScreenUserWidget extends StatefulWidget {
  const LoginScreenUserWidget({super.key});

  @override
  State<LoginScreenUserWidget> createState() => _LoginScreenUserWidgetState();
}

class _LoginScreenUserWidgetState extends State<LoginScreenUserWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
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

                  const SizedBox(height: 24),

                  const Text(
                    'Sign in to your',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    'Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Enter your email and password to log in',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
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
                      child: Column(
                        children: [
                          // Google Button
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              side: const BorderSide(color: Color(0xFFE0E0E0)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/google.png',
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  'Continue with Google',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),

                          Row(
                            children: [
                              Expanded(child: Divider(color: Colors.grey[300])),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  'Or login with',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Expanded(child: Divider(color: Colors.grey[300])),
                            ],
                          ),

                          const SizedBox(height: 20),

                          // Email
                          CustomWidget(
                            hintText: 'Email',
                            controller: _emailController,
                          ),

                          const SizedBox(height: 16),

                          // Password
                          CustomWidget(
                            isPassword: true,
                            hintText: 'Password',
                            controller: _passwordController,
                          ),

                          const SizedBox(height: 12),

                          // Remember me
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: _rememberMe,
                                    onChanged: (value) {
                                      setState(() {
                                        _rememberMe = value ?? false;
                                      });
                                    },
                                    activeColor: const Color(0xFF4169E1),
                                  ),
                                  const Text(
                                    'Remember me',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Forgot Password ?',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF4169E1),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          // LOGIN BUTTON (Fix)
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                String email = _emailController.text.trim();
                                String password = _passwordController.text.trim();

                                if (email.isEmpty || password.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Email dan password harus diisi")),
                                  );
                                  return;
                                }

                                try {
                                  final result = await AuthAPILogin.login(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim(),
                                  );

                                  await PreferenceHandler.saveToken(result.data?.token ?? "");
                                  await PreferenceHandler.saveUserData(
                                    result.data?.user?.name ?? "",
                                    result.data?.user?.email ?? "",
                                  );
                                  await PreferenceHandler.saveLogin(true);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Login berhasil")),
                                  );

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (_) => const ProfilePage()),
                                  );
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Login gagal: $e")),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF4169E1),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 0,
                              ),
                              child: const Text(
                                'Log In',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context, 
                                      MaterialPageRoute(builder: (context) => RegisterUserWidget()),
                                      );
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF4169E1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
