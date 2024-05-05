import 'dart:convert';
import 'package:atma_bakery_mobile/constraints.dart';
import 'package:atma_bakery_mobile/main%20page/mo/presensi/presensi_model.dart';
import 'package:http/http.dart' as http;

class PresensiController {
  static Future<PresensiModel> fetchPresensiModel() async {
    var url = '${kAPiName}get-presensi';
    PresensiModel presensiModel;

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        presensiModel = PresensiModel.fromJson(result);
        return presensiModel;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data $e');
    }
  }

  static Future<PresensiModel> setPresensi(int id) async {
    var url = '${kAPiName}set-presensi/$id';
    PresensiModel presensiModel;

    try {
      final response = await http.post(Uri.parse(url));
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        presensiModel = PresensiModel.fromJson(result);
        return presensiModel;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data $e');
    }
  }
}
