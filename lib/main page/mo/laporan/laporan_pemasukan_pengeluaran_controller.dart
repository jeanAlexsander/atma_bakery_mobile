import 'dart:convert';

import 'package:atma_bakery_mobile/constraints.dart';
import 'package:atma_bakery_mobile/main%20page/mo/laporan/laporan_pemasukan_pengeluaran_model.dart';
import 'package:http/http.dart' as http;

class LaporanPemasukanPengeluaranController {
  static Future<LaporanPengeluaranPemasukanModel> fetchData(
      String month) async {
    var url = '${kAPiName}get-pemasukan-pengeluaran';
    LaporanPengeluaranPemasukanModel laporanPengeluaranPemasukanModel;
    late int monthValue;

    if (month == "Januari") {
      monthValue = 1;
    } else if (month == "Februari") {
      monthValue = 2;
    } else if (month == "Maret") {
      monthValue = 3;
    } else if (month == "April") {
      monthValue = 4;
    } else if (month == "Mei") {
      monthValue = 5;
    } else if (month == "Juni") {
      monthValue = 6;
    } else if (month == "Juli") {
      monthValue = 7;
    } else if (month == "Agustus") {
      monthValue = 8;
    } else if (month == "September") {
      monthValue = 9;
    } else if (month == "Oktober") {
      monthValue = 10;
    } else if (month == "November") {
      monthValue = 11;
    } else if (month == "Desember") {
      monthValue = 12;
    }
    try {
      final response = await http.post(Uri.parse(url), body: {
        'month': monthValue.toString(),
        'year': '2024',
      });
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        laporanPengeluaranPemasukanModel =
            LaporanPengeluaranPemasukanModel.fromJson(result);
        return laporanPengeluaranPemasukanModel;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data $e');
    }
  }
}
