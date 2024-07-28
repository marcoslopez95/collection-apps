import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/assets.dart';
import '../../../../main/utils/AppConstant.dart';
import '../pets/model/pets_model.dart';
import 'model/search_model.dart';

class SearchPetController extends GetxController {
  final TextEditingController locController = TextEditingController();

  final RxList<PetsModel> pettype = RxList<PetsModel>([
    PetsModel(image: "${BaseUrl}/images/adoptify/pets/dog.png", name: "Dog"),
    PetsModel(image: "${BaseUrl}/images/adoptify/pets/cat.png", name: "Cat"),
    PetsModel(image: "${BaseUrl}/images/adoptify/pets/rabbit.png", name: "Rabbit"),
    PetsModel(image: "${BaseUrl}/images/adoptify/pets/parrot.png", name: "Birds"),
    PetsModel(image: "${BaseUrl}/images/adoptify/pets/snake.png", name: "Reptiles"),
    PetsModel(image: "${BaseUrl}/images/adoptify/pets/fish.png", name: "Fish"),
    PetsModel(image: "${BaseUrl}/images/adoptify/pets/monkey.png", name: "Primates"),
    PetsModel(image: "${BaseUrl}/images/adoptify/icons/pawprint.png", name: "Other")
  ]);

  final RxList<GenderModel> gender = RxList<GenderModel>([GenderModel(gender: "Any"), GenderModel(gender: "Male"), GenderModel(gender: "Female")]);

  final RxList<SizeModel> size = RxList<SizeModel>([SizeModel(size: "Small"), SizeModel(size: "Medium"), SizeModel(size: "Large")]);

  final RxList<AgeModel> age = RxList<AgeModel>([AgeModel(age: "Baby"), AgeModel(age: "Young"), AgeModel(age: "Adult"), AgeModel(age: "Senior")]);

  void togglePetTypeSelection(PetsModel pet) {
    for (var p in pettype) {
      p.selected.value = false;
    }
    int index = pettype.indexWhere((p) => p.name == pet.name);
    if (index != -1) {
      pettype[index].selected.value = true;
      print("Selected PetType index: $index");
    }
    pettype.refresh();
  }

  void toggleGenderSelection(GenderModel gen) {
    for (var g in gender) {
      g.selected.value = false;
    }
    int index = gender.indexWhere((g) => g.gender == gen.gender);
    if (index != -1) {
      gender[index].selected.value = true;
      print("Selected Petgender index: $index");
    }
    gender.refresh();
  }

  void toggleSizeSelection(SizeModel petsize) {
    for (var s in size) {
      s.selected.value = false;
    }
    int index = size.indexWhere((s) => s.size == petsize.size);
    if (index != -1) {
      size[index].selected.value = true;
      print("Selected Petsize index: $index");
    }
    size.refresh();
  }

  void toggleAgeSelection(AgeModel petage) {
    for (var a in age) {
      a.selected.value = false;
    }
    int index = age.indexWhere((a) => a.age == petage.age);
    if (index != -1) {
      age[index].selected.value = true;
      print("Selected Petage index: $index");
    }
    age.refresh();
  }
}
