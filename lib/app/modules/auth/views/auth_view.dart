import 'package:api_testing/app/modules/auth/views/sign_view.dart';
import 'package:api_testing/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AuthView'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.currentUser.value.email.isEmpty
            ? SignInView()
            : HomeView(),
      ),
    );
  }
}
