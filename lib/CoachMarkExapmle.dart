// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class TutorailCoachMarkExample extends StatefulWidget {
  const TutorailCoachMarkExample({Key? key}) : super(key: key);

  @override
  State<TutorailCoachMarkExample> createState() => _TutorailCoachMarkExampleState();
}

class _TutorailCoachMarkExampleState extends State<TutorailCoachMarkExample> {
  late TutorialCoachMark tutorialCoachMark;

  GlobalKey key = GlobalKey();
  GlobalKey key1 = GlobalKey();
  GlobalKey key2 = GlobalKey();
  GlobalKey key3 = GlobalKey();

  GlobalKey keyBottomNavigation1 = GlobalKey();
  GlobalKey keyBottomNavigation2 = GlobalKey();
  GlobalKey keyBottomNavigation3 = GlobalKey();

  @override
  void initState() {
    createTutorial();
    Future.delayed(Duration.zero, showTutorial);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TutorailCoachMarkExample'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Container(
                  key: key,
                  child: Image.asset('assets/profileimage.png',scale: 3,)),

              SizedBox(height: 15,),

              Container(
                key: key1,
                child: Text('Example',style: TextStyle(fontSize: 20),),
              ),

              SizedBox(height: 15,),

              Container(
                key: key2,
                child: Text('Example1',style: TextStyle(fontSize: 20),),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          Container(

            height: 50,
            child: Row(
              children: [
                Expanded(
                    child: Center(
                      child: SizedBox(
                        key: keyBottomNavigation1,
                        height: 40,
                        width: 40,
                      ),
                    )),
                Expanded(
                    child: Center(
                      child: SizedBox(
                        key: keyBottomNavigation2,
                        height: 40,
                        width: 40,
                      ),
                    )),
                Expanded(
                  child: Center(
                    child: SizedBox(
                      key: keyBottomNavigation3,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
              ),
            ],
            // currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: (index) {},
          ),
        ],
      ),
    );
  }

  void showTutorial() {
    tutorialCoachMark.show(context: context);
  }

  void createTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      targets: _createTargets(),
      colorShadow: Colors.transparent,
      textSkip: "SKIP",
      paddingFocus: 10,
      opacityShadow: 0.1,
      onFinish: () {
        print("finish");
      },
      onClickTarget: (target) {
        print('onClickTarget: $target');
      },
      onClickTargetWithTapPosition: (target, tapDetails) {
        print("target: $target");
        print(
            "clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}");
      },
      onClickOverlay: (target) {
        print('onClickOverlay: $target');
      },
      onSkip: () {
        print("skip");
      },
    );
  }

  List<TargetFocus> _createTargets() {
    List<TargetFocus> targets = [];
    targets.add(
      TargetFocus(
        identify: "keyBottomNavigation1",
        keyTarget: keyBottomNavigation1,
        alignSkip: Alignment.topRight,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: 35),
                // width: 100,
                // height: 60,
                decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );

    targets.add(
      TargetFocus(
        identify: "keyBottomNavigation2",
        keyTarget: keyBottomNavigation2,
        alignSkip: Alignment.topCenter,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: 35),
                // width: 100,
                // height: 60,
                decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Business",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );

    targets.add(
      TargetFocus(
        identify: "keyBottomNavigation3",
        keyTarget: keyBottomNavigation3,
        alignSkip: Alignment.topRight,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: 35),
                // width: 100,
                // height: 60,
                decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "School",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: "Target 0",
        keyTarget: key,
        shape: ShapeLightFocus.Circle,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: 35),
                // width: 100,
                // height: 60,
                decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Profile Image",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20.0),
                    ),

                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: "Target 1",
        keyTarget: key1,
        shape: ShapeLightFocus.RRect,
        // color: Colors.purple,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: 35),
                // width: 100,
                // height: 60,
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Ex",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Example Content",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                  ],
                ),
              );
            },
          )
        ],
        radius: 5,
      ),
    );
    targets.add(
      TargetFocus(
        identify: "Target 2",
        keyTarget: key2,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 35),
              // width: 100,
              // height: 60,
              decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Ex1",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Example1 Content",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
    return targets;
  }
}
