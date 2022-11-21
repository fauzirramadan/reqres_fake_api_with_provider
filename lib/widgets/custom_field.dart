import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final IconData? icon;
  final bool? isObscure;
  const CustomTextField(
      {Key? key, this.hintText, this.icon, this.controller, this.isObscure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure ?? false,
      validator: (value) => value!.isEmpty ? "Tidak boleh kosong" : null,
      controller: controller,
      decoration: InputDecoration(hintText: hintText, suffixIcon: Icon(icon)),
    );
  }
}
