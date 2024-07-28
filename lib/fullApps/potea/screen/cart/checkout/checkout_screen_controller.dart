import 'package:get/get.dart';

class PromoController extends GetxController {
  var showPromoSuggestion = false.obs;

  void togglePromoSuggestion() {
    showPromoSuggestion.value = !showPromoSuggestion.value;
  }

  void hidePromoSuggestion() {
    showPromoSuggestion.value = false;
  }
}
