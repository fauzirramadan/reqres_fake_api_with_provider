import 'package:flutter/material.dart';
import 'package:reqres_fake_api/views/login.dart';
import 'package:reqres_fake_api/views/register.dart';

class AuthUi extends StatefulWidget {
  const AuthUi({super.key});

  @override
  State<AuthUi> createState() => _AuthUiState();
}

class _AuthUiState extends State<AuthUi> with SingleTickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                color: Colors.deepPurple[200],
                padding: const EdgeInsets.all(15),
                child: const Center(
                  child: Text(
                    "WELCOME",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              TabBar(
                  labelColor: Colors.purple,
                  unselectedLabelColor: Colors.grey,
                  controller: _controller,
                  tabs: const [
                    Tab(
                      text: "LOGIN",
                      icon: Icon(Icons.login_outlined),
                    ),
                    Tab(
                      text: "REGISTER",
                      icon: Icon(Icons.app_registration),
                    )
                  ]),
            ],
          ),
        ),
      ),
      body: TabBarView(
          controller: _controller, children: [LoginPage(), RegisterPage()]),
    );
  }
}
