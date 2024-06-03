import 'dart:convert';

import 'package:atma_bakery_mobile/constraints.dart';
import 'package:atma_bakery_mobile/main%20page/customer/customer%20profile/tarik%20saldo%20history/tarik_saldo_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TarikSaldoController {
  static Future<TarikSaldoModel> fetchHistorySaldo() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var userIdPref = pref.getInt('user_id');
    var url = '${kAPiName}get-history-saldo';
    TarikSaldoModel tarikSaldoModel;

    try {
      final response = await http.post(Uri.parse(url), body: {
        'user_id': userIdPref.toString(),
      });

      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        tarikSaldoModel = TarikSaldoModel.fromJson(result);
        return tarikSaldoModel;
      } else {
        throw Exception('Failed to fetch history saldo');
      }
    } catch (e) {
      throw Exception('Failed to fetch history saldo');
    }
  }
}
