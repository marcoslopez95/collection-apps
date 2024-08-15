import 'package:get/get.dart';
import 'package:access_maketicket/fullApps/potea/screen/order/model/order_model.dart';

import '../../utils/image.dart';

class OrderMainController extends GetxController {
  var orderList = <OrderModel>[].obs;
  var showAll = false.obs;

  var selectedOrder = OrderModel(
    itemName: 'Prayer Plant',
    quantity: '1',
    amount: '29',
    promo: '8',
    total: '21',
    date: 'Dec 15, 2024 | 10:00:27 AM',
    transactionId: 'SK7263727399',
    status: 'Paid',
    category: 'Orders',
    image: imagePlantEight,
    id: '',
  ).obs;

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  void fetchOrders() {
    orderList.assignAll([
      OrderModel(
        itemName: 'Prayer Plant',
        quantity: '1',
        amount: '29',
        promo: '8',
        total: '21',
        date: 'Dec 15, 2024 | 10:00:27 AM',
        transactionId: 'SK7263727399',
        status: 'Paid',
        category: 'Orders',
        image: imagePlantEight,
        id: '',
      ),
      OrderModel(
        itemName: 'Rubber Fig Plant',
        quantity: '3',
        amount: '99',
        promo: '8',
        total: '23',
        date: 'Dec 16, 2024 | 10:00:27 AM',
        transactionId: 'SK7263727399',
        status: 'Paid',
        category: 'Top Up',
        image: imagePlantNine,
        id: '',
      ),
      OrderModel(
        itemName: 'ZZ Plant',
        quantity: '1',
        amount: '29',
        promo: '8',
        total: '21',
        date: 'Dec 15, 2024 | 10:00:27 AM',
        transactionId: 'SK7263727399',
        status: 'Paid',
        category: 'Orders',
        image: imagePlantTen,
        id: '',
      ),
      OrderModel(
        itemName: 'Prayer Plant',
        quantity: '1',
        amount: '29',
        promo: '8',
        total: '21',
        date: 'Dec 15, 2024 | 10:00:27 AM',
        transactionId: 'SK7263727399',
        status: 'Paid',
        category: 'Orders',
        image: imagePlantEight,
        id: '',
      ),
      OrderModel(
        itemName: 'Prayer Plant',
        quantity: '1',
        amount: '29',
        promo: '8',
        total: '21',
        date: 'Dec 15, 2024 | 10:00:27 AM',
        transactionId: 'SK7263727399',
        status: 'Paid',
        category: 'Top Up',
        image: imagePlantEight,
        id: '',
      ),
      OrderModel(
        itemName: 'Prayer Plant',
        quantity: '1',
        amount: '29',
        promo: '8',
        total: '21',
        date: 'Dec 15, 2024 | 10:00:27 AM',
        transactionId: 'SK7263727399',
        status: 'Paid',
        category: 'Orders',
        image: imagePlantEight,
        id: '',
      ),
      OrderModel(
        itemName: 'Prayer Plant',
        quantity: '1',
        amount: '29',
        promo: '8',
        total: '21',
        date: 'Dec 15, 2024 | 10:00:27 AM',
        transactionId: 'SK7263727399',
        status: 'Paid',
        category: 'Top Up',
        image: imagePlantEight,
        id: '',
      ),
      OrderModel(
        itemName: 'Prayer Plant',
        quantity: '1',
        amount: '29',
        promo: '8',
        total: '21',
        date: 'Dec 15, 2024 | 10:00:27 AM',
        transactionId: 'SK7263727399',
        status: 'Paid',
        category: 'Orders',
        image: imagePlantEight,
        id: '',
      ),
    ]);
  }

  void selectOrder(OrderModel order) {
    selectedOrder.value = order;
  }

  void toggleShowAll() {
    showAll.value = !showAll.value;
  }
}
