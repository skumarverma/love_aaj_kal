import 'package:flutter/material.dart';
import 'package:love_aaj_kal/constants/appcolor.dart';
import 'package:love_aaj_kal/screens/signup.dart';
import 'package:love_aaj_kal/widgets/widget_function%20.dart';
import 'package:get/get.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  var Style;
  TextEditingController passCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: buildAppBar(),
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Form(
                  child: Container(
                    //color: Appcolors.primary,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        buildTextfield(
                            "Email", "Enter Email", emailCtrl, Icons.email),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Form(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        buildTextfield(
                            "Password", "Enter Password", passCtrl, Icons.lock),
                        const SizedBox(
                          height: 30,
                        ),
                        buildButton("Login", () {}),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const Text("Don't have an account ? "),
                            GestureDetector(
                              onTap: (() => Get.to(() => SignUpScreen())),
                              child: const Text(
                                "Register here",
                                style: TextStyle(
                                    color: Appcolors.primary,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
