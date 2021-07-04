import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vehical_registration/screens/home_screen.dart';

import 'RegistrationModel.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  RegisterVehicle createState() => RegisterVehicle();
}

Future<RegistrationModel> registerPlate(
    String ownerName, String licensePlate, String ownerNic, String vehicalType, BuildContext context) async {
  var Url = "http://127.0.0.1:8080/register/";
  var response = await http.post(Url,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "ownerName": ownerName,
        "licensePlate": licensePlate,
        "ownerNic": ownerNic,
        "vehicalType": vehicalType
      }));
  print(response.body);
  if (response.statusCode == 200) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return MyAlertDialog(title: 'Backend Response', content: response.body);
      },
    );
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


    return Scaffold(
      appBar: AppBar(
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
                decoration: InputDecoration(labelText: "Owner Name"),
                validator: (String value){
                  if(value.isEmpty){
                    return "Name Is Required";
                  }
                },
                controller: firstController,
              ),

              TextFormField(
                decoration: InputDecoration(labelText: "Owner ID No"),
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Id No Is Required";
                  }
                },
                controller: secondController,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Owner License Plate No"),
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Licesne Plate No is requierd";
                  }
                },
                controller: thirdController,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Vehicle Model"),
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
                    onPressed: () async {

                      if(!_key.currentState.validate()){
                        return;
                      }else{
                        _key.currentState.save();
                        String name = firstController.text;
                        String licenseNo = secondController.text;
                        String nic = thirdController.text;
                        String vehicleType = fourthController.text;

                        RegistrationModel models = await registerPlate(name, licenseNo, nic, vehicleType, context);
                        firstController.text = "";
                        secondController.text = "";
                        thirdController.text = "";
                        fourthController.text = "";
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

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  MyAlertDialog({
    this.title,
    this.content,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        this.title,
      ),
      actions: this.actions,
      content: Text(
        this.content,
      ),
    );
  }
}
