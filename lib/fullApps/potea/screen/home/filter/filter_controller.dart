import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  var categories = ["All", "Cactus", "Sansevieria", "Palm"].obs;
  var selectedCategory = 'All'.obs;
  var rangeValues = RangeValues(1, 5000).obs; // Updated to use RangeValues
  var sortByOptions = ["Popular", "Most Recent", "Price High"].obs;
  var selectedSortBy = 'Most Recent'.obs;
  var ratings = ['All', '1', '2', '3', '4', '5'].obs;
  var selectedRating = 'All'.obs;

  void resetFilters() {
    selectedCategory.value = 'All';
    rangeValues.value = RangeValues(1, 5000); // Reset range values
    selectedSortBy.value = 'Most Recent';
    selectedRating.value = 'All';
  }
}
