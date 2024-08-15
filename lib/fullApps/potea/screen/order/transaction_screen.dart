import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/components/app_scaffold.dart';

import '../../../../main.dart';
import '../../components/searchbar_widget.dart';
import '../../utils/colors.dart';
import '../../utils/image.dart';
import 'e_receipt_screen.dart';
import 'order_main_controller.dart';

class TransactionScreen extends StatelessWidget {
  TransactionScreen({super.key});

  final OrderMainController orderMainController = Get.put(OrderMainController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('Transaction History', style: TextStyle(fontSize: 18)),
      actions: [
        InkWell(
          onTap: () {
            Get.to(() => SearchBarWidget());
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.network(
              icSearch,
              height: Get.height * 0.24,
              color: appStore.isDarkModeOn ? white : black,
            ),
          ),
        ),
      ],
      body: Obx(
        () => ListView.builder(
          itemCount: orderMainController.orderList.length,
          itemBuilder: (context, index) {
            final order = orderMainController.orderList[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image.network(
                    order.image,
                    fit: BoxFit.cover,
                    width: Get.width * 0.45,
                    height: Get.height * 0.45,
                  ),
                ),
              ),
              title: Row(
                children: [
                  Text(order.itemName, style: TextStyle(fontSize: 14)),
                  Spacer(),
                  Text('\$' + order.total, style: TextStyle(color: poteaPrimaryColor, fontSize: 14)),
                ],
              ),
              subtitle: Row(
                children: [
                  Text(order.date, style: TextStyle(fontSize: 12)),
                  Spacer(),
                  Text(order.category, style: TextStyle(fontSize: 14)),
                ],
              ),
              onTap: () {
                orderMainController.selectOrder(order);
                Get.to(() => EReceiptScreen());
              },
            );
          },
        ),
      ),
    );
  }
}
