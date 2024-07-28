import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/potea/screen/order/model/order_model.dart';
import 'package:prokit_flutter/fullApps/potea/screen/order/tabbar/leave_a_review.dart';
import 'package:prokit_flutter/fullApps/potea/screen/order/tabbar/track_order.dart';

import '../../../../main.dart';
import '../../utils/colors.dart';

class OrderTabWidget extends StatelessWidget {
  final OrderModel order;
  final bool isActive;

  const OrderTabWidget({required this.order, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.181,
      width: Get.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: context.cardColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 90,
            width: 85,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(order.image, fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(order.itemName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              4.height,
              Text('Qty = ${order.quantity}', style: TextStyle(fontSize: 14)),
              4.height,
              Container(
                height: Get.height * 0.03,
                width: Get.width * 0.2,
                decoration: BoxDecoration(
                  color: appStore.isDarkModeOn ? darkFocusedColor : lightFocusedColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(isActive ? 'In Delivery' : 'Completed', style: TextStyle(fontSize: 12, color: poteaPrimaryColor)),
                ),
              ),
              4.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${order.total}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: poteaPrimaryColor)),
                  GestureDetector(
                    onTap: () {
                      if (isActive) {
                        Get.to(() => TrackOrder(order: order));
                      } else {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                          ),
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return LeaveAReview(order: order);
                          },
                        );
                      }
                    },
                    child: IntrinsicWidth(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        height: 29,
                        decoration: BoxDecoration(
                          color: poteaPrimaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(isActive ? 'Track Order' : 'Leave a Review', style: TextStyle(fontSize: 12, color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ).expand(),
        ],
      ).paddingSymmetric(horizontal: 16, vertical: 16),
    );
  }
}
