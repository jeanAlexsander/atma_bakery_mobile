import 'dart:convert';

import 'package:atma_bakery_mobile/constraints.dart';
import 'package:atma_bakery_mobile/home%20general/product_page/today_product_model.dart';
import 'package:http/http.dart' as http;

class TodayProductController {
  static Future<TodayProductModel> fetchTodayProductData() async {
    var url = '${kAPiName}get-ready-stock';
    TodayProductModel todayProductModel;

    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        todayProductModel = TodayProductModel.fromJson(result);
        return todayProductModel;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}
