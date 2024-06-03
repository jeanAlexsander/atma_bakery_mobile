import 'dart:convert';

class LaporanPengeluaranPemasukanModel {
  Data data;

  LaporanPengeluaranPemasukanModel({
    required this.data,
  });

  factory LaporanPengeluaranPemasukanModel.fromRawJson(String str) =>
      LaporanPengeluaranPemasukanModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LaporanPengeluaranPemasukanModel.fromJson(
          Map<String, dynamic> json) =>
      LaporanPengeluaranPemasukanModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  int totalPemasukan;
  int totalGaji;
  int totalPembelianBahan;
  List<OtherNeed> otherNeed;
  int tip;

  Data({
    required this.totalPemasukan,
    required this.totalGaji,
    required this.totalPembelianBahan,
    required this.otherNeed,
    required this.tip,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalPemasukan: json["total_pemasukan"],
        totalGaji: json["total_gaji"],
        totalPembelianBahan: json["total_pembelian_bahan"],
        otherNeed: List<OtherNeed>.from(
            json["other_need"].map((x) => OtherNeed.fromJson(x))),
        tip: json["tip"],
      );

  Map<String, dynamic> toJson() => {
        "total_pemasukan": totalPemasukan,
        "total_gaji": totalGaji,
        "total_pembelian_bahan": totalPembelianBahan,
        "other_need": List<dynamic>.from(otherNeed.map((x) => x.toJson())),
        "tip": tip,
      };
}

class OtherNeed {
  int otherNeedId;
  String name;
  int cost;
  DateTime dateOfExpense;

  OtherNeed({
    required this.otherNeedId,
    required this.name,
    required this.cost,
    required this.dateOfExpense,
  });

  factory OtherNeed.fromRawJson(String str) =>
      OtherNeed.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OtherNeed.fromJson(Map<String, dynamic> json) => OtherNeed(
        otherNeedId: json["other_need_id"],
        name: json["name"],
        cost: json["cost"],
        dateOfExpense: DateTime.parse(json["Date_of_expense"]),
      );

  Map<String, dynamic> toJson() => {
        "other_need_id": otherNeedId,
        "name": name,
        "cost": cost,
        "Date_of_expense": dateOfExpense.toIso8601String(),
      };
}
