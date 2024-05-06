import 'dart:convert';

import 'package:atma_bakery_mobile/Login/login_model.dart';
import 'package:atma_bakery_mobile/constraints.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  Future<UserLoginModel> loginController(String email, String password) async {
    var url = '${kAPiName}login';
    UserLoginModel userLoginModel;
    final SharedPreferences pref = await SharedPreferences.getInstance();

    try {
      final response = await http.post(Uri.parse(url), body: {
        "email": email,
        "password_hash": password,
      });
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        userLoginModel = UserLoginModel.fromJson(result);

        await pref.setString('email', userLoginModel.data[0].email);
        await pref.setString('first_name', userLoginModel.data[0].firstName);
        await pref.setString('last_name', userLoginModel.data[0].lastName);
        await pref.setString(
            'password_hash', userLoginModel.data[0].passwordHash);
        await pref.setInt('user_id', userLoginModel.data[0].userId);

        return userLoginModel;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data $e');
    }
  }
}
