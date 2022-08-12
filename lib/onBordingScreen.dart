// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:new_version/new_version.dart';
import 'package:pluginexample/ButtonPlugIn.dart';

class LiquidSwipeExample extends StatefulWidget {
  const LiquidSwipeExample({Key? key}) : super(key: key);

  @override
  State<LiquidSwipeExample> createState() => _LiquidSwipeExampleState();
}

class _LiquidSwipeExampleState extends State<LiquidSwipeExample> {

  final pageController = LiquidController();
  bool isLastPage = false;


  //NewVersion Plugin
  void _checkVersion() async {
    final newVersion = NewVersion(
      androidId: "com.snapchat.android",
    );
    final VersionStatus? status = await newVersion.getVersionStatus();
    newVersion.showUpdateDialog(
        context: context,
        versionStatus: status!,
        dialogTitle: 'UPDATE VERSION',
        dismissButtonText: 'Maybe Later',
        dialogText: 'Please Update Your Application' + " ${status.localVersion}" + " to" " ${status.storeVersion}",
        dismissAction: (){
          Navigator.pop(context);
        }
    );

    print('DEVICE : ' + status.localVersion);
    print('STORE : ' + status.storeVersion);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkVersion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
              liquidController: pageController,
            enableSideReveal: true,
            onPageChangeCallback: (index){
              setState(() => isLastPage = index == 3);
            },
            slideIconWidget: Icon(Icons.arrow_back_ios,color: Colors.white,),
            pages: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.8, 1),
                      colors: [
                        Colors.orange,
                        Colors.tealAccent
                      ]
                  )
                ),
                // color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/whatsapp-logo-light-green-png-0.png',scale: 4,),
                    Text('WhatsApp',style: TextStyle(fontSize: 35),)
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment(0.8, 1),
                        colors: [
                          Colors.blueAccent,
                          Colors.tealAccent
                        ]
                    )
                ),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/facebook-logo-clipart-flat-facebook-logo-png-icon-circle-22.png',scale: 3,),
                    Text('FaceBook',style: TextStyle(fontSize: 35),)
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment(0.8, 1),
                        colors: [
                          Colors.limeAccent,
                          Colors.teal
                        ]
                    )
                ),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/logo-ig-instagram-png-transparent-instagram-images-pluspng-3.png',scale: 3,),
                    Text('Instagram',style: TextStyle(fontSize: 35),)
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment(0.8, 1),
                        colors: [
                          Colors.indigo,
                          Colors.tealAccent
                        ]
                    )
                ),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/twitter-bird-symbols-png-logo-0.png',scale: 3,),
                    Text('Twitter',style: TextStyle(fontSize: 35),)
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 16,
            right: 32,
            child: isLastPage
                ?
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: RaisedButton(
                color: Colors.transparent,
                  elevation: 0,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ButtonPlugIn()));
                  },
                  child: Text('Get Started',style: TextStyle(color: Colors.black,fontSize: 17),)),
            )
                :
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: (){
                      pageController.jumpToPage(page: 3);
                    },
                    child: Text('SKIP',style: TextStyle(color: Colors.black),)),

                TextButton(
                    onPressed: (){
                      final page = pageController.currentPage + 1;
                      pageController.animateToPage(
                          page: page > 4 ? 0 : page,
                          duration: 400
                      );
                    },
                    child: Text('NEXT',style: TextStyle(color: Colors.black),))
              ],
            )
          )
        ],
      )
    );
  }
}

