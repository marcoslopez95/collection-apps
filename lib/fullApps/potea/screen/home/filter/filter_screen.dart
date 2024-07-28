import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../main.dart';
import '../../../utils/colors.dart';
import '../../../utils/common_base.dart';
import '../../../utils/image.dart';
import 'filter_controller.dart';

class filter_bottom extends StatelessWidget {
  final FilterController filterController = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.74,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: context.cardColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            indent: 3,
            height: 1,
            thickness: 3,
            color: borderColor.withOpacity(0.5),
          ).paddingSymmetric(horizontal: 140),
          SizedBox(height: Get.height * 0.016),
          Center(
            child: Text(
              'Sort & Filter',
              style: TextStyle(color: appStore.isDarkModeOn ? white : black, fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: Get.height * 0.016),
          commonDivider,
          SizedBox(height: Get.height * 0.016),
          Text(
            'Categories',
            style: TextStyle(color: appStore.isDarkModeOn ? white : black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: Get.height * 0.016),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(
              () => Row(
                children: filterController.categories.map((category) {
                  final isSelected = filterController.selectedCategory.value == category;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      showCheckmark: false,
                      label: Text(category, style: TextStyle(color: isSelected ? white : poteaPrimaryColor)),
                      selected: filterController.selectedCategory.value == category,
                      onSelected: (isSelected) {
                        filterController.selectedCategory.value = category;
                      },
                      selectedColor: poteaPrimaryColor,
                      backgroundColor: context.cardColor,
                      shape: RoundedRectangleBorder(side: BorderSide(color: poteaPrimaryColor, width: 1.5), borderRadius: BorderRadius.circular(30)),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: Get.height * 0.016),
          Text('Price Range', style: TextStyle(color: appStore.isDarkModeOn ? white : black, fontSize: 16, fontWeight: FontWeight.w600)),
          SizedBox(height: Get.height * 0.016),
          Obx(
            () => RangeSlider(
              min: 1,
              max: 5000,
              divisions: (5000 / 10).toInt(),
              labels: RangeLabels(
                filterController.rangeValues.value.start.toInt().toString(),
                filterController.rangeValues.value.end.toInt().toString(),
              ),
              values: filterController.rangeValues.value,
              onChanged: (values) {
                filterController.rangeValues.value = values;
              },
              activeColor: poteaPrimaryColor,
              inactiveColor: lightGrey,
            ),
          ),
          SizedBox(height: Get.height * 0.016),
          Text('Sort by', style: TextStyle(color: appStore.isDarkModeOn ? white : black, fontSize: 16, fontWeight: FontWeight.w600)),
          SizedBox(height: Get.height * 0.016),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(
              () => Row(
                children: filterController.sortByOptions.map((rating) {
                  final isSelected = filterController.selectedSortBy.value == rating;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      showCheckmark: false,
                      label: Text(rating, style: TextStyle(color: isSelected ? white : poteaPrimaryColor)),
                      selected: filterController.selectedSortBy.value == rating,
                      onSelected: (isSelected) {
                        filterController.selectedSortBy.value = rating;
                      },
                      selectedColor: poteaPrimaryColor,
                      backgroundColor: context.cardColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: poteaPrimaryColor, width: 1.5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: Get.height * 0.016),
          Text('Rating', style: TextStyle(color: appStore.isDarkModeOn ? white : black, fontSize: 16, fontWeight: FontWeight.w600)),
          SizedBox(height: Get.height * 0.016),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(
              () => Row(
                children: filterController.ratings.map((rating) {
                  final isSelected = filterController.selectedRating.value == rating;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      showCheckmark: false,
                      label: Row(
                        children: [
                          Image.network(isSelected ? icRatWhite : icRat, height: 14),
                          8.width,
                          Text(rating, style: TextStyle(color: isSelected ? white : poteaPrimaryColor)),
                        ],
                      ),
                      selected: filterController.selectedRating.value == rating,
                      onSelected: (isSelected) {
                        filterController.selectedRating.value = rating;
                      },
                      selectedColor: poteaPrimaryColor,
                      backgroundColor: context.cardColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: poteaPrimaryColor, width: 1.5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: Get.height * 0.016),
          commonDivider,
          SizedBox(height: Get.height * 0.016),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  height: Get.height * 0.02,
                  color: appStore.isDarkModeOn ? slateGrey : lightaddressColor,
                  shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  onTap: filterController.resetFilters,
                  child: Text('Reset', style: TextStyle(fontSize: 16, color: appStore.isDarkModeOn ? white : poteaPrimaryColor)),
                ),
              ),
              SizedBox(width: Get.width * 0.02),
              Expanded(
                child: AppButton(
                  height: Get.height * 0.02,
                  color: poteaPrimaryColor,
                  shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  onTap: () {
                    Get.back();
                  },
                  child: Text('Apply', style: TextStyle(fontSize: 16, color: white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
