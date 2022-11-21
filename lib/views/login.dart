import 'package:flutter/material.dart';
import 'package:reqres_fake_api/provider/auth_provider.dart';
import 'package:reqres_fake_api/widgets/primary_button.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_field.dart';
import '../widgets/loading_view.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  final GlobalKey<FormState> keyForm = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Form(
        key: keyForm,
        child: Scaffold(
          body: Container(
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
                Consumer<AuthProvider>(builder: (context, bloc, _) {
                  return bloc.isLoading
                      ? const LoadingView()
                      : PrimaryButton(
                          child: "L O G I N",
                          onTap: () async {
                            bool isValid = keyForm.currentState!.validate();
                            if (isValid) {
                              await bloc.login(context,
                                  email: emailC.text, password: passwordC.text);
                            }
                          },
                        );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
