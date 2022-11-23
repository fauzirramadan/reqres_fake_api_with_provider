import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reqres_fake_api/provider/prefs_provider.dart';
import 'package:reqres_fake_api/views/auth_ui.dart';
import 'package:reqres_fake_api/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PrefsProvider(),
      child: Consumer<PrefsProvider>(builder: (context, bloc, _) {
        return MaterialApp(
            title: 'Fake API with provider',
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
            ),
            home: bloc.isLogin == true ? const HomePage() : const AuthUi());
      }),
    );
  }
}
