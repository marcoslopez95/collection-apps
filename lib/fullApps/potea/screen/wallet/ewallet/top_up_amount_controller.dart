import 'package:get/get.dart';

class TopUpAmountController extends GetxController {
  var selectedAmount = 0.obs;

  void selectAmount(int amount) {
    selectedAmount.value = amount;
  }
}
