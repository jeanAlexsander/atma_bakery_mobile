import 'dart:convert';

class CustomerSaldoModel {
    String message;
    CustomerSaldo data;

    CustomerSaldoModel({
        required this.message,
        required this.data,
    });

    factory CustomerSaldoModel.fromRawJson(String str) => CustomerSaldoModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CustomerSaldoModel.fromJson(Map<String, dynamic> json) => CustomerSaldoModel(
        message: json["message"],
        data: CustomerSaldo.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
    };
}

class CustomerSaldo {
    int userId;
    String firstName;
    String lastName;
    String email;
    String passwordHash;
    DateTime dateOfBirth;
    int totalPoint;
    int roleId;
    dynamic positionId;
    int saldo;

    CustomerSaldo({
        required this.userId,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.passwordHash,
        required this.dateOfBirth,
        required this.totalPoint,
        required this.roleId,
        required this.positionId,
        required this.saldo,
    });

    factory CustomerSaldo.fromRawJson(String str) => CustomerSaldo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CustomerSaldo.fromJson(Map<String, dynamic> json) => CustomerSaldo(
        userId: json["user_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        passwordHash: json["password_hash"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        totalPoint: json["total_point"],
        roleId: json["role_id"],
        positionId: json["position_id"],
        saldo: json["saldo"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password_hash": passwordHash,
        "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "total_point": totalPoint,
        "role_id": roleId,
        "position_id": positionId,
        "saldo": saldo,
    };
}
