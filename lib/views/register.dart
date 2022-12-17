import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reqres_fake_api/provider/auth_provider.dart';
import 'package:reqres_fake_api/widgets/loading_view.dart';

import '../widgets/custom_field.dart';
import '../widgets/primary_button.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  final GlobalKey<FormState> keyForm = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        body: Form(
          key: keyForm,
          child: Container(
            padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
            alignment: Alignment.center,
            child: ListView(
              children: [
                CustomTextField(
                  controller: emailC,
                  hintText: "Email",
                  icon: Icons.email_outlined,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: passwordC,
                  hintText: "Password",
                  icon: Icons.lock_outline,
                  isObscure: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                Consumer<AuthProvider>(
                  builder: (context, bloc, _) {
                    return bloc.isLoading
                        ? const LoadingView()
                        : PrimaryButton(
                            child: "R E G I S T E R",
                            onTap: () async {
                              bool isValid = keyForm.currentState!.validate();
                              if (isValid) {
                                await bloc.register(context,
                                    email: emailC.text,
                                    password: passwordC.text);
                              }
                            },
                          );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
