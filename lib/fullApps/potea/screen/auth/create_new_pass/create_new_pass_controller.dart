import 'package:get/get.dart';

class CreateNewPassController extends GetxController {
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
    isVisible.value = !isVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isPasswordVisible.value;
    isVisible.value = !isVisible.value;
  }

  final RxBool checkboxValue = false.obs;
  var isVisible = false.obs;
}
