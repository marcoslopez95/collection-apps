import 'package:get/get.dart';

import '../../pets/model/pets_model.dart';
import '../../pets/pet_controller.dart';

class PetSearchController extends GetxController {
  RxString selectedCategory = 'Cats'.obs;
  final RxInt selectedPetIndex = 0.obs;
  final RxInt imageindex = 0.obs;

  void setSelectedPetIndex(int index) {
    selectedPetIndex.value = index;
  }

  final PetController petController = Get.put(PetController());

  List<PetsModel> getAnimalsList() {
    switch (selectedCategory.value) {
      case 'Cats':
        return petController.cat;
      case 'Dogs':
        return petController.dog;
      case 'Birds':
        return petController.bird;
      case 'Horses':
        return petController.horse;
      case 'Rabbits':
        return petController.rabbit;
      case 'Reptiles':
        return petController.reptile;
      case 'Fish':
        return petController.fish;
      case 'Primates':
        return petController.primates;
      default:
        return [];
    }
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }
}
