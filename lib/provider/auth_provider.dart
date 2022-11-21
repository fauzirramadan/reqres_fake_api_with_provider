import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reqres_fake_api/repository/auth_repo.dart';
import 'package:reqres_fake_api/response/res_login.dart';
import 'package:reqres_fake_api/response/res_register.dart';
import 'package:reqres_fake_api/utils/nav_utils.dart';
import 'package:reqres_fake_api/utils/notifications_utils.dart';
import 'package:reqres_fake_api/views/home.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;
  final AuthRepo _repo = AuthRepo();
  ResLogin? dataLogin;
  ResRegister? dataRegister;

  Future<void> login({required String email, required String password}) async {
    try {
      isLoading = true;
      notifyListeners();

      ResLogin? res = await _repo.userLogin(email, password);
      if (res!.token != null) {
        dataLogin = res;
        isLoading = false;
        notifyListeners();
        NotificationUtils.showSnackbar(
            message: "LOGIN BERHASIL", color: Colors.green);
        Nav.toAll(const HomePage());
      } else {
        log(res.toString());
        isLoading = false;
        notifyListeners();
        NotificationUtils.showSnackbar(
            message: "GAGAL LOGIN", color: Colors.red);
      }
    } catch (e) {
      log(e.toString());
      isLoading = false;
      notifyListeners();
      NotificationUtils.showSnackbar(
          message: "Terjadi kesalahan yang tidak diketahui", color: Colors.red);
    }
  }
}
