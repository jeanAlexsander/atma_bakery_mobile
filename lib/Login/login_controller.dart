import 'dart:convert';

import 'package:atma_bakery_mobile/Login/login_model.dart';
import 'package:atma_bakery_mobile/constraints.dart';
import 'package:http/http.dart' as http;

class LoginController {
  Future<UserLoginModel> loginController(String email, String password) async {
    var url = '${kAPiName}login';
    UserLoginModel userLoginModel;

    try {
      final response = await http.post(Uri.parse(url), body: {
        "email": email,
        "password_hash": password,
      });
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        userLoginModel = UserLoginModel.fromJson(result);
        return userLoginModel;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data $e');
    }
  }
}
