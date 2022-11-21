import 'package:flutter/material.dart';
import 'package:reqres_fake_api/widgets/primary_button.dart';

import '../widgets/custom_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
      alignment: Alignment.center,
      child: ListView(
        children: [
          const CustomTextField(
            hintText: "Email",
            icon: Icons.email_outlined,
          ),
          const SizedBox(
            height: 15,
          ),
          const CustomTextField(
            hintText: "Password",
            icon: Icons.lock_outline,
            isObscure: true,
          ),
          const SizedBox(
            height: 30,
          ),
          PrimaryButton(
            child: "L O G I N",
            onTap: () {},
          )
        ],
      ),
    ));
  }
}
