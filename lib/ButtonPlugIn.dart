// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:pluginexample/CoachMarkExapmle.dart';
import 'package:pluginexample/OverLayWindow.dart';
import 'package:pluginexample/SystemAlertWiindow.dart';

class ButtonPlugIn extends StatefulWidget {
  const ButtonPlugIn({Key? key}) : super(key: key);

  @override
  State<ButtonPlugIn> createState() => _ButtonPlugInState();
}

class _ButtonPlugInState extends State<ButtonPlugIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Buttons'),
        centerTitle: true,
      ),
      
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: 70,),



            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.orange,
              child: Text('System Alert Wiindow'),
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SystemAlertWindowExample()));
                }
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.white,
                  child: Text('OverLay Window'),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OverLayWindowExample()));
                  }
              ),
            ),

            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.green,
              child: Text('Tutorial CoachMark '),
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => TutorailCoachMarkExample()));
                }
            ),

          ],
        ),
      ),
    );
  }
}
