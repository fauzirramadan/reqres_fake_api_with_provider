import 'package:flutter/material.dart';
import 'package:reqres_fake_api/views/auth_ui.dart';
import 'package:reqres_fake_api/views/home.dart';

GlobalKey<NavigatorState> navState = GlobalKey();
GlobalKey<ScaffoldMessengerState> scaffoldState = GlobalKey();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fake API with provider',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const AuthUi(),
    );
  }
}
