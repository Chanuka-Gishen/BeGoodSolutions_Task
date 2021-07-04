import 'dart:convert';

LicensePlateModel employeeModelJson(String str) =>
    LicensePlateModel.fromJson(json.decode(str));

class LicensePlateModel{
  String licensePlate;

  LicensePlateModel({this.licensePlate});

  factory LicensePlateModel.fromJson(Map<String, dynamic> json) => LicensePlateModel(licensePlate: json["licensePlate"]);

  Map<String, dynamic> toJson() => {
    "licensePlate" : this.licensePlate
  };
}