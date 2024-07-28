import 'package:get/get.dart';

class PetsModel {
  final String? id;
  final String image;
  final String? image2;
  final String? image3;
  final String? image4;
  final String name;
  final String? breed;
  final String? gender;
  final String? age;
  final String? size;
  final String? distance;
  final RxBool selected = false.obs;
  final RxBool isFavorited;

  PetsModel({
    this.id,
    required this.image,
    this.image2,
    this.image3,
    this.image4,
    required this.name,
    this.breed,
    this.gender,
    this.age,
    this.size,
    this.distance,
    bool? isFavorited,
  }) : isFavorited = (isFavorited ?? false).obs;
}

class DogModel extends PetsModel {
  DogModel({
    String? id,
    String? name,
    String? distance,
    String? breed,
    String? image,
    final String? image2,
    final String? image3,
    final String? image4,
    String? age,
    String? gender,
    String? size,
    required bool isFavorited,
  }) : super(
          id: id!,
          image: image!,
          image2: image2!,
          image3: image3!,
          image4: image4!,
          name: name!,
          breed: breed,
          age: age,
          gender: gender,
          size: size,
          distance: distance,
          isFavorited: isFavorited,
        );
}

class CatModel extends PetsModel {
  CatModel({
    String? id,
    String? name,
    String? distance,
    String? breed,
    String? image,
    String? image2,
    String? image3,
    String? image4,
    String? age,
    String? gender,
    String? size,
    required bool isFavorited,
  }) : super(
          id: id!,
          image: image!,
          image2: image2!,
          image3: image3!,
          image4: image4!,
          name: name!,
          breed: breed,
          age: age,
          gender: gender,
          size: size,
          distance: distance,
          isFavorited: isFavorited,
        );
}

class RabbitModel extends PetsModel {
  RabbitModel({
    String? id,
    String? name,
    String? distance,
    String? breed,
    String? image,
    String? image2,
    String? image3,
    String? image4,
    String? age,
    String? gender,
    String? size,
    required bool isFavorited,
  }) : super(
          id: id!,
          image: image!,
          image2: image2!,
          image3: image3!,
          image4: image4!,
          name: name!,
          breed: breed,
          age: age,
          gender: gender,
          size: size,
          distance: distance,
          isFavorited: isFavorited,
        );
}

class BirdModel extends PetsModel {
  BirdModel({
    String? id,
    String? name,
    String? distance,
    String? breed,
    String? image,
    String? image2,
    String? image3,
    String? image4,
    String? age,
    String? gender,
    String? size,
    required bool isFavorited,
  }) : super(
          id: id!,
          image: image!,
          image2: image2!,
          image3: image3!,
          image4: image4!,
          name: name!,
          breed: breed,
          age: age,
          gender: gender,
          size: size,
          distance: distance,
          isFavorited: isFavorited,
        );
}

class HorseModel extends PetsModel {
  HorseModel({
    String? id,
    String? name,
    String? distance,
    String? breed,
    String? image,
    String? image2,
    String? image3,
    String? image4,
    String? age,
    String? gender,
    String? size,
    required bool isFavorited,
  }) : super(
          id: id!,
          image: image!,
          image2: image2!,
          image3: image3!,
          image4: image4!,
          name: name!,
          breed: breed,
          age: age,
          gender: gender,
          size: size,
          distance: distance,
          isFavorited: isFavorited,
        );
}

class ReptilesModel extends PetsModel {
  ReptilesModel({
    String? id,
    String? name,
    String? distance,
    String? breed,
    String? image,
    String? image2,
    String? image3,
    String? image4,
    String? age,
    String? gender,
    String? size,
    required bool isFavorited,
  }) : super(
          id: id!,
          image: image!,
          image2: image2!,
          image3: image3!,
          image4: image4!,
          name: name!,
          breed: breed,
          age: age,
          gender: gender,
          size: size,
          distance: distance,
          isFavorited: isFavorited,
        );
}

class FishModel extends PetsModel {
  FishModel({
    String? id,
    String? name,
    String? distance,
    String? breed,
    String? image,
    String? image2,
    String? image3,
    String? image4,
    String? age,
    String? gender,
    String? size,
    required bool isFavorited,
  }) : super(
          id: id!,
          image: image!,
          image2: image2!,
          image3: image3!,
          image4: image4!,
          name: name!,
          breed: breed,
          age: age,
          gender: gender,
          size: size,
          distance: distance,
          isFavorited: isFavorited,
        );
}

class PrimatesModel extends PetsModel {
  PrimatesModel({
    String? id,
    String? name,
    String? distance,
    String? breed,
    String? image,
    String? image2,
    String? image3,
    String? image4,
    String? age,
    String? gender,
    String? size,
    required bool isFavorited,
  }) : super(
          id: id!,
          image: image!,
          image2: image2!,
          image3: image3!,
          image4: image4!,
          name: name!,
          breed: breed,
          age: age,
          gender: gender,
          size: size,
          distance: distance,
          isFavorited: isFavorited,
        );
}
