import 'dart:convert';

class PesananDikirimModel {
  String status;
  String message;
  List<PesananDikirim> data;

  PesananDikirimModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PesananDikirimModel.fromRawJson(String str) =>
      PesananDikirimModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PesananDikirimModel.fromJson(Map<String, dynamic> json) =>
      PesananDikirimModel(
        status: json["status"],
        message: json["message"],
        data: List<PesananDikirim>.from(
            json["data"].map((x) => PesananDikirim.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class PesananDikirim {
  int orderId;
  DateTime orderDate;
  int userId;
  int total;
  String statusOrder;

  PesananDikirim({
    required this.orderId,
    required this.orderDate,
    required this.userId,
    required this.total,
    required this.statusOrder,
  });

  factory PesananDikirim.fromRawJson(String str) =>
      PesananDikirim.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PesananDikirim.fromJson(Map<String, dynamic> json) => PesananDikirim(
        orderId: json["order_id"],
        orderDate: DateTime.parse(json["order_date"]),
        userId: json["user_id"],
        total: json["total"],
        statusOrder: json["status_order"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "order_date": orderDate.toIso8601String(),
        "user_id": userId,
        "total": total,
        "status_order": statusOrder,
      };
}
