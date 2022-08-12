import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
class LocalAuthPage extends StatefulWidget {
  const LocalAuthPage({Key? key}) : super(key: key);

  @override
  State<LocalAuthPage> createState() => _LocalAuthPageState();
}

class _LocalAuthPageState extends State<LocalAuthPage> {

  LocalAuthentication auth = LocalAuthentication();

  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;
  String? _authorized = "Not Authorized";

  Future <void> _checkBiometrics() async {
   late bool canCheckBiometrics;
    try{
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if(!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future <void> _getAvailableBiometrics() async {
    List <BiometricType>? availableBiometrics;

    try{
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if(!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future <void> _authenticate() async {
    bool? authenticated = false;
    try{
      authenticated = await auth.authenticate(
          localizedReason: "scan Your FingerPrint to authenticate",
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    } on PlatformException catch (e) {
      print(e);
    }

    if(!mounted){
      _authorized = authenticated! ? "Authorized" : "Not Authorized";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Auth Example'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Can checkBiometrics: $_canCheckBiometrics\n'),
              RaisedButton(
                  child: Text('Check Biometrics'),
                  onPressed: _checkBiometrics
              ),Text('Available checkBiometrics: $_availableBiometrics\n'),
              RaisedButton(
                  child: Text('Get available Biometrics'),
                  onPressed: _getAvailableBiometrics
              ),Text('Current State: $_authorized\n'),
              RaisedButton(
                  child: Text('Authentication'),
                  onPressed: _authenticate
              ),
            ],
          ),
        ),
      ),
    );
  }
}
