import 'dart:convert';

import 'package:atma_bakery_mobile/constraints.dart';
import 'package:atma_bakery_mobile/main%20page/customer/history/customer_history_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CustomerHistoryController {
  static Future<HistoryModel> fetchCustomerHistory() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var id = pref.getInt('user_id');
    var url = '${kAPiName}get-history/$id';
    HistoryModel historyModel;

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        historyModel = HistoryModel.fromJson(result);
        return historyModel;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}
