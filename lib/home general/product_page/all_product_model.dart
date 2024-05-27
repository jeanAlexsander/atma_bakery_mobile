import 'dart:convert';

class AllProductModel {
  String status;
  String message;
  List<AllProduct> data;

  AllProductModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AllProductModel.fromRawJson(String str) =>
      AllProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllProductModel.fromJson(Map<String, dynamic> json) =>
      AllProductModel(
        status: json["status"],
        message: json["message"],
        data: List<AllProduct>.from(
            json["data"].map((x) => AllProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AllProduct {
  int productId;
  dynamic custodianId;
  String name;
  int price;
  String image;
  int categoryId;

  AllProduct({
    required this.productId,
    required this.custodianId,
    required this.name,
    required this.price,
    required this.image,
    required this.categoryId,
  });

  factory AllProduct.fromJson(Map<String, dynamic> json) {
    return AllProduct(
      productId: json["product_id"] ?? 0,
      custodianId: json["custodian_id"] ?? '',
      name: json["name"] ?? '',
      price: json["price"] ?? 0,
      image: json["image"] ?? '',
      categoryId: json["category_id"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "custodian_id": custodianId,
        "name": name,
        "price": price,
        "image": image,
        "category_id": categoryId,
      };
}
