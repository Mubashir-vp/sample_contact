import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    sharedPreference = await SharedPreferences.getInstance();
  }

  late SharedPreferences sharedPreference;
  var sharedtoken;
  var loggedIn;

  tokenSaving({var token}) async {
    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setString("sharedtoken", token);
    update();
  }

  loginSaving({required bool value}) async {
    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setBool("loggedIn", value);
    update();
  }

  Future<bool?> loginchecking() async {
    var shared = await SharedPreferences.getInstance();

    bool? loginData = shared.getBool(
      "loggedIn",
    );
    return loginData;
  }

  String? tokenFetching() {
    var token = sharedPreference.getString("sharedtoken");
    return token;
  }
}
