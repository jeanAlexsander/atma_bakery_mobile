import 'dart:convert';

class TarikSaldoModel {
  String status;
  String message;
  List<TarikSaldo> data;

  TarikSaldoModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory TarikSaldoModel.fromRawJson(String str) =>
      TarikSaldoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TarikSaldoModel.fromJson(Map<String, dynamic> json) =>
      TarikSaldoModel(
        status: json["status"],
        message: json["message"],
        data: List<TarikSaldo>.from(
            json["data"].map((x) => TarikSaldo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TarikSaldo {
  int balanceWithdrawalsId;
  int userId;
  int amount;
  DateTime balanceWithdrawalsDate;

  TarikSaldo({
    required this.balanceWithdrawalsId,
    required this.userId,
    required this.amount,
    required this.balanceWithdrawalsDate,
  });

  factory TarikSaldo.fromRawJson(String str) =>
      TarikSaldo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TarikSaldo.fromJson(Map<String, dynamic> json) => TarikSaldo(
        balanceWithdrawalsId: json["balance_withdrawals_id"],
        userId: json["user_id"],
        amount: json["amount"],
        balanceWithdrawalsDate:
            DateTime.parse(json["balance_withdrawals_date"]),
      );

  Map<String, dynamic> toJson() => {
        "balance_withdrawals_id": balanceWithdrawalsId,
        "user_id": userId,
        "amount": amount,
        "balance_withdrawals_date": balanceWithdrawalsDate.toIso8601String(),
      };
}
