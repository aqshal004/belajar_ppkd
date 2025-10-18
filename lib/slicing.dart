import 'package:flutter/material.dart';

class SlicingWidget extends StatefulWidget {
  const SlicingWidget({super.key});

  @override
  State<SlicingWidget> createState() => _SlicingWidgetState();
}

class _SlicingWidgetState extends State<SlicingWidget> {
  bool _obscurePassword = false;
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              height: 397,
              decoration: BoxDecoration(
                color: Color(0xFF2567E8),
              ),
            ),

            SafeArea(
              child: SingleChildScrollView(
                child: SizedBox( width: double.infinity,
                child:Column(
                  children: [
                    SizedBox(height: 40),
                    Image.asset('assets/images/logo.png',
                    height: 28,
                    width: 28,
                    ),
                    SizedBox(height: 24),
                    Text('Sign in to your\nAccount',
                    textAlign: TextAlign.center, 
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 32, 
                      fontWeight: FontWeight.w600
                      ),
                      ),
                      SizedBox(height: 24),
                      Text('Enter your email and password to log in', 
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 12
                        ),
                        ),
                        SizedBox(height: 32),
                
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 24),
                        child: Container(
                          padding: EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                            OutlinedButton(
                              onPressed: (){},
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                side: BorderSide(color: Color(0xFFE0E0E0)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/google.png',
                                  height: 24,
                                  width: 24,
                                  ),
                                  SizedBox(width: 8),
                                  Text('Continue with Google',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    ),
                                    ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Expanded(child:  Divider(
                                  thickness: 1,
                                  color: Color(0xFFE0E0E0),
                                ),
                                ),
                                Padding(padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  'Or login with', 
                                style: TextStyle(
                                  color: Color(0xFF6C7278), 
                                  fontSize: 12,
                                  ),
                                ),
                                ),
                                Expanded(child: Divider(
                                  thickness: 1,
                                  color: Color(0xFFE0E0E0),
                                ),
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                            SizedBox(height: 16),
                            TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 16, 
                                      horizontal: 16
                                      ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: Color(0xFFE0E0E0),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: Color(0xFFE0E0E0),
                                      ),
                                    ),
                                  focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(color: Color(0xFF4169E1)),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 12),
                                TextField(
                                  obscureText: _obscurePassword,
                                   decoration: InputDecoration(
                                    hintText: 'Password',
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 16, 
                                      horizontal: 16
                                      ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: Color(0xFFE0E0E0),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: Color(0xFFE0E0E0),
                                      ),
                                    ),
                                  focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(color: Color(0xFF4169E1)),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility,
                                      color: Colors.grey),
                                      onPressed: (){
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  }
                                  ),
                                ),
                                ),
                                SizedBox(height: 20),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                       _rememberMe = ! _rememberMe;
                                    });
                                  },
                                  child: SizedBox(
                                  child: Row(
                                    
                                    children: [
                                      Checkbox(value: _rememberMe
                                      , onChanged: (value) {
                                        setState(() {
                                          _rememberMe = value ?? false;
                                        });
                                      }, 
                                      ),

                                      Text(
                                        'Remember Me', 
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                          ),
                                        ),
                                        SizedBox(width: 24),
                                        TextButton(
                                          onPressed: (){}, 
                                           child: Text(
                                          'Forgot Password ?',
                                            style: TextStyle(
                                            fontSize: 12, 
                                            color: Color(0xFF4D81E7)
                                    ),
                                    ),
                                    ),
                                    ],
                                  ), 
                                  ), 
                                ), 
                                SizedBox(height: 20),
                                
                          ],
                        ),
                            ),
                            ),
                          ],
                        ),
                            ),
              ),
            ),
          ],
        ),
    );
  }
}