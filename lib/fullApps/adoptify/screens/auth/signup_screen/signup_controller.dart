import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:access_maketicket/fullApps/adoptify/screens/auth/signup_screen/signup_model.dart';
import 'package:access_maketicket/main/utils/AppConstant.dart';

import '../../../../../generated/assets.dart';
import '../../pets/model/pets_model.dart';

class SignUpController extends GetxController {
  final TextEditingController signupController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController petownerController = TextEditingController();
  final RxBool checkboxValue = false.obs;
  var isVisible = true.obs;

  void togglePasswordVisibility() {
    isVisible.value = !isVisible.value;
  }

  var currentPage = 0.obs;

  final RxList<Detail1Model> options = RxList<Detail1Model>([Detail1Model(text: 'Pet Owner or Organization'), Detail1Model(text: 'Pet Adopter')].obs);
  final RxInt selectedOptionIndex = 0.obs;

  final RxInt selectedPetIndex = 0.obs;
  final RxList<PetsModel> pet = RxList<PetsModel>([
    PetsModel(image: "${BaseUrl}/images/adoptify/pets/dog.png", name: "Dog"),
    PetsModel(image: "${BaseUrl}/images/adoptify/pets/cat.png", name: "Cat"),
    PetsModel(image: "${BaseUrl}/images/adoptify/pets/rabbit.png", name: "Rabbit"),
    PetsModel(image: "${BaseUrl}/images/adoptify/pets/parrot.png", name: "Birds"),
    PetsModel(image: "${BaseUrl}/images/adoptify/pets/snake.png", name: "Reptiles"),
    PetsModel(image: "${BaseUrl}/images/adoptify/pets/fish.png", name: "Fish"),
    PetsModel(image: "${BaseUrl}/images/adoptify/pets/monkey.png", name: "Primates"),
    PetsModel(image: "${BaseUrl}/images/adoptify/pets/horse.png", name: "Horse"),
    PetsModel(
      image: "${BaseUrl}/images/adoptify/icons/pawprint.png",
      name: "Other",
    )
  ]);

  //detail3
  void toggleBreedSelection(Detail3Model breed) {
    int index = breeds.indexWhere((b) => b.breed == breed.breed);
    if (index != -1) {
      breeds[index].selected.value = !breeds[index].selected.value;
      breeds.refresh();
    }
  }

  RxList<Detail3Model> breeds = RxList<Detail3Model>([
    Detail3Model(breed: 'Persian'),
    Detail3Model(breed: 'Maine Coon'),
    Detail3Model(breed: 'Bengal'),
    Detail3Model(breed: 'Siamese'),
    Detail3Model(breed: 'Ragdoll'),
    Detail3Model(breed: 'Sphynx'),
    Detail3Model(breed: 'Abyssinian'),
    Detail3Model(breed: 'Birman'),
    Detail3Model(breed: 'Russian Blue'),
    Detail3Model(breed: 'Siberian'),
    Detail3Model(breed: 'British Shorthair'),
    Detail3Model(breed: 'Exotic Shorthair'),
    Detail3Model(breed: 'Turkish Angora'),
    Detail3Model(breed: 'Manx'),
    Detail3Model(breed: 'Himalayan'),
    Detail3Model(breed: 'Devon Rex')
  ]);

  //detail4

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  final List<GenderModel> genders = RxList<GenderModel>([GenderModel(gender: "Male"), GenderModel(gender: "Female")]);
  final RxString selectedGender = 'Male'.obs;
}
