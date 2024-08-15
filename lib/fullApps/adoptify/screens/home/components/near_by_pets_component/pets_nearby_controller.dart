import 'package:get/get.dart';
import 'package:access_maketicket/main/utils/AppConstant.dart';

import '../../../pets/model/pets_model.dart';

class NearByPetsController extends GetxController {
  final RxInt selectedNearPetIndex = 0.obs;
  var imageindex = 0.obs;

  RxList<PetsModel> cats = <PetsModel>[
    PetsModel(
      id: "c1",
      name: "Whiskers",
      distance: "1.5 km",
      breed: "Siamese",
      image: "${BaseUrl}/images/adoptify/cat/cat.jpg",
      image2: "${BaseUrl}/images/adoptify/cat/cat1.jpg",
      image3: "${BaseUrl}/images/adoptify/cat/cat3.jpg",
      age: "Adult",
      gender: "Male",
      size: "Small",
      isFavorited: false,
    ),
  ].obs;

  RxList<PetsModel> dogs = <PetsModel>[
    PetsModel(
      id: "d1",
      name: "Max ",
      distance: "1.5 km",
      breed: "Labrador Retriever",
      age: "Adult",
      gender: "Male",
      size: "Small",
      image: "${BaseUrl}/images/adoptify/dog/dog.jpg",
      isFavorited: false,
    ),
  ].obs;

  RxList<PetsModel> rabbits = <PetsModel>[
    PetsModel(
      id: "r1",
      name: "Thumper ",
      distance: "1.5 km",
      breed: "Holland Lop",
      image: "${BaseUrl}/images/adoptify/rabbit/rabbit.jpg",
      age: "Adult",
      gender: "Male",
      size: "Small",
      isFavorited: false,
    ),
  ].obs;

  RxList<PetsModel> bird = <PetsModel>[
    PetsModel(
      id: "b1",
      name: "Sky ",
      distance: "1.5 km",
      breed: "Budgerigar ",
      image: "${BaseUrl}/images/adoptify/birds/bird.jpg",
      age: "Adult",
      gender: "Male",
      size: "Small",
      isFavorited: false,
    ),
  ].obs;

  RxList<PetsModel> reptiles = <PetsModel>[
    PetsModel(
      id: "rp1",
      name: "Bearded Dragon",
      distance: "10.5 km",
      breed: "Pogona vitticeps",
      image: "${BaseUrl}/images/adoptify/reptile/reptile1.jpg",
      age: "Young",
      gender: "Female",
      size: "Medium",
      isFavorited: false,
    ),
  ].obs;

  RxList<PetsModel> nearpet = RxList<PetsModel>([]);

  @override
  void onInit() {
    super.onInit();
    nearpet.addAll([cats.first, dogs.first, rabbits.first, bird.first, reptiles.first]);
  }
}
