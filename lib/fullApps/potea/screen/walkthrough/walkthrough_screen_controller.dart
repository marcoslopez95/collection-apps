import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prokit_flutter/fullApps/potea/screen/auth/option_screen.dart';

import '../../utils/image.dart';
import 'model/walkthrough_model.dart';

class WalkthroughController extends GetxController {
  PageController pageController = PageController();

  RxInt currentPage = 0.obs;

  List<WalkThroughElementModel> walkthroughDetails = [
    WalkThroughElementModel(image1: walkthroughWalkthroughLightOne, image2: walkthroughWalkthroughDarkOne, title: 'We provide high quality plants just for you'),
    WalkThroughElementModel(image1: walkthroughWalkthroughLightTwoRemovebg, image2: walkthroughWalkthroughLightTwoRemovebg, title: 'Your satisfaction is our number one priority'),
    WalkThroughElementModel(image1: walkthroughWalkthroughLightThreeRemovebg, image2: walkthroughWalkthroughLightThreeRemovebg, title: "Let's Shop Your Favorite Plants with Potea Now!"),
  ];

  void handleNext() {
    if (currentPage.value < walkthroughDetails.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      Get.to(() => OptionScreen());
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
