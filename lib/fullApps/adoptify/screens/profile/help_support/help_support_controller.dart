import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpSupportController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final RxString selectedCategory = "General".obs;
  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  var expandedIndex = (-1).obs;

  void toggleExpanded(int index) {
    if (expandedIndex.value == index) {
      expandedIndex.value = -1;
    } else {
      expandedIndex.value = index;
    }
  }
}
