import 'package:belajar_ppkd/Tugas8/bottom_nav.dart';
import 'package:belajar_ppkd/constant/appimage.dart';
import 'package:belajar_ppkd/day18/login_screen.dart';
import 'package:belajar_ppkd/day33/view/login_screen.dart';
import 'package:belajar_ppkd/day33/view/profile.dart';
import 'package:belajar_ppkd/preferences/preferences_handler.dart';
import 'package:flutter/material.dart';

class SplashScreenUserWidget extends StatefulWidget {
  const SplashScreenUserWidget({super.key});

  @override
  State<SplashScreenUserWidget> createState() => _SplashScreenUserWidgetState();
}

class _SplashScreenUserWidgetState extends State<SplashScreenUserWidget> {
  @override
  void initState() {
    super.initState();
    isLoginFunction();
  }

  isLoginFunction() async {
    Future.delayed(Duration(seconds: 3)).then((value) async {
      var isLogin = await PreferenceHandler.getLogin();
      print(isLogin);
      if (isLogin != null && isLogin == true) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreenUserWidget()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset(AppImages.radio)),
          Text(
            "Apel Apps",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class DrawerWidgetDay15 {
}