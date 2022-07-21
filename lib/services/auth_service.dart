import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../screens/home_page_screen.dart';
import '../screens/login_screen.dart';
import '../screens/register_profile.dart';
import 'firestore_service.dart';

FirebaseAuth auth = FirebaseAuth.instance;
User? user = auth.currentUser;

class AuthService {
  Future<void> init() async {
    auth.authStateChanges().listen((firebaseUser) async {
      user = firebaseUser;
      if (firebaseUser == null) {
        Get.offAll(() => LogInScreen());
      } else {
        log("USr mila id: " + user!.uid);
        await FireStoereService().getUserProfile().then((userData) {
          log("data mila" + userData.toString());
          if (userData != null) {
            Get.offAll(() => HomePageScreen());
          } else {
            Get.offAll(() => RegisterProfileScreen());
          }
        });

        
      }
    });
    log("user :${auth.currentUser}");
  }

  Future<void> signUp(String email, String pass) async {
     log("email:$email  pass:$pass");
    await auth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .catchError((e) {
      if (e is FirebaseException) {
        log("Signup Error:" + e.toString());
      }
    });
  }

  Future<void> logIn(String email, String pass) async {
    auth
        .signInWithEmailAndPassword(email: email, password: pass)
        .catchError((e) {
      if (e is FirebaseException) {
        log("Sign in Error:" + e.toString());
      }
    });
  }

  Future<void> signOut() async {
    auth.signOut();
  }
}
