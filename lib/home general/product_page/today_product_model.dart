import 'dart:convert';

class TodayProductModel {
  String status;
  String message;
  List<TodayProduct> data;

  TodayProductModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory TodayProductModel.fromRawJson(String str) =>
      TodayProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TodayProductModel.fromJson(Map<String, dynamic> json) =>
      TodayProductModel(
        status: json["status"],
        message: json["message"],
        data: List<TodayProduct>.from(
            json["data"].map((x) => TodayProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TodayProduct {
  int stoctTodayId;
  int productId;
  DateTime date;
  int quantity;
  dynamic custodianId;
  String name;
  int price;
  String image;
  int categoryId;

  TodayProduct({
    required this.stoctTodayId,
    required this.productId,
    required this.date,
    required this.quantity,
    required this.custodianId,
    required this.name,
    required this.price,
    required this.image,
    required this.categoryId,
  });

  factory TodayProduct.fromRawJson(String str) =>
      TodayProduct.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TodayProduct.fromJson(Map<String, dynamic> json) => TodayProduct(
        stoctTodayId: json["stoct_today_id"] ?? 0,
        productId: json["product_id"] ?? 0,
        date: DateTime.parse(json["date"] ?? ''),
        quantity: json["quantity"] ?? 0,
        custodianId: json["custodian_id"] ?? '',
        name: json["name"] ?? '',
        price: json["price"] ?? 0,
        image: json["image"] ?? '',
        categoryId: json["category_id"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "stoct_today_id": stoctTodayId,
        "product_id": productId,
        "date": date.toIso8601String(),
        "quantity": quantity,
        "custodian_id": custodianId,
        "name": name,
        "price": price,
        "image": image,
        "category_id": categoryId,
      };
}
