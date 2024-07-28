import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../screens/favorites/favorite_controller.dart';
import '../screens/pets/model/pets_model.dart';

class LikeController extends GetxController {
  final PetsModel pet;
  final FavoritePetsController _favController = Get.put(FavoritePetsController());
  RxBool isFavorited = false.obs;

  LikeController(this.pet) {
    // Initialize the like state based on whether the pet is in favorites
    isFavorited.value = _favController.isFavorite(pet);
  }

  void toggleLike() {
    if (isFavorited.value) {
      _favController.removeFromFavorites(pet);
      _showToastMessage("${pet.name} removed from favorites");
    } else {
      _favController.addToFavorites(pet);
      _showToastMessage("${pet.name} added to favorites");
    }
    isFavorited.value = !isFavorited.value;
  }

  void _showToastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: blackColor,
      textColor: whiteColor,
      fontSize: 16.0,
    );
  }
}
