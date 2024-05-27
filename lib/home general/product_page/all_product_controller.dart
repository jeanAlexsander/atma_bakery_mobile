import 'dart:convert';

import 'package:atma_bakery_mobile/constraints.dart';
import 'package:atma_bakery_mobile/home%20general/product_page/all_product_model.dart';
import 'package:http/http.dart' as http;

class AllProductService {
  static Future<AllProductModel> fetchAllProductData() async {
    var url = '${kAPiName}get-product-information';
    AllProductModel allProductModel;

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        allProductModel = AllProductModel.fromJson(result);
        return allProductModel;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}
