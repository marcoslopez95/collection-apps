import 'package:get/get.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

import 'model/pets_model.dart';

class PetController extends GetxController {
  RxList<PetsModel> cat = <PetsModel>[
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
        isFavorited: false),
    PetsModel(id: "c2", name: "Bella", distance: "1.5 km", breed: "Maine Coon", age: "Young", gender: "Female", size: "Medium", image: "${BaseUrl}/images/adoptify/cat/cat1.jpg", image2: "${BaseUrl}/images/adoptify/cat/cat6.jpg", isFavorited: false),
    PetsModel(id: "c3", name: "Simba", distance: "1.5 km", breed: "Bengal", age: "Young", gender: "Female", size: "Medium", image: "${BaseUrl}/images/adoptify/cat/cat2.jpg", isFavorited: false),
    PetsModel(id: "c4", name: "Mittens", distance: "1.5 km", breed: "Ragdoll", age: "Adult", gender: "Male", size: "Small", image: "${BaseUrl}/images/adoptify/cat/cat3.jpg", isFavorited: false),
    PetsModel(id: "c5", name: "Oliver", distance: "1.5 km", breed: "Scottish Fold", age: "Young", gender: "Female", size: "Medium", image: "${BaseUrl}/images/adoptify/cat/cat4.jpg", isFavorited: false),
    PetsModel(id: "c6", name: "Shadow", distance: "1.5 km", breed: " Russian Blue", age: "Adult", gender: "Male", size: "Small", image: "${BaseUrl}/images/adoptify/cat/cat5.jpg", isFavorited: false),
    PetsModel(id: "c7", name: "Cleo", distance: "1.5 km", breed: " Sphynx", age: "Young", gender: "Female", size: "Medium", image: "${BaseUrl}/images/adoptify/cat/cat6.jpg", isFavorited: false),
    PetsModel(id: "c8", name: "Luna", distance: "1.5 km", breed: " Persian", age: "Adult", gender: "Male", size: "Small", image: "${BaseUrl}/images/adoptify/cat/cat1.jpg", isFavorited: false),
  ].obs;

  RxList<PetsModel> dog = <PetsModel>[
    PetsModel(id: "d1", name: "Max ", distance: "1.5 km", breed: "Labrador Retriever", age: "Adult", gender: "Male", size: "Small", image: "${BaseUrl}/images/adoptify/dog/dog.jpg", isFavorited: false),
    PetsModel(id: "d2", name: "Ollie", distance: "1.5 km", breed: "German Shepherd", age: "Adult", gender: "Male", size: "Small", image: "${BaseUrl}/images/adoptify/dog/dog2.jpg", isFavorited: false),
    PetsModel(id: "d3", name: "Charlie ", distance: "1.5 km", breed: "Golden Retriever", age: "Adult", gender: "Male", size: "Small", image: "${BaseUrl}/images/adoptify/dog/dog3.jpg", isFavorited: false),
    PetsModel(id: "d4", name: "Lucy", distance: "1.5 km", breed: "Beagle", image: "${BaseUrl}/images/adoptify/dog/dog4.jpg", age: "Young", gender: "Female", size: "Medium", isFavorited: false),
    PetsModel(id: "d5", name: "Rocky ", distance: "1.5 km", breed: "Boxer", age: "Adult", gender: "Male", size: "Small", image: "${BaseUrl}/images/adoptify/dog/dog5.jpg", isFavorited: false),
    PetsModel(id: "d6", name: "Daisy", distance: "1.5 km", breed: "Dachshund", age: "Young", gender: "Female", size: "Medium", image: "${BaseUrl}/images/adoptify/dog/dog6.jpg", isFavorited: false),
    PetsModel(id: "d7", name: "Cooper ", distance: "1.5 km", breed: "Bulldog", image: "${BaseUrl}/images/adoptify/dog/dog7.jpg", age: "Adult", gender: "Male", size: "Small", isFavorited: false),
    PetsModel(id: "d8", name: "Molly ", distance: "1.5 km", breed: "Poodle", age: "Young", gender: "Female", size: "Medium", image: "${BaseUrl}/images/adoptify/dog/dog8.jpg", isFavorited: false),
  ].obs;

  RxList<PetsModel> bird = <PetsModel>[
    PetsModel(id: "b1", name: "Sky ", distance: "1.5 km", breed: "Budgerigar ", image: "${BaseUrl}/images/adoptify/birds/bird.jpg", age: "Adult", gender: "Male", size: "Small", isFavorited: false),
    PetsModel(id: "b2", name: "Sunny ", distance: "1.5 km", breed: "Canary", age: "Young", gender: "Female", size: "Medium", image: "${BaseUrl}/images/adoptify/birds/bird2.jpg", isFavorited: false),
    PetsModel(id: "b3", name: "Polly ", distance: "1.5 km", breed: "Amazon Parrot", age: "Adult", gender: "Male", size: "Small", image: "${BaseUrl}/images/adoptify/birds/bird3.jpg", isFavorited: false),
    PetsModel(id: "b4", name: "Coco ", distance: "1.5 km", age: "Young", gender: "Female", size: "Medium", breed: "Cockatiel", image: "${BaseUrl}/images/adoptify/birds/bird4.jpg", isFavorited: false),
    PetsModel(id: "b5", name: "Kiwi ", distance: "1.5 km", breed: "Lovebird", age: "Adult", gender: "Male", size: "Small", image: "${BaseUrl}/images/adoptify/birds/bird5.jpg", isFavorited: false),
    PetsModel(id: "b6", name: "Rio ", distance: "1.5 km", breed: "Macaw", age: "Young", gender: "Female", size: "Medium", image: "${BaseUrl}/images/adoptify/birds/bird6.jpg", isFavorited: false),
    PetsModel(id: "b7", name: "Pepper ", distance: "1.5 km", breed: "African Grey Parrot", age: "Adult", gender: "Male", size: "Small", image: "${BaseUrl}/images/adoptify/birds/bird7.jpg", isFavorited: false),
    PetsModel(id: "b8", name: "Luna ", distance: "1.5 km", breed: "Cockatoo", age: "Young", gender: "Female", size: "Medium", image: "${BaseUrl}/images/adoptify/birds/bird8.jpg", isFavorited: false),
    PetsModel(id: "b9", name: "Mango ", distance: "1.5 km", breed: "Conure", age: "Adult", gender: "Male", size: "Small", image: "${BaseUrl}/images/adoptify/birds/bird9.jpg", isFavorited: false),
    PetsModel(id: "b10", name: "Blue ", distance: "1.5 km", breed: "Parakeet", age: "Young", gender: "Female", size: "Medium", image: "${BaseUrl}/images/adoptify/birds/birds.jpg", isFavorited: false),
  ].obs;

  RxList<PetsModel> horse = <PetsModel>[
    PetsModel(id: "h1", name: "Thunder ", distance: "1.5 km", breed: "Thoroughbred", age: "Young", gender: "Female", size: "Medium", image: "${BaseUrl}/images/adoptify/horse/horse.jpg", isFavorited: false),
    PetsModel(id: "h2", name: "Bella ", distance: "1.5 km", breed: "Arabian", age: "Adult", gender: "Male", size: "Small", image: "${BaseUrl}/images/adoptify/horse/horse1.jpg", isFavorited: false),
    PetsModel(id: "h3", name: "Spirit ", distance: "1.5 km", breed: "Mustang", age: "Young", gender: "Female", size: "Medium", image: "${BaseUrl}/images/adoptify/horse/horse2.jpg", isFavorited: false),
    PetsModel(id: "h4", name: "Majesty ", distance: "1.5 km", breed: "Friesian", age: "Adult", gender: "Male", size: "Small", image: "${BaseUrl}/images/adoptify/horse/horse3.jpg", isFavorited: false),
    PetsModel(id: "h5", name: "Scout ", distance: "1.5 km", breed: "Appaloosa", age: "Young", gender: "Female", size: "Medium", image: "${BaseUrl}/images/adoptify/horse/horse4.jpg", isFavorited: false),
    PetsModel(id: "h6", name: "Starlight ", distance: "1.5 km", breed: "Quarter Horse", age: "Young", gender: "Female", size: "Medium", image: "${BaseUrl}/images/adoptify/horse/horse5.jpg", isFavorited: false),
    PetsModel(id: "h7", name: "Ginger ", distance: "1.5 km", age: "Adult", gender: "Male", size: "Small", breed: "Clydesdale", image: "${BaseUrl}/images/adoptify/horse/horse6.jpg", isFavorited: false),
    PetsModel(id: "h8", name: "Duke ", distance: "1.5 km", age: "Adult", gender: "Male", size: "Small", breed: "Hanoverian", image: "${BaseUrl}/images/adoptify/horse/horse7.jpg", isFavorited: false),
    PetsModel(id: "h9", name: "Willow ", distance: "1.5 km", breed: "Andalusian", image: "${BaseUrl}/images/adoptify/horse/horse8.jpg", age: "Adult", gender: "Male", size: "Small", isFavorited: false),
  ].obs;

  RxList<PetsModel> rabbit = <PetsModel>[
    PetsModel(id: "r1", name: "Thumper ", distance: "1.5 km", breed: "Holland Lop", image: "${BaseUrl}/images/adoptify/rabbit/rabbit.jpg", age: "Adult", gender: "Male", size: "Small", isFavorited: false),
    PetsModel(id: "r2", name: "Snowball ", distance: "1.5 km", breed: " Netherland Dwarf", image: "${BaseUrl}/images/adoptify/rabbit/rabbit1.jpg", age: "Young", gender: "Female", size: "Medium", isFavorited: false),
    PetsModel(id: "r3", name: "Coco ", distance: "1.5 km", breed: "Mini Rex", image: "${BaseUrl}/images/adoptify/rabbit/rabbit2.jpg", age: "Adult", gender: "Male", size: "Small", isFavorited: false),
    PetsModel(id: "r4", name: "Oreo ", distance: "1.5 km", breed: "Dutch", image: "${BaseUrl}/images/adoptify/rabbit/rabbit4.jpg", age: "Young", gender: "Female", size: "Medium", isFavorited: false),
    PetsModel(id: "r5", name: "Flopsy", distance: "1.5 km", breed: "English Lop", image: "${BaseUrl}/images/adoptify/rabbit/rabbit5.jpg", age: "Adult", gender: "Male", size: "Small", isFavorited: false),
    PetsModel(id: "r6", name: "Hazel", distance: "1.5 km", breed: "Lionhead", image: "${BaseUrl}/images/adoptify/rabbit/rabbit6.jpg", age: "Adult", gender: "Male", size: "Small", isFavorited: false),
    PetsModel(id: "r7", name: "Pumpkin ", distance: "1.5 km", breed: " Flemish Giant", image: "${BaseUrl}/images/adoptify/rabbit/rabbit7.jpg", age: "Young", gender: "Female", size: "Medium", isFavorited: false),
    PetsModel(id: "r8", name: "Pepper ", distance: "1.5 km", breed: "Harlequin ", image: "${BaseUrl}/images/adoptify/rabbit/rabbit3.jpg", age: "Adult", gender: "Male", size: "Small", isFavorited: false),
  ].obs;

  RxList<PetsModel> reptile = <PetsModel>[
    PetsModel(id: "rp1", name: "Bearded Dragon", distance: "10.5 km", breed: "Pogona vitticeps", image: "${BaseUrl}/images/adoptify/reptile/reptile1.jpg", age: "Young", gender: "Female", size: "Medium", isFavorited: false),
    PetsModel(id: "rp2", name: "Leopard Gecko", distance: "7.2 km", breed: "Eublepharis macularius", image: "${BaseUrl}/images/adoptify/reptile/reptile2.jpg", age: "Adult", gender: "Male", size: "Small", isFavorited: false),
    PetsModel(id: "rp4", name: "Corn Snake", distance: "12.8 km", breed: "Pantherophis guttatus", image: "${BaseUrl}/images/adoptify/reptile/reptile3.jpg", age: "Young", gender: "Female", size: "Medium", isFavorited: false),
    PetsModel(id: "rp5", name: "Red-eared Slider", distance: "5.3 km", breed: "Trachemys scripta elegans", image: "${BaseUrl}/images/adoptify/reptile/reptile4.jpg", age: "Adult", gender: "Male", size: "Small", isFavorited: false),
  ].obs;

  RxList<PetsModel> fish = <PetsModel>[
    PetsModel(id: "f1", name: " Bubbles", distance: "1.5 km", breed: "Goldfish", image: "${BaseUrl}/images/adoptify/fish/fish1.jpg", age: "Young", gender: "Female", size: "Medium", isFavorited: false),
    PetsModel(id: "f2", name: "Neptune", distance: "1.5km", breed: "Betta Fish", image: "${BaseUrl}/images/adoptify/fish/fish2.jpg", age: "Adult", gender: "Male", size: "Small", isFavorited: false),
    PetsModel(id: "f3", name: "Splash", distance: "1.5 km", breed: "Guppy", image: "${BaseUrl}/images/adoptify/fish/fish3.jpg", age: "Adult", gender: "Male", size: "Small", isFavorited: false),
    PetsModel(id: "f4", name: "Finley", distance: "1.5 km", breed: "Siamese Fighting Fish", image: "${BaseUrl}/images/adoptify/fish/fish4.jpg", age: "Young", gender: "Female", size: "Medium", isFavorited: false),
    PetsModel(id: "f5", name: "Nemo", distance: "1.5 km", breed: "Clownfish", image: "${BaseUrl}/images/adoptify/fish/fish5.jpg", age: "Adult", gender: "Male", size: "Small", isFavorited: false),
  ].obs;

  RxList<PetsModel> primates = <PetsModel>[
    PetsModel(id: "p1", name: "Caesar", distance: "1.5 km", breed: "Chimpanzee", image: "${BaseUrl}/images/adoptify/primate/primates1.jpg", age: "Young", gender: "Female", size: "Medium", isFavorited: false),
    PetsModel(id: "p2", name: "Koko", distance: "1.5 km", breed: "Gorilla", image: "${BaseUrl}/images/adoptify/primate/primates2.jpg", age: "Adult", gender: "Male", size: "Small", isFavorited: false),
    PetsModel(id: "p3", name: "Mia", distance: "1.5 km", breed: "Bonobo", image: "${BaseUrl}/images/adoptify/primate/primates3.jpg", age: "Young", gender: "Female", size: "Medium", isFavorited: false),
    PetsModel(id: "p4", name: "Charlie", distance: "1.5 km", breed: "Orangutan", image: "${BaseUrl}/images/adoptify/primate/primates4.jpg", age: "Adult", gender: "Male", size: "Small", isFavorited: false),
    PetsModel(id: "p5", name: "Lucy", distance: "1.5 km", breed: "Common Marmoset", image: "${BaseUrl}/images/adoptify/primate/primates5.jpg", age: "Young", gender: "Female", size: "Medium", isFavorited: false),
  ].obs;
}
