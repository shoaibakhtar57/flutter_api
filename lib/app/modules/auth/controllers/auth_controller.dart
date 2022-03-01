import 'dart:convert';

import 'package:api_testing/app/data/login_repo.dart';
import 'package:api_testing/app/modules/auth/models/user_model.dart';
import 'package:api_testing/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginRepo loginRepo = LoginRepo();
  RxBool isLoading = false.obs;

  Rx<UserModel> currentUser = UserModel(email: '', password: '').obs;

  Future<void> loginUser(email, password) async {
    isLoading.value = true;
    final userData = {
      'email': email,
      'password': password,
    };
    final user = await loginRepo.userLogin(userData);
    if (user != null) {
      currentUser.value = user;
      final _prefs = await SharedPreferences.getInstance();
      final encodedUser = json.encode(currentUser.value);
      _prefs.setString('user', encodedUser);
      clearControllers();
      Get.toNamed(Routes.HOME);
      isLoading.value = false;
    } else {
      print('User can\'t be null');
      isLoading.value = false;
    }
  }

  Future<void> getCurrentUser() async {
    final _prefs = await SharedPreferences.getInstance();
    final user = _prefs.getString('user');
    if (user != null) {
      final decodedUser = json.decode(user);
      currentUser.value = decodedUser;
    } else {
      print('No user found locally');
    }
  }

  void clearControllers() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  void onInit() {
    getCurrentUser();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    clearControllers();
  }
}
