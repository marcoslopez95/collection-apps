import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prokit_flutter/fullApps/adoptify/screens/profile/edit_profile/model/edit_profile_model.dart';

class MyprofileController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  final List<GenderModel> genders = RxList<GenderModel>([GenderModel(gender: "Male"), GenderModel(gender: "Female")]);
  final RxString selectedGender = 'Male'.obs;

  Future<void> selectDate(BuildContext context, MyprofileController dController) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1945),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      dController.dateController.text = formattedDate;
    }
  }
}
