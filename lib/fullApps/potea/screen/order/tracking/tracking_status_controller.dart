import 'package:get/get.dart';

import '../model/status_modal.dart';

class StatusTrackingController extends GetxController {
  final orderList = <TextDto>[
    TextDto("Your order has been placed", "Fri, 25th Mar '22 - 10:47pm"),
    TextDto("Seller has processed your order", "Sun, 27th Mar '22 - 10:19am"),
    TextDto("Your item has been picked up by courier partner.", "Tue, 29th Mar '22 - 5:00pm"),
  ].obs;

  final shippedList = <TextDto>[
    TextDto("Your order has been shipped", "Tue, 29th Mar '22 - 5:04pm"),
    TextDto("Your item has been received in the nearest hub to you.", null),
  ].obs;

  final outOfDeliveryList = <TextDto>[
    TextDto("Your order is out for delivery", "Thu, 31st Mar '22 - 2:27pm"),
  ].obs;

  final deliveredList = <TextDto>[
    TextDto("Your order has been delivered", "Thu, 31st Mar '22 - 3:58pm"),
  ].obs;
}
