import 'package:api_testing/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  //TODO: if you want to use current user data in further app

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          //TODO: if you want to use current user data in further app
          authController.currentUser.value.email,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
