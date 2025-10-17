import 'package:flutter/material.dart';

class SlicingWidget extends StatefulWidget {
  const SlicingWidget({super.key});

  @override
  State<SlicingWidget> createState() => _SlicingWidgetState();
}

class _SlicingWidgetState extends State<SlicingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 60),
              height: 376,
              width: 394,
              color: Color(0xFF2567E8),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 28,
                    height: 28,
                    color: Colors.white,
                  ),
                  SizedBox(height: 24,),
                  Text(
                    "Sign in to your\nAccount",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold, color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Enter you email and password to log in",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
            ),
            
          ],
        ),
    );
  }
}