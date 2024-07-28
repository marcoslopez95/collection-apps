import 'package:get/get.dart';

import '../model/address_model.dart';

class AddressController extends GetxController {
  var addresss = <AddressModel>[
    AddressModel(place: 'Home', address: '61480 Sunbrook Park, PC 5679'),
    AddressModel(place: 'Office', address: '6993 Meadow Valley Terra. PC 3637'),
    AddressModel(place: 'Apartment', address: '21833 Clyde Gallagher, PC 4662'),
    AddressModel(place: "Parent's House", address: '5259 Blue Bill Park, PC 4627'),
  ].obs;

  var selectedAddress = Rx<AddressModel?>(null);

  @override
  void onInit() {
    super.onInit();
    AddressModel? homeAddress = addresss.firstWhere((address) => address.place == 'Home');
    if (homeAddress != null) {
      selectedAddress.value = homeAddress;
    } else {
      selectedAddress.value = addresss.isNotEmpty ? addresss[0] : null;
    }
  }

  void setSelectedAddress(AddressModel? address) {
    selectedAddress.value = address;
  }

  void addNewAdd(AddressModel add) {
    addresss.add(add);
  }
}
