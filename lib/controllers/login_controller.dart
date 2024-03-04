import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_users_list/controllers/appstate_controller.dart';

class LoginController extends GetxController {
  late String? loginName;
  static const String loginKey = 'login';

  late final SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    loginName = getLogin();
    if(loginName == null) {
      Get.find<AppStateController>().setLogoutState();
    } else {
      _setCurrentUser(loginName!);
    }
  }

  Future<void> setLogin(String nv) {
    return prefs.setString(loginKey, nv);
  }

  String? getLogin() {
    return prefs.containsKey(loginKey) ? prefs.getString(loginKey) : null;
  }

  Future<void> changeLoginStatus(String v) async {
    await setLogin(v);
    _setCurrentUser(v);
  }

  Future<bool> _setCurrentUser(String user) async {
    if (loginName != user) {
      loginName = user;
      setLogin(user);//pre-cache children
      Get.find<AppStateController>().setLoginState(user);
    }
    return true;
  }

  Future<void> logout() async {
    if (loginName != null) {
      loginName = null;
    }
    Get.find<AppStateController>().setLogoutState();
  }
}