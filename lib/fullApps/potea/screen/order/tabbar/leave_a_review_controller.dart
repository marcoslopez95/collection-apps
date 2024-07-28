import 'package:get/get.dart';

class LeaveAReviewController extends GetxController {
  var rating = 4.obs;
  var reviewText = ''.obs;

  void updateRating(int newRating) {
    rating.value = newRating;
  }

  void updateReviewText(String text) {
    reviewText.value = text;
  }
}
