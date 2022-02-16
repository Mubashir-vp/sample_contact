import 'package:contact/controller/loginController.dart';
import 'package:contact/view/loginpage.dart';
import 'package:contact/view/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: () {
        var loginController = Get.put(LoginController());
        return const MaterialApp(
          home: SplashScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    ),
  );
}
