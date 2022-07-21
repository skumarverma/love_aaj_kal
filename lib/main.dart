import 'dart:async';
import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:love_aaj_kal/constants/appcolor.dart';
import 'package:love_aaj_kal/screens/login_screen.dart';
import 'package:love_aaj_kal/screens/register_profile.dart';
import 'package:love_aaj_kal/screens/signup.dart';
import 'package:love_aaj_kal/services/auth_service.dart';
import 'package:love_aaj_kal/widgets/widget_function%20.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatelessWidget {
  SplashScreen() {
    log("message");

    Timer(Duration(seconds: 2), (() => AuthService().init()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          buildSizeBox(290),
          Center(
            child: Image(image: AssetImage("assets/images/love.jpg")),
          ),
        ],
      ),
    );
  }
}
