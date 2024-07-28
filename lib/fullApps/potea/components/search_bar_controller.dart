import 'package:get/get.dart';

class SearchBarController extends GetxController {
  var searchText = ''.obs;
  var plantTypeList = ['Rose', 'Tulip', 'Lily', 'Orchid'].obs;

  void clearAll() {
    searchText.value = '';
    plantTypeList.clear();
  }
}
