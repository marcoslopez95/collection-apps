import 'package:get/get.dart';

import '../../../utils/image.dart';
import '../model/review_model.dart';

class ReviewsController extends GetxController {
  var reviews = <Review>[].obs;
  var ratings = ['All', '1', '2', '3', '4', '5'].obs;
  var selectedRating = 'All'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchReviews();
  }

  void fetchReviews() {
    var reviewResult = [
      Review(
        name: "Darlene Robertson",
        rating: 5,
        review: "The plant is very good, my son likes it very much and watching it every day 💯💯💯",
        likes: 729,
        daysAgo: 6,
        image: userPerson1,
      ),
      Review(
        name: "Jane Cooper",
        rating: 4,
        review: "The seller is very fast in sending packet, I just bought it and the plant arrived in just 1 day! 👍👍",
        likes: 625,
        daysAgo: 6,
        image: userPerson2,
      ),
      Review(
        name: "Jenny Wilson",
        rating: 4,
        review: "I just bought it and the plant is really good! I highly recommend it! 😍😋",
        likes: 578,
        daysAgo: 6,
        image: userPerson3,
      ),
      Review(
        name: "Marvin McKinney",
        rating: 5,
        review: "The plant is very good, my son likes it very much and watching it every day 💯💯💯",
        likes: 347,
        daysAgo: 6,
        image: userPerson4,
      ),
      Review(
        name: "Theresa Webb",
        rating: 4,
        review: "The seller is very fast in sending packet, I just bought it and the plant arrived in just 1 day! 👍👍",
        likes: 500,
        daysAgo: 6,
        image: userPerson5,
      ),
    ];
    reviews.assignAll(reviewResult);
  }

  void setSelectedRating(String rating) {
    selectedRating.value = rating;
  }
}
