import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:reqres_fake_api/repository/api.dart';
import 'package:reqres_fake_api/response/res_get_user.dart';

class UserRepo {
  Future<ResGetUser?> getUser({String? page}) async {
    try {
      var url = Uri.http(Api.baseUrl, "/users", {"page": page});
      Response res = await http.get(url);
      return resGetUserFromJson(res.body);
    } catch (e, st) {
      if (kDebugMode) {
        log(st.toString());
      }
      log("error get user di repo : $e");
    }
    return null;
  }
}
