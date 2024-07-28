import 'package:get/get.dart';

class GenderModel {
  final String? gender;
  final RxBool selected = false.obs;

  GenderModel({required this.gender});
}

class SizeModel {
  final String? size;
  final RxBool selected = false.obs;

  SizeModel({required this.size});
}

class AgeModel {
  final String? age;
  final RxBool selected = false.obs;

  AgeModel({required this.age});
}
