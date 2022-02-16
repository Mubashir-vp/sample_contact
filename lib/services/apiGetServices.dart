import 'dart:io';
import 'package:contact/controller/loginController.dart';
import 'package:contact/model/usersListModel.dart';
import 'package:get/get.dart' as prefix;
import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ApiGetServices {
  static var controller = prefix.Get.put(LoginController());
  Future<String?> tokenFetching() async {
    var sharedPreference = await SharedPreferences.getInstance();
    var token =  sharedPreference.getString("sharedtoken");
    return token;
  }

  Dio dio = Dio();
  late List<UsersList?> usersList;

  Future<UsersList?> userList() async {
    var token = await tokenFetching();
    var url = "http://65.0.85.128/index.php/api/users/list";
    var pathUrl = Uri.parse(url);
    try {
      var response = await http.get(
        pathUrl,
        headers: {"Authorization": token!},
      );
      log(response.body);
      if (response.statusCode == 200) {
        return usersListFromJson(response.body);
      } else {
        return null;
      }
    } on SocketException {
      prefix.Get.snackbar(
        "Network Error Occured",
        "Please Check Your Internet",
      );
    }
    return null;
  }

  initializeInterceptors() {
    dio.interceptors.add(InterceptorsWrapper(onError:
        (DioError error, ErrorInterceptorHandler errorInterceptorHandler) {
      log("${error.message}");
    }, onResponse:
        (response, ResponseInterceptorHandler responseinterceptorHandler) {
      log(response.data);
    }));
  }
}
