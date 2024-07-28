import 'package:get/get.dart';

class SignUpController extends GetxController {
  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
    isVisible.value = !isVisible.value;
  }

  final RxBool checkboxValue = false.obs;
  var isVisible = false.obs;
}
