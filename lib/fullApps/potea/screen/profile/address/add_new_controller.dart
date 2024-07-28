import 'package:get/get.dart';

class AddNewAddressController extends GetxController {
  var isDefaultAddress = false.obs;
  final RxBool checkboxValue = false.obs;

  void toggleDefaultAddress() {
    isDefaultAddress.value = !isDefaultAddress.value;
  }
}
