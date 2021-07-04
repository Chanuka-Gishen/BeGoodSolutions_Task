import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vehical_registration/screens/registration_remove.dart';

import '../models/RegistrationModel.dart';
import 'home_screen.dart';

class ViewRegistrations extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return ViewRegistrationsState();
  }
}



class ViewRegistrationsState extends State<ViewRegistrations>{
  var registrations = List<RegistrationModel>.generate(10, (index) => null);

  Future <List<RegistrationModel>> getData() async {
    var url = "http://localhost:8080/getAllDetails/";
    var response = await http.get(url);
    var jsonData = json.decode(response.body);

    List<RegistrationModel> detailsList = [];
    for (var r in jsonData){
      RegistrationModel registrationModel = new RegistrationModel();
      registrationModel.id = r["id"];
      registrationModel.name = r["ownerName"];
      registrationModel.licensePlate = r["licensePlate"];
      registrationModel.idNo = r["ownerNic"];
      registrationModel.vehicleType = r["vehicalType"];
      detailsList.add(registrationModel);
    }

    if (response.statusCode == 200) {
      return detailsList;
    } else {
      throw Exception('Failed to load Api Request');
    }
  }

  static const primaryColor = const Color(0xFFdbc544);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("All Registrations"),
          leading: IconButton(
              icon: Icon(Icons.home_rounded),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
              }
          )
      ),
      body: Container(
        child: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.data == null){
              return Container(child: Center(child: Icon(Icons.error)));
            }
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  title: Text(
                      "ID" + " " + "Owner Name" + " " + "License Plate" + " " + "Owner Nic" + " " + "Vehicle Type"
                  ),
                  subtitle: Text(
                    '${snapshot.data[index].id}' +
                      '${snapshot.data[index].ownerName}' +
                      '${snapshot.data[index].licensePlate}' +
                      '${snapshot.data[index].idNo}' +
                      '${snapshot.data[index].vehicalType}'
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> RemoveRegistration(snapshot.data[index])));
                  },
                );
              }

            );
          }
        ),
      )
    );
  }

}