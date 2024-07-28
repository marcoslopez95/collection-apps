import 'package:get/get.dart';
import 'package:prokit_flutter/fullApps/potea/screen/home/model/Notification_model.dart';

import '../../../utils/image.dart';

class OrderController extends GetxController {
  var orders = <Order>[
    Order(profileImage: icDiscountMain, text: '30% Special Discount!', subText: 'Special promotion only valid today', day: 'Today'),
    Order(profileImage: icWalletMain, text: 'Top Up E-Wallet Successful!', subText: 'You have to top up e-wallet', day: 'Yesterday'),
    Order(profileImage: icLocationMain, text: 'New Services Available!', subText: 'Now you can track orders in real time', day: 'Yesterday'),
    Order(profileImage: icWalletMain, text: 'Credit Card Connected!', subText: 'Credit Card has been linked!', day: 'December'),
    Order(profileImage: icProfileMainBg, text: 'Account Setup Successful!', subText: 'Your account has been created!', day: 'December'),
  ].obs;

  void addOrder(Order order) {
    orders.add(order);
  }

  void removeOrder(Order order) {
    orders.remove(order);
  }
}
