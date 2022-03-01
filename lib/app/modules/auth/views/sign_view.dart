import 'package:api_testing/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInView extends StatelessWidget {
  SignInView({Key? key}) : super(key: key);

  GlobalKey _formKey = GlobalKey<FormState>();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.isLoading.value == true
          ? Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.emailController,
                  ),
                  TextFormField(
                    controller: controller.passwordController,
                  ),
                  GestureDetector(
                    onTap: () async {
                      // if(_formKey.currentState.validate())
                      await controller.loginUser(
                          controller.emailController.text.trim(),
                          controller.passwordController.text);
                    },
                    child: Container(
                      height: 50.0,
                      width: 120.0,
                      child: Center(
                        child: Text('Signin'),
                      ),
                    ),
                  )
                ],
              ),
            )),
    );
  }
}
