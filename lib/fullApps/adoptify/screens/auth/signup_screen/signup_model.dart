import 'package:get/get.dart';

class Detail1Model {
  final String text;

  Detail1Model({required this.text});
}

class Detail3Model {
  final String breed;
  final RxBool selected = false.obs;

  Detail3Model({
    required this.breed,
  });
}

class GenderModel {
  final String gender;

  GenderModel({required this.gender});
}

