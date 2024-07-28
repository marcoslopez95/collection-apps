import 'package:get/get.dart';

class SecurityController extends GetxController {
  var isRememberMe = false.obs;
  var isFaceID = false.obs;
  var isBiometricID = false.obs;

  void toggleRememberMe(bool value) {
    isRememberMe.value = value;
  }

  void toggleFaceID(bool value) {
    isFaceID.value = value;
  }

  void toggleBiometricID(bool value) {
    isBiometricID.value = value;
  }
}
