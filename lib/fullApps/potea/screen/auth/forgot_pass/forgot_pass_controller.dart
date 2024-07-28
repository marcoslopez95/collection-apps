import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/image.dart';

class Detail1Model {
  String Image;
  String text;
  String inputText;

  Detail1Model({this.Image = '', this.text = '', this.inputText = ''});
}

class ForgotPasswordController extends GetxController {
  final TextEditingController signupController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController petownerController = TextEditingController();
  final RxBool checkboxValue = false.obs;
  var isVisible = false.obs;
  RxInt timeLeft = 10.obs;
  late Timer timer;

  void togglePasswordVisibility() {
    isVisible.value = !isVisible.value;
  }

  final RxList<Detail1Model> options = RxList<Detail1Model>([
    Detail1Model(Image: icMessenge, text: 'via SMS:', inputText: '8746346'),
    Detail1Model(Image: icMail, text: 'via Email:', inputText: 'and***ley@yourdomail.com'),
  ].obs);
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

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
