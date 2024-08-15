import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/screen/welcomeScreen/welcome_screen_controller.dart';

import '../../../../main.dart';
import '../../utils/colors.dart';
import '../../utils/image.dart';

class WelcomeScreen extends StatelessWidget {
   WelcomeScreen({super.key});
  final WelcomeScreenController controller = Get.put(WelcomeScreenController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: appStore.isDarkModeOn ? context.scaffoldBackgroundColor : containerColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network( appStore.isDarkModeOn ? walkthroughWelcomeFinalDark : walkthroughWelcomeFinalLight,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 60,
            left: 16,
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Potea',
                    style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold, color: poteaPrimaryColor),
                  ),
                  Text(
                    'The best plant e-commerce & online\nstore app of century for your needs!',
                    style: TextStyle(fontSize: 18, color: grey, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
