import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:reqres_fake_api/repository/api.dart';
import 'package:reqres_fake_api/response/res_login.dart';
import 'package:reqres_fake_api/response/res_register.dart';

class AuthRepo {
  Future<ResLogin?> userLogin(String email, String password) async {
    try {
      Response res = await http.post(Uri.parse(Api.loginUrl),
          body: {"email": email, "password": password});
      return resLoginFromJson(res.body);
    } catch (e, st) {
      if (kDebugMode) {
        log(st.toString());
      }
      log("error direpo:  ${e.toString()}");
    }
    return null;
  }

  Future<ResRegister?> userRegister(String email, String password) async {
    try {
      Response res = await http.post(Uri.parse(Api.registerUrl),
          body: {"email": email, "password": password});
      return resRegisterFromJson(res.body);
    } catch (e, st) {
      if (kDebugMode) {
        log(st.toString());
      }
      log("error direpo:  ${e.toString()}");
    }
    return null;
  }
}
