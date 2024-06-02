import 'dart:convert';

import 'package:atma_bakery_mobile/constraints.dart';
import 'package:atma_bakery_mobile/main%20page/mo/laporan/laporan_stock_bahan_baku_model.dart';
import 'package:http/http.dart' as http;

class StockBahanBakuController {
  static Future<StockBahanBakuModel> fetchStockBahanBaku() async {
    var url = '${kAPiName}get-ingredient';
    StockBahanBakuModel stockBahanBakuModel;

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        stockBahanBakuModel = StockBahanBakuModel.fromJson(result);
        return stockBahanBakuModel;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data $e');
    }
  }
}
