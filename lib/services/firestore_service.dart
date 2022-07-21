import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_service.dart';

class FireStoereService {
  Future<bool> saveToDatabase(CollectionReference ref, Map data) async {
    try {
      return ref.doc(user!.uid).set(data).then((value) {
        return true;
      });
    } catch (e) {
      if (e is FirebaseException) {
        log("save data:" + e.toString());
      }
      log("save data:" + e.toString());
      return false;
    }
  }

  Future<Map?> getUserProfile() async {
    log("run uid:" + user!.uid);
    try {
      DocumentReference<Map<String, dynamic>> reference =
          FirebaseFirestore.instance.collection("users").doc(user!.uid);
      DocumentSnapshot snapshot = await reference.get();
      if (snapshot.exists) {
        Map data = snapshot.data() as Map;

        return data;
      } else {
        return null;
      }
    } catch (e) {
      if (e is FirebaseException) {
        log("save data:" + e.toString());
      }
      log("save data:" + e.toString());
      return null;
    }
  }
}
