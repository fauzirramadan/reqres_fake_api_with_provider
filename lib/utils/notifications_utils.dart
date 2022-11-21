import 'package:flutter/material.dart';
import 'package:reqres_fake_api/main.dart';

class NotificationUtils {
  static void showSnackbar(BuildContext context,
      {required String message, Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }
}
