import 'dart:io';
import 'package:get/get.dart' as prefix;
import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import '../model/userLoginModel.dart';

class ApiPostServices {
  Dio dio = Dio();
  UserloginData userloginData = UserloginData();
  Future<UserloginData?> login({required var data}) async {
    var url = "http://65.0.85.128/index.php/api/users/login";
    var path = Uri.parse(url);

    try {
      var response = await http.post(path, body: data);
      log(response.body);
      if (response.statusCode == 200) {
        return userloginDataFromJson(response.body);
      } else {
        return null;
      }

    } on SocketException {
      prefix.Get.snackbar(
        "Network Error Occured",
        "Please Check Your Internet",
      );
    }
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
