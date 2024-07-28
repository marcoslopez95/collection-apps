import 'package:get/get.dart';

import '../special_offer_component/special_offer_model.dart';

class WishlistController extends GetxController {
  var wishlist = List<OfferModel>.empty(growable: true).obs;

  void addToWishlist(OfferModel offer) {
    if (!wishlist.contains(offer)) {
      wishlist.add(offer);
    } else {
      wishlist.remove(offer);
    }
  }

  bool isInWishlist(OfferModel offer) {
    return wishlist.contains(offer);
  }
}
