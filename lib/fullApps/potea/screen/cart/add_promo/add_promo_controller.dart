import 'package:get/get.dart';

import '../model/add_promo_model.dart';

class AddPromoController extends GetxController {
  var addPromo = <AddPromoModel>[
    AddPromoModel(heading: 'Special 25% Off', subtitle: 'Special promo only today!'),
    AddPromoModel(heading: 'Discount 30% Off', subtitle: 'New user special promo'),
    AddPromoModel(heading: 'Special 20% Off', subtitle: 'Special promo only today!'),
    AddPromoModel(heading: 'Discount 40% Off', subtitle: 'Special promo only valid today'),
    AddPromoModel(heading: 'Discount 35% Off', subtitle: 'Special promo only today!'),
  ].obs;

  var selectedaddpromo = Rx<AddPromoModel?>(null);

  void setSelectedaddpromo(AddPromoModel? addPromos) {
    selectedaddpromo.value = addPromos;
  }
}
