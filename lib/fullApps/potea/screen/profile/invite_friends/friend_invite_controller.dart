import 'package:get/get.dart';

import '../../../utils/image.dart';
import 'friend_model.dart';

class FriendsController extends GetxController {
  final friends = <Friend>[].obs;

  @override
  void onInit() {
    super.onInit();
    friends.addAll([
      Friend('Tynisha Obey', '+1-300-555-0135', userPerson1, false),
      Friend('Florencio Dorrance', '+1-202-555-0136', userPerson2, false),
      Friend('Chantal Shelburne', '+1-300-555-0119', userPerson3, false),
      Friend('Maryland Winkles', '+1-300-555-0161', userPerson4, false),
      Friend('Rodolfo Goode', '+1-202-555-0136', userPerson5, false),
      Friend('Benny Spanbauer', '+1-202-555-0167', userPerson6, false),
      Friend('Tyra Dhillon', '+1-202-555-0119', userPerson7, false),
      Friend('Jamel Eusebio', '+1-202-555-0171', userPerson8, false),
      Friend('Pedro Huard', '+1-202-555-0171', userPerson9, false),
      Friend('Clinton Mcclure', '+1-202-555-0136', userPerson10, false),
    ]);
  }

  void toggleInvite(int index) {
    friends[index].isInvited.value = !friends[index].isInvited.value;
  }
}
