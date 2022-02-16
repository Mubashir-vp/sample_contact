import 'package:contact/view/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/loginController.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginChecking();
  }

  loginChecking() async {
    LoginController controller = Get.find();
    var loginResult = await controller.loginchecking();

    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      loginResult == true
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (
                  context,
                ) =>
                    const Home(),
              ),
            )
          : Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (
                  context,
                ) =>
                    Login(),
              ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/splashImag.jpg"),
      ),
    );
  }
}
