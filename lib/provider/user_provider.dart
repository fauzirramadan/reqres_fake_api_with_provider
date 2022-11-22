import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:reqres_fake_api/repository/user_repo.dart';
import 'package:reqres_fake_api/response/res_get_user.dart';

import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  UserProvider() {
    init();
  }

  bool isLoading = false;
  bool isFailed = false;
  List<User> dataUser = [];
  final UserRepo _repo = UserRepo();

  void init() async {
    getDaftarUser(page: "2");
  }

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
      isFailed = true;
      notifyListeners();
    }
  }
}
