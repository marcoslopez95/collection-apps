import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  final TextEditingController petownerController = TextEditingController();
  final RxBool checkboxValue = false.obs;
  var is_Visible = true.obs;

  void toggle_PasswordVisibility() {
    is_Visible.value = !is_Visible.value;
  }
}
