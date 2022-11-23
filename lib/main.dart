import 'package:flutter/material.dart';
import 'package:reqres_fake_api/response/res_login.dart';
import 'package:reqres_fake_api/utils/session_manager.dart';
import 'package:reqres_fake_api/views/auth_ui.dart';
import 'package:reqres_fake_api/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isLogin;

  @override
  void initState() {
    SessionManager.getToken().then((value) {
      if (value != null) {
        setState(() {
          isLogin = true;
        });
      } else {
        setState(() {
          isLogin = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fake API with provider',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: isLogin == true ? const HomePage() : const AuthUi());
  }
}
