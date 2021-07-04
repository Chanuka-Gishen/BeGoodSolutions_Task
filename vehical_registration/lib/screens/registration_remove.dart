import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehical_registration/models/RegistrationModel.dart';
import 'package:http/http.dart' as http;
import 'package:vehical_registration/screens/home_screen.dart';
import 'package:vehical_registration/screens/view_list.dart';

// ignore: must_be_immutable
class RemoveRegistration extends StatelessWidget{
  RegistrationModel model;
  RemoveRegistration(this.model);

  deleteEmployee(RegistrationModel registrationMode) async {
    final url = Uri.parse("http://localhost:8080/deleteRegistration/");
    final request = http.Request("DELETE", url);
    request.headers
        .addAll(<String, String>{"Content-type": "application/json"});
    request.body = jsonEncode(model);
    await request.send();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.name),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.home_rounded,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              })
        ],
      ),
      body: Container(
        child: Text('Owner Name' +
            ' ' +
            model.name +
            ' ' +
            'License Plate' +
            model.licensePlate +
            ' ' +
            'Owner NIC' +
            model.idNo +
            ' ' +
            'Vehicle Type' +
            model.vehicleType
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          deleteEmployee(model);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ViewRegistrations()));
        },
        child: Icon(Icons.delete),
        backgroundColor: Colors.pink,
      ),
    );
  }

  
}