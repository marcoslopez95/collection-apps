import 'package:get/get.dart';

import '../../../../main.dart';

class ProfileController extends GetxController {
  void toggleDarkMode(bool newValue) {
    appStore.toggleDarkMode(value: newValue);
  }
}
