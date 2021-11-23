import 'dart:async';
import 'package:carshop/modules/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'companats/file_companates.dart';
import 'layout/layout.dart';

class SplashScreen extends StatefulWidget {
  @override
  _LottiScreenState createState() => _LottiScreenState();
}

class _LottiScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds:3 ),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => user==null?LoginScreen():Bee3Layout(),)));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:Center(
          child: Container(
            child: Lottie.asset(
              'images/splash.json',
            ),
          ),
        ),
      ),
    );
  }
}