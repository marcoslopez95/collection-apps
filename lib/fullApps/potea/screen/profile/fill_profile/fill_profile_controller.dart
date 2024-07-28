import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FillProfileController extends GetxController {
  var selectedGender = Rx<String?>(null);
  var genders = ['Male', 'Female'];
  var dateController = TextEditingController();
  TextEditingController birthday = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      String formattedDate = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      dateController.text = formattedDate;
    }
  }

  void selectGender(String gender) {
    selectedGender.value = gender;
  }
}