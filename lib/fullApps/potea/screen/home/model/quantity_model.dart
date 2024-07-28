import 'package:get/get.dart';

class QuantityModel {
  String title;
  RxInt quantity;

  QuantityModel(this.title, this.quantity);

  void increment() {
    quantity++;
  }
  void decrement() {
    if (quantity > 0) {
      quantity--;
    }
  }
}