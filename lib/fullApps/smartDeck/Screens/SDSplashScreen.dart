import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/smartDeck/SDUtils/SDColors.dart';
import 'package:access_maketicket/fullApps/smartDeck/Screens/SDWalkThroughScreen.dart';
import 'package:access_maketicket/main.dart';
import 'package:access_maketicket/main/utils/AppWidget.dart';

class SDSplashScreen extends StatefulWidget {
  static String tag = '/smart_deck';

  @override
  _SDSplashScreenState createState() => _SDSplashScreenState();
}

class _SDSplashScreenState extends State<SDSplashScreen> with SingleTickerProviderStateMixin {
  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  @override
  void initState() {
    super.initState();
    // changeStatusColor(sdPrimaryColor);
    startTime();
  }

  void navigationPage() {
    finish(context);
    SDWalkThroughScreen().launch(context);
  }

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(appStore.isDarkModeOn ? black : white);
  }

  Widget build(BuildContext context) {
    changeStatusColor(sdPrimaryColor);
    return SafeArea(
      child: Scaffold(
        backgroundColor: sdPrimaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Image.asset('images/smartDeck/images/sdlogo.png', height: 105),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Text("Smartdeck", style: secondaryTextStyle(size: 25, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
