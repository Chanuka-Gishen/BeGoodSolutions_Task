import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vehical_registration/screens/home_screen.dart';

import '../models/RegistrationModel.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  RegisterVehicle createState() => RegisterVehicle();
}

// ignore: missing_return
Future<RegistrationModel> registerPlate(
    String ownerName, String licensePlate, String ownerNic, String vehicalType, BuildContext context) async {
  var url = Uri.parse("http://127.0.0.1:8080/register/");
  var response = await http.post(url,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "ownerName": ownerName,
        "licensePlate": licensePlate,
        "ownerNic": ownerNic,
        "vehicalType": vehicalType
      }));
  print(response.body);
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load Api Request');
  }
}



Future<RegistrationModel> updateRegistration(
    String ownerName, String licensePlate, String ownerNic, String vehicalType, BuildContext context) async {
  var url = "http://localhost:8080/updateRegistration/";
  var response = await http.post(url,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "ownerName": ownerName,
        "licensePlate": licensePlate,
        "ownerNic": ownerNic,
        "vehicalType": vehicalType
      }));
  print(response.body);
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load Api Request');
  }
}

class RegisterVehicle extends State<Register>{

  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();
  TextEditingController fourthController = TextEditingController();

  RegistrationModel model;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const primaryColor = const Color(0xFFdbc544);

    return Scaffold(
      appBar: AppBar(
        backgroundColor:primaryColor ,
        title: Text("Register Vehicle"),
        leading: IconButton(
            icon: Icon(Icons.home_rounded),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
            }
        )
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Owner Name",
                    border: UnderlineInputBorder(
                      borderRadius:BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        width: 5.0,
                      )
                    ),
                ),
                // ignore: missing_return
                validator: (String value){
                  if(value.isEmpty){
                    return "Name Is Required";
                  }
                },
                controller: firstController,
              ),

              TextFormField(
                decoration: InputDecoration(
                    labelText: "Owner ID No",
                    border: UnderlineInputBorder(
                        borderRadius:BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          width: 5.0,
                        )
                    ),
                ),
                // ignore: missing_return
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Id No Is Required";
                  }
                },
                controller: secondController,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Owner License Plate No",
                    border: UnderlineInputBorder(
                        borderRadius:BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          width: 5.0,
                        )
                    ),
                ),
                // ignore: missing_return
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Licesne Plate No is requierd";
                  }
                },
                controller: thirdController,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Vehicle Model",
                    border: UnderlineInputBorder(
                        borderRadius:BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          width: 5.0,
                        )
                    ),
                ),
                // ignore: missing_return
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Vehicle Model is required";
                  }
                },
                controller: fourthController,
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child:ElevatedButton(
                    style:ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primaryColor),

                    ) ,
                    onPressed: () async {

                      if(!_key.currentState.validate()){
                        return;
                      }else{
                        String name = firstController.text;
                        String licenseNo = secondController.text;
                        String nic = thirdController.text;
                        String vehicleType = fourthController.text;

                        RegistrationModel models = await registerPlate(name, licenseNo, nic, vehicleType, context);
                        firstController.clear();
                        secondController.clear();
                        thirdController.clear();
                        fourthController.clear();
                        setState(() {
                          model = models;
                        });
                      }
                    },
                    child: Text("Submit")),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style:ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primaryColor),
                    ) ,
                    onPressed: ()async{
                      if(!_key.currentState.validate()){
                        return;
                      }else{
                        String name = firstController.text;
                        String licenseNo = secondController.text;
                        String nic = thirdController.text;
                        String vehicleType = fourthController.text;

                        RegistrationModel models = await updateRegistration(name, licenseNo, nic, vehicleType, context);
                        firstController.text = "";
                        secondController.text = "";
                        thirdController.text = "";
                        fourthController.text = "";
                        setState(() {
                          model = models;
                        });
                      }
                    },
                    child: Text("Update Details")),
              ),

            ],
          ),
        ),),

      ),
    );
  }

}
