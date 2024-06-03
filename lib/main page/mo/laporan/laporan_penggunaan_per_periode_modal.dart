import 'dart:convert';

class LaporanPerPeriodeModel {
  List<LaporanPerPeriode> data;

  LaporanPerPeriodeModel({
    required this.data,
  });

  factory LaporanPerPeriodeModel.fromRawJson(String str) =>
      LaporanPerPeriodeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LaporanPerPeriodeModel.fromJson(Map<String, dynamic> json) =>
      LaporanPerPeriodeModel(
        data: List<LaporanPerPeriode>.from(
            json["data"].map((x) => LaporanPerPeriode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class LaporanPerPeriode {
  int ingredientId;
  String name;
  int quantity;
  String unit;

  LaporanPerPeriode({
    required this.ingredientId,
    required this.name,
    required this.quantity,
    required this.unit,
  });

  factory LaporanPerPeriode.fromRawJson(String str) =>
      LaporanPerPeriode.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LaporanPerPeriode.fromJson(Map<String, dynamic> json) =>
      LaporanPerPeriode(
        ingredientId: json["ingredient_id"],
        name: json["name"],
        quantity: json["quantity"],
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "ingredient_id": ingredientId,
        "name": name,
        "quantity": quantity,
        "unit": unit,
      };
}
