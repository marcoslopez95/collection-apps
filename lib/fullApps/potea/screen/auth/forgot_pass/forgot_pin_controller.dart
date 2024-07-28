import 'dart:async';

import 'package:get/get.dart';

class ForgotPinController extends GetxController {
  RxInt timeLeft = 60.obs;
  late Timer timer;

  final RxInt selectedOptionIndex = 0.obs;

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

  void resetTimer() {
    timer?.cancel();
    timeLeft.value = 60;
    startTimer();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
