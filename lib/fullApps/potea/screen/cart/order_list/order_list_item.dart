import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/screen/cart/model/model.dart';

import '../../../../../main.dart';
import '../../../utils/colors.dart';

class CartOrderItemWidget extends StatelessWidget {
  final CartModel item;

  const CartOrderItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: context.cardColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            color: appStore.isDarkModeOn ? lightCardConatinerColor : darkCardContainerColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(item.profileImage),
            ),
          ),
          SizedBox(width: Get.width * 0.018),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.plantName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              Text(item.price, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: poteaPrimaryColor)),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: appStore.isDarkModeOn ? darkCardContainerColor : lightCardConatinerColor,
                ),
                child: Center(child: Text(item.total)),
              ),
            ],
          ),
        ],
      ).paddingSymmetric(horizontal: 8, vertical: 8),
    );
  }
}
