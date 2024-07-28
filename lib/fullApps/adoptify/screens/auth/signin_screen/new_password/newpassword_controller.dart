import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPasswordController extends GetxController {
  final TextEditingController newController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  var is_Visible = true.obs;

  void toggle_PasswordVisibility() {
    is_Visible.value = !is_Visible.value;
  }

  var isVisible = true.obs;

  void togglePasswordVisibility() {
    isVisible.value = !isVisible.value;
  }
}
