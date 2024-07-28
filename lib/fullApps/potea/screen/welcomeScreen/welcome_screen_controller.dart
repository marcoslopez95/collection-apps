import 'package:get/get.dart';

import '../walkthrough/walkthrough_screen.dart';

class WelcomeScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Future.delayed(Duration(seconds: 3), () {
      Get.off(() => WalkthroughScreen());
    });
  }
}
