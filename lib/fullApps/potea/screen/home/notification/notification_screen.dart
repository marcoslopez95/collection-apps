import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/components/app_scaffold.dart';
import 'package:access_maketicket/fullApps/potea/screen/home/model/Notification_model.dart';

import '../../../../../main.dart';
import '../../../utils/image.dart';
import 'notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('Notifications', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      actions: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Image.network(
            icMore,
            color: appStore.isDarkModeOn ? white : black,
            width: 26,
          ),
        ),
      ],
      body: Obx(
        () {
          final Map<String, List<Order>> groupedOrders = {};
          for (var order in orderController.orders) {
            String day = order.day ?? 'Unknown';
            if (!groupedOrders.containsKey(day)) {
              groupedOrders[day] = [];
            }
            groupedOrders[day]!.add(order);
          }
          return ListView.builder(
            itemCount: groupedOrders.keys.length,
            itemBuilder: (context, index) {
              String day = groupedOrders.keys.elementAt(index);
              List<Order> ordersForDay = groupedOrders[day]!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(day, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)).paddingSymmetric(vertical: 16, horizontal: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: ordersForDay.length,
                    itemBuilder: (context, orderIndex) {
                      Order order = ordersForDay[orderIndex];
                      return ListTile(
                        leading: Image.network(order.profileImage),
                        title: Text(order.text),
                        subtitle: Text(order.subText),
                      );
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
