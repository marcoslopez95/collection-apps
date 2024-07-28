import 'package:get/get.dart';

class OTPController extends GetxController {
  final countdown = 60.obs;
  final showResendButton = false.obs;

  void countdownTick() async {
    while (countdown.value > 0) {
      await Future.delayed(Duration(seconds: 1));
      countdown.value--;
    }
    showResendButton.value = true;
  }

  void restartCountdown() {
    countdown.value = 60;
    showResendButton.value = false;
    countdownTick();
  }
}
