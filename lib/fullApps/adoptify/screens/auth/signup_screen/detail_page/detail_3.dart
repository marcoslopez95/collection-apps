import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../../main.dart';
import '../../../../utils/color.dart';
import '../signup_controller.dart';
import '../signup_model.dart';

class DetailPage3 extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());

  DetailPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Observer(builder: (context) {
              return Text(
                "Breed Preferences",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Get.width * 0.08,
                  color: appStore.isDarkModeOn ? white : black,
                ),
              );
            }),
            30.height,
            Observer(builder: (context) {
              return Text(
                "Specify your preferences for the breed of the animal you'd like to adopt. based on your previous choice. Select all that apply.",
                style: TextStyle(
                  fontSize: Get.width * 0.04,
                  color: appStore.isDarkModeOn ? Colors.white38 : Colors.black45,
                ),
              );
            }),
            40.height,
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: controller.breeds.map<Widget>((Detail3Model breed) {
                return Obx(
                  () => FilterChip(
                    label: Observer(builder: (context) {
                      return Text(
                        breed.breed,
                        style: TextStyle(color: appStore.isDarkModeOn ? white : black, fontSize: 16),
                      );
                    }),
                    showCheckmark: false,
                    selected: breed.selected.value,
                    selectedColor: adoptifyPrimaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), side: BorderSide(color: Colors.grey)),
                    onSelected: (bool selected) {
                      controller.toggleBreedSelection(breed);
                      if (selected) {
                        // ignore: unused_local_variable
                        int index = controller.breeds.indexOf(breed);
                      }
                    },
                  ),
                );
              }).toList(),
            ),
            120.height,
          ],
        ).paddingAll(Get.height * 0.02),
      ),
    );
  }
}
