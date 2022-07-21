import 'package:flutter/material.dart';
import 'package:love_aaj_kal/constants/appcolor.dart';
import 'package:love_aaj_kal/widgets/widget_function%20.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var Style;
  TextEditingController passCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 35,
                  color: Appcolors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 31),
                child: Form(
                    child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      buildTextfield(
                          "Email", "Enter Email", emailCtrl, Icons.email),
                      const SizedBox(
                        height: 31,
                      ),
                      buildTextfield(
                          "Password", "Enter Possword", passCtrl, Icons.lock),
                      const SizedBox(
                        height: 31,
                      ),
                      buildButton("Sign Up", () {}),
                      const SizedBox(
                        height: 31,
                      ),
                      Row(
                        children: [
                          const Text("Already have an account ?"),
                          GestureDetector(
                            onTap: (() => Get.back()),
                            child: Text(
                              "Login Here",
                              style: TextStyle(
                                  color: Appcolors.primary,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
