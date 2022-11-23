import 'package:flutter/foundation.dart';
import 'package:reqres_fake_api/utils/session_manager.dart';

class PrefsProvider extends ChangeNotifier {
  PrefsProvider() {
    init();
  }

  bool? isLogin;

  void init() async {
    await cekSession();
  }

  Future cekSession() {
    return SessionManager.getToken().then((value) {
      if (value != null) {
        isLogin = true;
        notifyListeners();
      } else {
        isLogin = false;
        notifyListeners();
      }
    });
  }
}
