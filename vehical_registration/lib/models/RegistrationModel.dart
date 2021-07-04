

import 'dart:convert';

RegistrationModel employeeModelJson(String str) =>
    RegistrationModel.fromJson(json.decode(str));

String employeeModelToJson(RegistrationModel data) => json.encode(data.toJson());

class RegistrationModel{
  int id;
  String name;
  String licensePlate;
  String idNo;
  String vehicleType;

  RegistrationModel({this.id, this.name, this.licensePlate, this.idNo, this.vehicleType});

  factory RegistrationModel.fromJson(Map<String, dynamic> json) => RegistrationModel(
      id: json["id"], name: json["ownerName"], licensePlate: json["licensePlate"], idNo: json["ownerNic"], vehicleType: json["vehicalType"]);

  Map<String, dynamic> toJson() => {
    'id': id,
    "ownerName": name,
    "licensePlate":licensePlate,
    "ownerNic":idNo,
    "vehicalType":vehicleType,

  };

}