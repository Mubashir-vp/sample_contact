import 'package:contact/view/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: () {
        return const MaterialApp(
          home: Login(),
          debugShowCheckedModeBanner: false,
        );
      },
    ),
  );
}
