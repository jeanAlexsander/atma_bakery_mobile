import 'dart:convert';

import 'package:atma_bakery_mobile/constraints.dart';
import 'package:atma_bakery_mobile/main%20page/customer/customer%20profile/customer_saldo_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CustomerController {
  static Future<void> sendEmail() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var emailPref = pref.getString('email');
    var url = '${kAPiName}change-password';
    var data = {'email': emailPref};

    try {
      final response = await http.post(Uri.parse(url), body: data);
      if (response.statusCode == 200) {
      } else {
        throw Exception('Failed to send email');
      }
    } catch (e) {
      throw Exception('Failed to send email');
    }
  }

  static Future<CustomerSaldoModel> fetchSaldo() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var userIdPref = pref.getInt('user_id');
    var url = '${kAPiName}get-saldo';
    CustomerSaldoModel customerSaldoModel;

    try {
      final response = await http.post(Uri.parse(url), body: {
        'user_id': userIdPref.toString(),
      });
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        customerSaldoModel = CustomerSaldoModel.fromJson(result);
        return customerSaldoModel;
      } else {
        throw Exception('Failed to fetch saldo');
      }
    } catch (e) {
      throw Exception('Failed to fetch saldo');
    }
  }
}
