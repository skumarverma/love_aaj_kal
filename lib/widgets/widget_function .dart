import 'package:flutter/material.dart';
import 'package:love_aaj_kal/constants/appcolor.dart';

AppBar buildAppBar() {
  return AppBar(
    title: const Text('Love_Aaj_kal'),
    backgroundColor: Appcolors.primary,
  );
}

Widget buildSizeBox(double height) {
  return SizedBox(
    height: height,
  );
}

Widget buildButton(String text, var onclick) {
  return GestureDetector(
    onTap: onclick,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Appcolors.primary),
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget buildTextfield(
    String lable, String hint, TextEditingController ctrl, var icon) {
  return TextFormField(
    keyboardType: TextInputType.visiblePassword,
    decoration: InputDecoration(
      labelText: lable,
      hintText: hint,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(),
    ),
  );
}
