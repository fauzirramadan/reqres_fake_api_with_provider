import 'package:flutter/material.dart';

class Nav {
  static Future<dynamic> to(BuildContext context,
      {required Widget page}) async {
    return await Navigator.push(
        context, MaterialPageRoute(builder: (_) => page));
  }

  static Future<dynamic> toAll(BuildContext context,
      {required Widget page}) async {
    return await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    );
  }
}
