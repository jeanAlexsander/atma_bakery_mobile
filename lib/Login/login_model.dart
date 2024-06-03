import 'dart:convert';

class UserLoginModel {
  String status;
  String message;
  List<User> data;

  UserLoginModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserLoginModel.fromRawJson(String str) =>
      UserLoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
        status: json["status"],
        message: json["message"],
        data: List<User>.from(json["data"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class User {
  int userId;
  String firstName;
  String lastName;
  String email;
  String passwordHash;
  DateTime dateOfBirth;
  int totalPoint;
  int roleId;
  String roleName;

  User({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.passwordHash,
    required this.dateOfBirth,
    required this.totalPoint,
    required this.roleId,
    required this.roleName,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"] ?? 0,
        firstName: json["first_name"] ?? "",
        lastName: json["last_name"] ?? "",
        email: json["email"] ?? "",
        passwordHash: json["password_hash"] ?? "",
        dateOfBirth: DateTime.parse(json["date_of_birth"]) ?? DateTime.now(),
        totalPoint: json["total_point"] ?? 0,
        roleId: json["role_id"] ?? 0,
        roleName: json["role_name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password_hash": passwordHash,
        "date_of_birth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "total_point": totalPoint,
        "role_id": roleId,
        "role_name": roleName,
      };
}
