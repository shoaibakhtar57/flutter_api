import 'dart:convert';

import 'package:api_testing/app/modules/auth/models/user_model.dart';
import 'package:http/http.dart' as http;

class LoginRepo {
  final baseAPI = 'YOUR API HERE';

  LoginRepo();

  Future<UserModel?> userLogin(userData) async {
    final body = json.encode(userData);
    final headers = {'Content-Type': 'application/json'};
    try {
      final response = await http.post(Uri.parse('${baseAPI}signin'),
          headers: headers, body: body);
      final data = json.decode(response.body);
      return UserModel.fromJson(data);
    } catch (e) {
      print('There was an error while login $e');
      return null;
    }
  }
}
