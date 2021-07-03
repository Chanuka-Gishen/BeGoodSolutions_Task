import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterVehicle extends StatelessWidget{
  String ownerNameVar;
  String ownerIdNumberVar;
  String licensePlateVar;
  String vehicleModeVar;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  String url = "http://localhost:8080/register/";
  Future submit() async{
    var res = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "ownerName" : ownerNameVar,
          "ownerIdNumber" : ownerIdNumberVar,
          "licensePlate" : licensePlateVar,
          "vehicleModel" : vehicleModeVar
        })
    );
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    Widget BuildNameField(){
      return TextFormField(
        decoration: InputDecoration(labelText: "Owner Name"),
        validator: (String value){
          if(value.isEmpty){
            return "Name Is Required";
          }
        },
        onSaved: (String value){
          ownerNameVar = value;
        },
      );
    }

    Widget BuildIdNoField(){
      return TextFormField(
        decoration: InputDecoration(labelText: "Owner ID No"),
        validator: (String value) {
          if (value.isEmpty) {
            return "Id No Is Required";
          }
        },
        onSaved: (String value){
          ownerIdNumberVar = value;
        },
      );
    }

    Widget BuildLicensePlateField(){
      return TextFormField(
        decoration: InputDecoration(labelText: "Owner License Plate No"),
        validator: (String value) {
          if (value.isEmpty) {
            return "Licesne Plate No is requierd";
          }
        },
        onSaved: (String value){
          licensePlateVar = value;
        },
      );
    }

    Widget BuildVehicleModelField(){
      return TextFormField(
        decoration: InputDecoration(labelText: "Vehicle Model"),
        validator: (String value) {
          if (value.isEmpty) {
            return "Vehicle Model is required";
          }
        },
        onSaved: (String value){
          vehicleModeVar = value;
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Register Vehicle"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
          key: _key,
          child: Column(
            children: [
              BuildNameField(),
              BuildIdNoField(),
              BuildLicensePlateField(),
              BuildVehicleModelField(),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child:ElevatedButton(
                    onPressed: (){

                      if(!_key.currentState.validate()){
                        return;
                      }else{
                        submit();
                        _key.currentState.save();
                      }
                    },
                    child: Text("Submit")),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){},
                    child: Text("Update Details")),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){},
                    child: Text("Delete Details")),
              ),

            ],
          ),
        ),),

      ),
    );
  }

}
