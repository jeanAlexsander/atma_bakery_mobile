import 'dart:convert';

class PresensiModel {
  String status;
  String message;
  List<Presensi> data;

  PresensiModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PresensiModel.fromRawJson(String str) =>
      PresensiModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PresensiModel.fromJson(Map<String, dynamic> json) => PresensiModel(
        status: json["status"],
        message: json["message"],
        data:
            List<Presensi>.from(json["data"].map((x) => Presensi.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Presensi {
  int employeeId;
  String firstName;
  String lastName;
  DateTime attendanceTime;
  int status;
  int attendanceId;

  Presensi({
    required this.employeeId,
    required this.firstName,
    required this.lastName,
    required this.attendanceTime,
    required this.status,
    required this.attendanceId,
  });

  factory Presensi.fromRawJson(String str) =>
      Presensi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Presensi.fromJson(Map<String, dynamic> json) => Presensi(
        employeeId: json["employee_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        attendanceTime: DateTime.parse(json["attendance_time"]),
        status: json["status"],
        attendanceId: json["attendance_id"],
      );

  Map<String, dynamic> toJson() => {
        "employee_id": employeeId,
        "first_name": firstName,
        "last_name": lastName,
        "attendance_time": attendanceTime.toIso8601String(),
        "status": status,
        "attendance_id": attendanceId,
      };
}
