import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/LicensePlateModel.dart';
import 'package:http/http.dart' as http;

import 'home_screen.dart';

class LicensePlateType extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => FindPlateType();
}

// ignore: missing_return
Future <LicensePlateModel> findType(String licensePlateNo) async{
  //var url = Uri.parse("http://localhost:8080/getType/");
  var response = await http.post(Uri.parse("http://192.168.1.26:8080/getType/"),
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "licensePlate": licensePlateNo}));
  print(response.body);
  if (response.statusCode == 200) {
    return LicensePlateModel.fromJson(jsonDecode(response.body));
  } else {
    print('Failed to load Api Request');
  }
}

Future validType(String licensePlateNo) async {
  var url = Uri.parse("http://localhost:8080/validType/");
  var response = await http.post(url,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "licensePlate": licensePlateNo}));
  print(response.body);
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load Api Request');
  }
}

class FindPlateType extends State<LicensePlateType>{
  TextEditingController typeController = TextEditingController();
  String getValue;
  static const primaryColor = const Color(0xFFdbc544);
  LicensePlateModel mainModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("License Plate Type"),
          leading: IconButton(
              icon: Icon(Icons.home_rounded),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
              }
          )
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "Enter License Plate Number"),
              // ignore: missing_return
              validator: (String value){
                if(value.isEmpty){
                  return "License Plate Number Is Required";
                }
              },
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style:ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryColor),
                ) ,
                onPressed: ()async{
                  String plateNo = typeController.text;
                  // ignore: unrelated_type_equality_checks
                  if(validType(plateNo)=="true"){
                    LicensePlateModel model = await findType(plateNo);
                    typeController.text = "";
                    setState(() {
                      getValue = findType(plateNo) as String;
                      mainModel = model;
                    });
                  }else{
                    return "Enter Valid License Plate Number";
                  }


                },
                child: Text("Find Type"),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              child: Text('$getValue'),
            )
          ],
        ),
      ),
    );
  }

}