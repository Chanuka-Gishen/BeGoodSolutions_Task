// To parse this JSON data, do
//
//     final registrationModel = registrationModelFromJson(jsonString);

import 'dart:convert';

List<RegistrationModel> registrationModelFromJson(String str) => List<RegistrationModel>.from(json.decode(str).map((x) => RegistrationModel.fromJson(x)));

String registrationModelToJson(List<RegistrationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RegistrationModel {
  RegistrationModel({
    this.id,
    this.ownerName,
    this.licensePlate,
    this.ownerNic,
    this.vehicalType,
  });

  int id;
  String ownerName;
  String licensePlate;
  String ownerNic;
  String vehicalType;

  factory RegistrationModel.fromJson(Map<String, dynamic> json) => RegistrationModel(
    id: json["id"],
    ownerName: json["ownerName"],
    licensePlate: json["licensePlate"],
    ownerNic: json["ownerNic"],
    vehicalType: json["vehicalType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ownerName": ownerName,
    "licensePlate": licensePlate,
    "ownerNic": ownerNic,
    "vehicalType": vehicalType,
  };
}
