import 'dart:convert';
import 'dart:ffi';

import 'package:atma_bakery_mobile/constraints.dart';
import 'package:atma_bakery_mobile/main%20page/customer/pesanan%20dikirim/detail%20pesanan/detail_pesanan_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DetailPesananController {
  static Future<DetailPesananModel> fetchDetailPesanan(String orderDate) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var userIdPref = pref.getInt('user_id');
    var url = '${kAPiName}get-detail-pengiriman';
    DetailPesananModel detailPesananModel;

    try {
      final response = await http.post(Uri.parse(url), body: {
        'user_id': userIdPref.toString(),
        'order_date': orderDate,
      });
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        detailPesananModel = DetailPesananModel.fromJson(result);
        return detailPesananModel;
      } else {
        throw Exception('Failed to fetch detail pesanan');
      }
    } catch (e) {
      throw Exception('Failed to fetch detail pesanan');
    }
  }

  static Future<void> updateStatusPengiriman(String orderId) async {
    var url = '${kAPiName}update-selesai-pengiriman';
    try {
      final response = await http.post(Uri.parse(url), body: {
        'order_id': orderId,
      });
      if (response.statusCode != 200) {
        throw Exception('Failed to update status pengiriman');
      }
    } catch (e) {
      throw Exception('Failed to update status pengiriman');
    }
  }
}
