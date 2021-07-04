import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViewRegistrations extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return ViewRegistrationsState();
  }
  
}


class ViewRegistrationsState extends State<ViewRegistrations>{
  Future getData() async{
    String url = "http://localhost/getDetails/";
    var client = http.Client();
    var res = await client.get(url);
    var jsonString = res.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Registrations"),
      ),
      body: Center(
        child: Text("All Registrations"),
      ),
    );
  }

}