import 'package:get/get.dart';

import '../../../utils/image.dart';
import '../model/choose_shipping_model.dart';

class ShippingController extends GetxController {
  var chooseshipping = <ChooseShippingModel>[
    ChooseShippingModel(profileImage: icEconomy, shippingType: 'Economy', date: 'Estimated Arrival, Dec 20-23', price: '\$10'),
    ChooseShippingModel(profileImage: icRegular, shippingType: 'Regular', date: 'Estimated Arrival, Dec 20-22', price: '\$15'),
    ChooseShippingModel(profileImage: icCargo, shippingType: 'Cargo', date: 'Estimated Arrival, Dec 19-20', price: '\$20'),
    ChooseShippingModel(profileImage: icExpress, shippingType: 'Express', date: 'Estimated Arrival, Dec 18-19', price: '\$30'),
  ].obs;

  var selectedShipping = Rx<ChooseShippingModel?>(null);

  void setSelectedShipping(ChooseShippingModel? shipping) {
    selectedShipping.value = shipping;
  }
}
