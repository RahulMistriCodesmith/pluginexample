// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_version/new_version.dart';
import 'package:pattern_lock/pattern_lock.dart';
import 'package:pluginexample/CoachMarkExapmle.dart';
import 'package:pluginexample/LocalAuthPage.dart';
import 'package:pluginexample/OverLayWindow.dart';
import 'package:pluginexample/SystemAlertWiindow.dart';
import 'package:upgrader/upgrader.dart';

class ButtonPlugIn extends StatefulWidget {
  const ButtonPlugIn({Key? key}) : super(key: key);

  @override
  State<ButtonPlugIn> createState() => _ButtonPlugInState();
}

class _ButtonPlugInState extends State<ButtonPlugIn> {

  List<int>? pattern;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(0.5),
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
                color: Colors.lightBlue,
                child: Text('Pattern Lock'),
                onPressed: () {}
            ),

            // RaisedButton(
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //     color: Colors.lightBlue,
            //     child: Text('New Version'),
            //     onPressed: (){
            //       _checkVersion();
            //     }
            // ),

            RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.lightBlue,
                child: Text('Local Auth Page'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LocalAuthPage()));
                }
            ),

            RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.lightBlue,
                child: Text('OverLay Window'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OverLayWindowExample()));
                }
            ),


            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
                color: Colors.lightBlue,
                child: Text('Tutorial CoachMark '),
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => TutorailCoachMarkExample()));
                }
            ),

            RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.lightBlue,
                child: Text('System Alert Wiindow'),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SystemAlertWindowExample()));
                }
            ),




          ],
        ),
      ),
    );
  }
}
