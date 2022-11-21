import 'package:flutter/material.dart';

import '../widgets/custom_field.dart';
import '../widgets/primary_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
            child: "R E G I S T E R",
            onTap: () {},
          )
        ],
      ),
    ));
  }
}
