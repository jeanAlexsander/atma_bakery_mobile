import 'dart:convert';

class DetailPesananModel {
  String status;
  String message;
  List<DetailPesanan> data;

  DetailPesananModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DetailPesananModel.fromRawJson(String str) =>
      DetailPesananModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailPesananModel.fromJson(Map<String, dynamic> json) =>
      DetailPesananModel(
        status: json["status"],
        message: json["message"],
        data: List<DetailPesanan>.from(
            json["data"].map((x) => DetailPesanan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DetailPesanan {
  int orderNotConfirmId;
  int userId;
  int productId;
  int amount;
  int status;
  DateTime orderDate;
  String deliveryOption;
  dynamic custodianId;
  String name;
  int price;
  String image;
  int categoryId;

  DetailPesanan({
    required this.orderNotConfirmId,
    required this.userId,
    required this.productId,
    required this.amount,
    required this.status,
    required this.orderDate,
    required this.deliveryOption,
    required this.custodianId,
    required this.name,
    required this.price,
    required this.image,
    required this.categoryId,
  });

  factory DetailPesanan.fromRawJson(String str) =>
      DetailPesanan.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailPesanan.fromJson(Map<String, dynamic> json) => DetailPesanan(
        orderNotConfirmId: json["order_not_confirm_id"],
        userId: json["user_id"],
        productId: json["product_id"],
        amount: json["amount"],
        status: json["status"],
        orderDate: DateTime.parse(json["order_date"]),
        deliveryOption: json["delivery_option"],
        custodianId: json["custodian_id"] ?? "",
        name: json["name"],
        price: json["price"],
        image: json["image"] ?? "",
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "order_not_confirm_id": orderNotConfirmId,
        "user_id": userId,
        "product_id": productId,
        "amount": amount,
        "status": status,
        "order_date": orderDate.toIso8601String(),
        "delivery_option": deliveryOption,
        "custodian_id": custodianId,
        "name": name,
        "price": price,
        "image": image,
        "category_id": categoryId,
      };
}
