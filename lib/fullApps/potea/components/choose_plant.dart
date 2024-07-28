import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../screen/home/model/pet_list_model.dart';
import '../screen/home/model/special_offer_model.dart';
import '../utils/colors.dart';

class MostPopular extends StatelessWidget {
  final PlantListController plantListController = Get.put(PlantListController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlantListController>(
      builder: (controller) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: controller.model.asMap().entries.map((entry) {
            int index = entry.key;
            PlantModel pet = entry.value;
            return Obx(
              () => GestureDetector(
                onTap: () {
                  plantListController.selectPlant(index);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: boxDecorationWithRoundedCorners(
                    backgroundColor: plantListController.selectedPlantIndex.value == index ? poteaPrimaryColor : context.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: poteaPrimaryColor, width: 2),
                  ),
                  child: Center(
                    child: Text(
                      pet.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: plantListController.selectedPlantIndex.value == index ? Colors.white : poteaPrimaryColor,
                      ),
                    ),
                  ),
                ).paddingOnly(left: 8),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
