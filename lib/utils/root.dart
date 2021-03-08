import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/Controller/AuthController.dart';
import 'package:test_app/Controller/UserController.dart';
import 'package:test_app/Screens/ShowData.dart';
import 'package:test_app/Screens/SignIn.dart';

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user?.uid != null) {
          return ShowData();
        } else {
          return Login();
        }
      },
    );
    /* Obx(() {
      return (Get.find<AuthController>().user != null) ? Home() : LogIn();
    }); */
  }
}
