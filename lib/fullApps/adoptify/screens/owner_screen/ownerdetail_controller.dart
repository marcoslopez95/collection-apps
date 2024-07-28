import 'package:get/get.dart';

import '../pets/model/pets_model.dart';
import '../pets/pet_controller.dart';

class OwnerDetailController extends GetxController {
  var selectedTabIndex = 0.obs;

  final PetController _controller = Get.put(PetController());

  var randomPets = <PetsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchRandomPets();
  }

  void fetchRandomPets() {
    final allPets = [
      ..._controller.cat,
      ..._controller.dog,
      ..._controller.bird,
      ..._controller.horse,
      ..._controller.rabbit,
      ..._controller.reptile,
      ..._controller.fish,
      ..._controller.primates,
    ];
    allPets.shuffle();
    randomPets.value = allPets.take(20).toList();
  }
}
