import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/potea/components/app_scaffold.dart';
import 'package:prokit_flutter/fullApps/potea/screen/order/model/order_model.dart';

import '../../../../../main.dart';
import '../../../components/searchbar_widget.dart';
import '../../../utils/colors.dart';
import '../../../utils/common_base.dart';
import '../../../utils/image.dart';
import '../tracking/trackking.dart';

class TrackOrder extends StatelessWidget {
  final OrderModel order;

  const TrackOrder({required this.order});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('Track Order', style: TextStyle(fontSize: 18)),
      actions: [
        InkWell(
          onTap: () {
            Get.to(() => SearchBarWidget());
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.network(
              icSearch,
              height: 24,
              color: appStore.isDarkModeOn ? white : black,
            ),
          ),
        ),
      ],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.165,
              width: Get.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: context.cardColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    color: appStore.isDarkModeOn ? lightCardConatinerColor : darkCardContainerColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(order.image),
                    ),
                  ),
                  SizedBox(width: Get.width * 0.018),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(order.itemName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      Text('Qty = ${order.quantity}', style: TextStyle(fontSize: 14)),
                      Text('\$${order.total}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: poteaPrimaryColor)),
                    ],
                  ),
                ],
              ).paddingSymmetric(horizontal: 16, vertical: 16),
            ).paddingSymmetric(horizontal: 16),
            16.height,
            Tracking(),
            16.height,
            Align(
              alignment: Alignment.center,
              child: Text('Packet In Delivery', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ).paddingSymmetric(horizontal: 16),
            16.height,
            commonDivider.paddingSymmetric(horizontal: 16),
            16.height,
            Text('Order Status Details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)).paddingSymmetric(horizontal: 16),
            16.height,
            _buildStatusTrackingDetails(),
            32.height,
          ],
        ),
      ),
    );
  }

  Widget _buildStatusTrackingDetails() {
    final List<Map<String, String>> statusUpdates = [
      {
        'status': 'Order In Transit - Dec 17',
        'address': '32 Manchester Ave. Ringgold, GA 30736',
        'time': '15:20 PM',
      },
      {
        'status': 'Order at Customs Port - Dec 16',
        'address': '4 Evergreen Street Lake Zurich, IL 60047',
        'time': '14:40 PM',
      },
      {
        'status': 'Orders are Shipped - Dec 15',
        'address': '9177 Hillcrest Street Wheeling, WV 26003',
        'time': '11:30 AM',
      },
      {
        'status': 'Order is in Packing - Dec 15',
        'address': '891 Glen Ridge St. Gainesville, VA 20155',
        'time': '10:25 AM',
      },
      {
        'status': 'Verified Payments - Dec 15',
        'address': '55 Summerhouse Dr. Apopka, FL 32703',
        'time': '10:04 AM',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: statusUpdates.map((update) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Icon(Icons.check_circle, color: poteaPrimaryColor, size: 20),
                  if (update != statusUpdates.last)
                    Container(
                      height: 55,
                      width: 2,
                      color: Colors.grey,
                    ),
                ],
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(update['status']!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        Spacer(),
                        Text(update['time']!, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                        if (update != statusUpdates.last) SizedBox(height: 8),
                      ],
                    ),
                    Text(update['address']!, style: TextStyle(fontSize: 12, color: lightGrey)),
                  ],
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
