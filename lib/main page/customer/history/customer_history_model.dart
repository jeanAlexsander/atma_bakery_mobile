import 'dart:convert';

class HistoryModel {
  String status;
  String message;
  List<History> data;

  HistoryModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory HistoryModel.fromRawJson(String str) =>
      HistoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        status: json["status"],
        message: json["message"],
        data: List<History>.from(json["data"].map((x) => History.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class History {
  int orderId;
  int productId;
  int amount;
  int price;
  dynamic custodianId;
  String name;
  int quantity;
  dynamic image;
  int categoryId;

  History({
    required this.orderId,
    required this.productId,
    required this.amount,
    required this.price,
    required this.custodianId,
    required this.name,
    required this.quantity,
    required this.image,
    required this.categoryId,
  });

  factory History.fromRawJson(String str) => History.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory History.fromJson(Map<String, dynamic> json) => History(
        orderId: json["order_id"],
        productId: json["product_id"],
        amount: json["amount"],
        price: json["price"],
        custodianId: json["custodian_id"],
        name: json["name"],
        quantity: json["quantity"],
        image: json["image"],
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "product_id": productId,
        "amount": amount,
        "price": price,
        "custodian_id": custodianId,
        "name": name,
        "quantity": quantity,
        "image": image,
        "category_id": categoryId,
      };
}
