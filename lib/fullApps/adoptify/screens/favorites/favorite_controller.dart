import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../pets/model/pets_model.dart';

class FavoritePetsController extends GetxController {
  var favoritePets = <PetsModel>[].obs;
  RxString selectedCategory = 'Cats'.obs;

  void addToFavorites(PetsModel pet) {
    if (!favoritePets.contains(pet)) {
      favoritePets.add(pet);
    }
  }

  void removeFromFavorites(PetsModel pet) {
    favoritePets.remove(pet);
  }

  bool isFavorite(PetsModel pet) {
    return favoritePets.contains(pet);
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  var lastBackPressTime = 0.obs;

  bool onWillPop(BuildContext context) {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    if (currentTime - lastBackPressTime.value < 2000) {
      return true;
    } else {
      lastBackPressTime.value = currentTime;
      toast('Press Back Again to Exit');
      return false;
    }
  }
}
