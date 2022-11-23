// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reqres_fake_api/repository/auth_repo.dart';
import 'package:reqres_fake_api/response/res_login.dart';
import 'package:reqres_fake_api/response/res_register.dart';
import 'package:reqres_fake_api/utils/nav_utils.dart';
import 'package:reqres_fake_api/utils/notifications_utils.dart';
import 'package:reqres_fake_api/utils/session_manager.dart';
import 'package:reqres_fake_api/views/home.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;
  final AuthRepo _repo = AuthRepo();
  ResLogin? dataLogin;
  ResRegister? dataRegister;

  Future<void> login(BuildContext context,
      {required String email, required String password}) async {
    try {
      isLoading = true;
      notifyListeners();

      ResLogin? res = await _repo.userLogin(email, password);

      if (res!.token != null) {
        dataLogin = res;
        await SessionManager.saveToken(token: dataLogin!.token.toString());
        log(dataLogin!.token.toString());
        isLoading = false;
        notifyListeners();
        NotificationUtils.showSnackbar(context,
            message: "LOGIN BERHASIL", color: Colors.green);
        Nav.toAll(context, page: const HomePage());
      } else {
        log(res.token.toString());
        isLoading = false;
        notifyListeners();
        NotificationUtils.showSnackbar(context,
            message: "GAGAL LOGIN", color: Colors.red);
      }
    } catch (e) {
      log(e.toString());
      isLoading = false;
      notifyListeners();
      NotificationUtils.showSnackbar(context,
          message: "Terjadi kesalahan yang tidak diketahui", color: Colors.red);
    }
  }

  Future<void> register(BuildContext context,
      {required String email, required String password}) async {
    try {
      isLoading = true;
      notifyListeners();

      ResRegister? res = await _repo.userRegister(email, password);
      if (res!.token != null) {
        dataRegister = res;
        isLoading = false;
        notifyListeners();
        NotificationUtils.showSnackbar(context,
            message: "REGISTER BERHASIL SILAHKAN LOGIN TERLEBIH DAHULU",
            color: Colors.green);
      } else {
        log(res.toString());
        isLoading = false;
        notifyListeners();
        NotificationUtils.showSnackbar(context,
            message: "GAGAL REGISTER", color: Colors.red);
      }
    } catch (e) {
      log(e.toString());
      isLoading = false;
      notifyListeners();
      NotificationUtils.showSnackbar(context,
          message: "Terjadi kesalahan yang tidak diketahui", color: Colors.red);
    }
  }
}
