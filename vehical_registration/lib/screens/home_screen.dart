import 'package:flutter/material.dart';
import 'package:vehical_registration/screens/find_plate_type.dart';
import 'package:vehical_registration/screens/register_vehicle.dart';
import 'package:vehical_registration/screens/view_list.dart';

var assetImg = AssetImage('assets/homePage.png');

var asset = Image(image: assetImg);

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    const primaryColor = const Color(0xFFdbc544);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(top: 150.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style:ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                  ) ,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> LicensePlateType()));
                  },
                  child: Text("Check Plate Number Type")),
            ),
            SizedBox(height: 10,),
            SizedBox(
              width: double.infinity,
              child:ElevatedButton(
                  style:ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                  ) ,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Register()));
                  },
                  child: Text("Register A Vehicle")),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style:ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                  ) ,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewRegistrations()));
                  },
                  child: Text("View All Registered Plate No")),
            ),
            Container(
              margin: EdgeInsets.only(top: 40.0),
              width: double.infinity,
              height: 300.0,
              child: asset,
            )
          ],
        ),
      ),
    );
  }
  
}