import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/jobSearch/screens/JSSignUpScreen.dart';
import 'package:access_maketicket/fullApps/jobSearch/utils/JSColors.dart';
import 'package:access_maketicket/fullApps/jobSearch/utils/JSImage.dart';
import 'package:access_maketicket/main.dart';

class JSSplashScreen extends StatefulWidget {
  static String tag = '/job_search';

  const JSSplashScreen({Key? key}) : super(key: key);

  @override
  _JSSplashScreenState createState() => _JSSplashScreenState();
}

class _JSSplashScreenState extends State<JSSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    setStatusBarColor(Colors.transparent);
    await 3.seconds.delay;
    finish(context);
    JSSignUpScreen().launch(context);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(js_SplashImage, height: 130, fit: BoxFit.cover, color: appStore.isDarkModeOn ? white : js_primaryColor),
          Image.network(js_loader, height: 35.0, width: 35.0),
        ],
      ).center(),
    );
  }
}
