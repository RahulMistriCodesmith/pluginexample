// ignore_for_file: deprecated_member_use, unused_import, prefer_const_constructors, non_constant_identifier_names

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metaballs/metaballs.dart';
import 'package:new_version/new_version.dart';
import 'package:pattern_lock/pattern_lock.dart';
import 'package:pluginexample/CoachMarkExapmle.dart';
import 'package:pluginexample/LocalAuthPage.dart';
import 'package:pluginexample/OverLayWindow.dart';
import 'package:pluginexample/SystemAlertWiindow.dart';
import 'package:pluginexample/youtubeplayer.dart';
import 'package:upgrader/upgrader.dart';

class ButtonPlugIn extends StatefulWidget {
  const ButtonPlugIn({Key? key}) : super(key: key);

  @override
  State<ButtonPlugIn> createState() => _ButtonPlugInState();
}

class _ButtonPlugInState extends State<ButtonPlugIn> {

  List<int>? pattern;

  void Notify()  async{
    // String timezom = await AwesomeNotifications().getLocalTimeZoneIdentifier();
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: 'key1',
          title: 'This is Notification title',
          body: 'This is Body of Noti',
          bigPicture: 'https://protocoderspoint.com/wp-content/uploads/2021/05/Monitize-flutter-app-with-google-admob-min-741x486.png',
          notificationLayout: NotificationLayout.BigPicture
      ),
      // schedule: NotificationInterval(interval: 5,timeZone: timezom,repeats: true),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
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

            RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.lightBlue,
                child: Text('Notification'),
                onPressed: (){
                  Notify();  //localnotification method call below
                  AwesomeNotifications().actionStream.listen((event) {

                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                  });
                }
            ),

          ],
        ),
      ),
    );
  }
}
