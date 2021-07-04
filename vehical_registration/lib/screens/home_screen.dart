import 'package:flutter/material.dart';
import 'package:vehical_registration/screens/find_plate_type.dart';
import 'package:vehical_registration/screens/register_vehicle.dart';
import 'package:vehical_registration/screens/view_list.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page")
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> FindPlateType()));
                  },
                  child: Text("Check Plate Number Type")),
            ),
            SizedBox(height: 10,),
            SizedBox(
              width: double.infinity,
              child:ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Register()));
                  },
                  child: Text("Register A Vehicle")),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewRegistrations()));
                  },
                  child: Text("View All Registered Plate No")),
            ),

          ],
        ),
      ),
    );
  }
  
}