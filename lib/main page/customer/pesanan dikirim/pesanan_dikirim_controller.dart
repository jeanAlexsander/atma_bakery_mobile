import 'dart:convert';

import 'package:atma_bakery_mobile/constraints.dart';
import 'package:atma_bakery_mobile/main%20page/customer/pesanan%20dikirim/pesanan_dikirim_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PesananDikirimController {
  static Future<PesananDikirimModel> fetchPesananDikirim() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var userIdPref = pref.getInt('user_id');
    var url = '${kAPiName}get-pengiriman';
    PesananDikirimModel pesananDikirimModel;

    try {
      final response = await http.post(Uri.parse(url), body: {
        'user_id': userIdPref.toString(),
      });
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        pesananDikirimModel = PesananDikirimModel.fromJson(result);
        return pesananDikirimModel;
      } else {
        throw Exception('Failed to fetch pesanan dikirim');
      }
    } catch (e) {
      throw Exception('Failed to fetch pesanan dikirim');
    }
  }
}
