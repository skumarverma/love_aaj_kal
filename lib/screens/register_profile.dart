import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:love_aaj_kal/widgets/widget_function%20.dart';
import '../services/auth_service.dart';
import '../services/firestore_service.dart';
import 'home_page_screen.dart';
// import '../services/firestore_service.dart';

class RegisterProfileScreen extends StatefulWidget {
  const RegisterProfileScreen({Key? key}) : super(key: key);

  @override
  State<RegisterProfileScreen> createState() => _RegisterProfileScreenState();
}

enum Gender { Male, Female }

class _RegisterProfileScreenState extends State<RegisterProfileScreen> {
  var nameCtrl = TextEditingController();
  var user_nameCtrl = TextEditingController();
  CollectionReference reference =
      FirebaseFirestore.instance.collection("users");

  Gender gender = Gender.Male;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSizeBox(20),
                  Text("Register Profile"),
                  buildSizeBox(20),
                  buildTextfield("Name", "Enter Name", nameCtrl, Icons.person),
                  buildSizeBox(20),
                  buildTextfield("Username", "Enter Username", user_nameCtrl,
                      Icons.person),
                  buildSizeBox(20),
                  Text("Select Gender:"),
                  Row(
                    children: [
                      Text("Male:"),
                      Radio(
                          value: Gender.Male,
                          groupValue: gender,
                          onChanged: (Gender? val) {
                            setState(() {
                              gender = val!;
                            });
                          }),
                      Text("Female"),
                      Radio(
                          value: Gender.Female,
                          groupValue: gender,
                          onChanged: (Gender? val) {
                            setState(() {
                              gender = val!;
                            });
                          })
                    ],
                  ),
                  buildSizeBox(20),
                  Center(
                      child: buildButton("Save", () {
                    log("name:" + nameCtrl.text);
                    log("username:" + user_nameCtrl.text);
                    log("gender:" + gender.name);
                    Map<String, dynamic> data = {
                      "name": nameCtrl.text,
                      "username": user_nameCtrl.text,
                      "gender": gender.name
                    };

                    FireStoereService()
                        .saveToDatabase(reference, data)
                        .then((value) {
                      if (value) Get.offAll(() => HomePageScreen());
                    });
                  }))
                ],
              )),
        ],
      ),
    );
  }
}
