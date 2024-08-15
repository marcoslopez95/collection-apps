import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:access_maketicket/fullApps/potea/components/app_scaffold.dart';
import 'package:access_maketicket/fullApps/potea/screen/splash/potea_splash_screen_controller.dart';
import 'package:access_maketicket/fullApps/potea/screen/welcomeScreen/welcome_screen.dart';
import 'package:access_maketicket/fullApps/potea/utils/constants.dart';

import '../../utils/image.dart';

class PoteaSplashScreen extends StatelessWidget {
  PoteaSplashScreen({Key? key}) : super(key: key);
  final PoteaSplashController controller = Get.put(PoteaSplashController());

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Get.off(() => WelcomeScreen());
    });
    return AppScaffold(
      hideAppBar: true,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.network(
                  assetsPotea,
                  height: Constants.appLogoSize,
                  width: Constants.appLogoSize,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 26,
            left: 16,
            right: 16,
            child: Lottie.network(lottiePoteaLoader, width: 0, height: 130),
          ),
        ],
      ),
    );
  }
}
