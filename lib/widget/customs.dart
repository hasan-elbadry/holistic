import 'package:flutter/material.dart';

Widget textFormFieldCustom(
    String name, bool isPass, TextEditingController controller, IconData icon) {
  return TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your $name';
      }
      return null;
    },
    controller: controller,
    obscureText: isPass,
    decoration: InputDecoration(
        suffixIcon: Icon(icon),
        label: Text(name),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
  );
}
