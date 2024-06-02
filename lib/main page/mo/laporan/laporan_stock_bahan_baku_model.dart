import 'dart:convert';

class StockBahanBakuModel {
  List<BahanBaku> data;

  StockBahanBakuModel({
    required this.data,
  });

  factory StockBahanBakuModel.fromRawJson(String str) =>
      StockBahanBakuModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StockBahanBakuModel.fromJson(Map<String, dynamic> json) =>
      StockBahanBakuModel(
        data: List<BahanBaku>.from(
            json["data"].map((x) => BahanBaku.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class BahanBaku {
  int ingredientId;
  String name;
  String unit;
  int amount;
  int pricePerUnit;

  BahanBaku({
    required this.ingredientId,
    required this.name,
    required this.unit,
    required this.amount,
    required this.pricePerUnit,
  });

  factory BahanBaku.fromRawJson(String str) =>
      BahanBaku.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BahanBaku.fromJson(Map<String, dynamic> json) => BahanBaku(
        ingredientId: json["ingredient_id"],
        name: json["name"],
        unit: json["unit"],
        amount: json["amount"],
        pricePerUnit: json["price_per_unit"],
      );

  Map<String, dynamic> toJson() => {
        "ingredient_id": ingredientId,
        "name": name,
        "unit": unit,
        "amount": amount,
        "price_per_unit": pricePerUnit,
      };
}
