import 'dart:developer';

import 'package:contact/controller/loginController.dart';
import 'package:contact/services/apiPostServices.dart';
import 'package:contact/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  ApiPostServices apiPostServices = ApiPostServices();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  static GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(
    BuildContext context,
  ) {
    return SafeArea(
      child: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (controller) {
            return Scaffold(
              body: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "SIGN IN",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 50.0.w,
                        right: 50.w,
                      ),
                      child: TextFormField(
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null) {
                            return "This field is required";
                          } else {
                            EmailValidator.validate(
                              value,
                            )
                                ? null
                                : "Please enter a valid email";
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.person,
                          ),
                          hintText: "Username",
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(
                              .18,
                            ),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20.h,
                        left: 50.0.w,
                        right: 50.w,
                        bottom: 25.h,
                      ),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: passwordController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null) {
                            return "This field is required";
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock_outline_rounded,
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(
                              .18,
                            ),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    Wrap(
                      children: [
                        Text(
                          "Don't have an account ? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Register Here",
                          style: TextStyle(
                            color: Colors.blue[400],
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    GestureDetector(
                      onTap: () async {
                        var data = {
                          "email": emailController.text,
                          "password": passwordController.text
                        };
                        if (formkey.currentState!.validate()) {
                          var response = await apiPostServices.login(
                            data: data,
                          );
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                          if (response != null) {
                           await controller.tokenSaving(
                              token: response.data!.token,
                            );
                            controller.loginSaving(
                              value: true,
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (
                                  context,
                                ) =>
                                    const Home(),
                              ),
                            );
                          } else if (response == null) {
                            log("null");
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Email or Password is not matching",
                                ),
                              ),
                            );
                          }
                        }
                      },
                      child: Container(
                        height: 50.h,
                        width: 130.w,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(
                            2.r,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
