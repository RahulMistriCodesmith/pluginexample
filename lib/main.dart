import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:pluginexample/onBordingScreen.dart';
import 'package:upgrader/upgrader.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Upgrader.clearSavedSettings();
  runApp(const MyApp());
}

// overlay entry point
@pragma("vm:entry-point")
void overlayMain() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        color: Colors.lightGreenAccent,
          child: Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Center(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("My overlay"),
                InkWell(
                    onTap: () async {
                      await FlutterOverlayWindow.closeOverlay();
                      },
                    child: Text("Close")),
              ],
            )),
          ))
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: UpgradeAlert(
          child: LiquidSwipeExample()),
    );
  }
}

