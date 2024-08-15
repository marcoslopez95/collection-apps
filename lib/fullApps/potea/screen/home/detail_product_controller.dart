import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:access_maketicket/fullApps/potea/screen/auth/option_screen.dart';

import '../../utils/image.dart';
import 'model/plant_image_model.dart';

class DetailProductController extends GetxController {
  PageController pageController = PageController();

  RxInt currentPage = 0.obs;

  List<PlantImageModel> plantDetails = [
    PlantImageModel(image: imagePlbest),
    PlantImageModel(image: imagePlbestTWO),
    PlantImageModel(image: imagePlbestTHREE),
  ];

  void handleNext() {
    pageController.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.bounceIn);
    if (currentPage.value == (plantDetails.length - 1)) {
      Get.to(() => OptionScreen());
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
