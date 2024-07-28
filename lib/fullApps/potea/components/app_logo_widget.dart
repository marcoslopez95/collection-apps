import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../screen/splash/potea_splash_screen_controller.dart';
import '../utils/colors.dart';
import '../utils/configs.dart';
import '../utils/constants.dart';

class AppLogoWidget extends StatelessWidget {
  final PoteaSplashController _splashController = Get.put(PoteaSplashController());

  AppLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constants.appLogoSize,
      width: Constants.appLogoSize,
      alignment: Alignment.center,
      decoration: boxDecorationDefault(
        shape: BoxShape.circle,
        color: poteaPrimaryColor,
      ),
      child: Text(APP_NAME.toUpperCase(), style: boldTextStyle(color: white, letterSpacing: 10)),
    );
  }
}
