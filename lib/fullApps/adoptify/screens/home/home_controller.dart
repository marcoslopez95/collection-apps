import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/main/utils/AppConstant.dart';

import '../../../../generated/assets.dart';
import '../pets/model/pets_model.dart';
import '../pets/pet_controller.dart';

class HomeScreenController extends GetxController {
  final RxInt selectedPetType = 0.obs;
  final PetController _controller = Get.put(PetController());

  final RxInt selectedPetIndex = 0.obs;
  final RxInt imageindex = 0.obs;

  void setSelectedPetIndex(int index) {
    selectedPetIndex.value = index;
  }

  RxList fetchPetList(int petType) {
    switch (petType) {
      case 0:
        return _controller.dog;
      case 1:
        return _controller.cat;
      case 2:
        return _controller.rabbit;
      case 3:
        return _controller.bird;
      case 4:
        return _controller.reptile;
      case 5:
        return _controller.fish;
      case 6:
        return _controller.primates;
      case 7:
        return _controller.horse;
      default:
        return RxList();
    }
  }

  final RxList<PetsModel> pet = RxList<PetsModel>([
    PetsModel(image: "${BaseUrl}/images/adoptify/pets/dog.png", name: "Dog"),
    PetsModel(image: "${BaseUrl}/images/adoptify/pets/cat.png", name: "Cat"),
    PetsModel(image: "${BaseUrl}/images/adoptify/pets/rabbit.png", name: "Rabbit"),
    PetsModel(image: "${BaseUrl}/images/adoptify/pets/parrot.png", name: "Birds"),
    PetsModel(image: "${BaseUrl}/images/adoptify/pets/snake.png", name: "Reptiles"),
    PetsModel(image: "${BaseUrl}/images/adoptify/pets/fish.png", name: "Fish"),
    PetsModel(image: "${BaseUrl}/images/adoptify/pets/monkey.png", name: "Primates"),
    PetsModel(image: "${BaseUrl}/images/adoptify/icons/pawprint.png", name: "Other")
  ]);

  var lastBackPressTime = 0.obs;

  bool onWillPop(BuildContext context) {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    if (currentTime - lastBackPressTime.value < 2000) {
      return true; // Exit the app
    } else {
      lastBackPressTime.value = currentTime;
      toast('Press Back Again to Exit');
      return false;
    }
  }
}
