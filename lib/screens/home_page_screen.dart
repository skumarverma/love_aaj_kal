import 'package:flutter/material.dart';

import 'package:love_aaj_kal/services/auth_service.dart';
import '../widgets/widget_function .dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

enum Gender { male, female }

class _HomePageScreenState extends State<HomePageScreen> {
  var nameCtrl = TextEditingController();
  var user_nameCtrl = TextEditingController();
  Gender gender = Gender.male;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSizeBox(20),
              Text("Home page"),
              buildButton("Signout", () {
                AuthService().signOut();
              })
            ],
          ),
        )
      ]),
    );
  }
}

class AuthService {
  void signOut() {}
}