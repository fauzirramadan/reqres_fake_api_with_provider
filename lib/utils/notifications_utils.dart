import 'package:flutter/material.dart';
import 'package:reqres_fake_api/main.dart';

class NotificationUtils {
  static void showSnackbar({required String message, Color? color}) {
    scaffoldState.currentState?.showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }
}
