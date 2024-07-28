import 'package:get/get.dart';
import 'package:prokit_flutter/fullApps/potea/screen/home/model/special_offer_model.dart';

class PlantListController extends GetxController {
  List<PlantModel> model = <PlantModel>[
    PlantModel(name: 'All'),
    PlantModel(name: 'Monstera'),
    PlantModel(name: 'Aloe'),
    PlantModel(name: 'Palm'),
    PlantModel(name: 'Snake Plant'),
    PlantModel(name: 'Spider Plant'),
    PlantModel(name: 'Air Plant'),
  ].obs;

  var selectedPlantIndex = (-1).obs;

  void selectPlant(int index) {
    selectedPlantIndex.value = index;
  }
}
