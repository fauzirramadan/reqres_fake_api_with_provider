import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reqres_fake_api/repository/user_repo.dart';
import 'package:reqres_fake_api/response/res_get_user.dart';

import '../models/user.dart';
import '../utils/notifications_utils.dart';

class UserProvider extends ChangeNotifier {
  bool isLoading = false;
  List<User> dataUser = [];
  final UserRepo _repo = UserRepo();

  Future<void> getDaftarUser({String? page}) async {
    try {
      isLoading = true;
      notifyListeners();

      ResGetUser? res = await _repo.getUser(page: page);
      isLoading = false;
      notifyListeners();
      dataUser = res?.data ?? [];
      log(" data user: ${dataUser.toString()}");
    } catch (e) {
      log(e.toString());
      isLoading = false;
      notifyListeners();
      NotificationUtils.showSnackbar(
          message: "Terjadi kesalahan yang tidak diketahui", color: Colors.red);
    }
  }
}
