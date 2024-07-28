import 'dart:async';

import 'package:get/get.dart';

class EnterPinController extends GetxController {
  RxBool hidePin = true.obs;
  RxInt timeLeft = 10.obs;
  late Timer timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (timeLeft.value > 0) {
        timeLeft.value = timeLeft.value - 1;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
