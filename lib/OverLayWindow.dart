// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';


class OverLayWindowExample extends StatefulWidget {
  const OverLayWindowExample({Key? key}) : super(key: key);

  @override
  State<OverLayWindowExample> createState() => _OverLayWindowExampleState();
}

class _OverLayWindowExampleState extends State<OverLayWindowExample> {

  windowOfOverLay() async {
    /// check if overlay permission is granted
    // final bool status = await FlutterOverlayWindow.isPermissionGranted();
    //
    // final bool? status1 = await FlutterOverlayWindow.requestPermission();

    await FlutterOverlayWindow.showOverlay(
      alignment: OverlayAlignment.center,
      visibility: NotificationVisibility.visibilityPublic,
      width: matchParent,
      height: 200,
      enableDrag: true,
      flag: OverlayFlag.focusPointer,
      overlayContent: "JNSKJNKJSNJSNKJSNKSJN",
    );

    /// streams message shared between overlay and main app
    /*FlutterOverlayWindow.overlayListener.listen((event) {
      log("Current Event: $event");
    });*/


    // /// update the overlay flag while the overlay in action
    // await FlutterOverlayWindow.updateFlag(OverlayFlag.defaultFlag);
    //
    // /// Update the overlay size in the screen
    // await FlutterOverlayWindow.resizeOverlay(80, 120);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OverLay Window'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              color: Colors.lightGreenAccent,
               child: Text('Over lay'),
                onPressed: (){
                 windowOfOverLay();
                })
          ],
        ),
      ),
    );
  }
}
