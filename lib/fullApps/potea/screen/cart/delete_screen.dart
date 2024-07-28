import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/potea/screen/cart/model/model.dart';

import '../../../../main.dart';
import '../../utils/colors.dart';
import '../../utils/common_base.dart';
import '../home/quantity_widget.dart';

class DeleteBottom extends StatelessWidget {
  final CartModel item;

  const DeleteBottom({required this.item});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: Get.height * 0.48,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: context.cardColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              indent: 3,
              height: 1,
              thickness: 3,
              color: borderColor.withOpacity(0.5),
            ).paddingSymmetric(horizontal: 140),
            SizedBox(height: Get.height * 0.018),
            Center(
              child: Text(
                'Remove From Cart?',
                style: TextStyle(color: appStore.isDarkModeOn ? white : black, fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: Get.height * 0.018),
            commonDivider,
            SizedBox(height: Get.height * 0.018),
            Container(
              height: 130,
              width: Get.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: context.scaffoldBackgroundColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    color: appStore.isDarkModeOn ? lightCardConatinerColor : darkCardContainerColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.network(item.profileImage)),
                  ),
                  SizedBox(width: Get.width * 0.018),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.plantName,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: Get.height * 0.010),
                      Text(item.price, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: poteaPrimaryColor)),
                      SizedBox(height: Get.height * 0.010),
                      QuantitySelector(
                        color: appStore.isDarkModeOn ? darkCardContainerColor : lightCardConatinerColor,
                        height: 35,
                      ),
                    ],
                  ),
                ],
              ).paddingSymmetric(horizontal: 16, vertical: 16),
            ),
            SizedBox(height: Get.height * 0.018),
            commonDivider,
            SizedBox(height: Get.height * 0.018),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    height: Get.height * 0.02,
                    color: appStore.isDarkModeOn ? slateGrey : lightaddressColor,
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    onTap: () {
                      Get.back();
                    },
                    child: Text('Cancel', style: TextStyle(fontSize: 16, color: appStore.isDarkModeOn ? white : poteaPrimaryColor)),
                  ),
                ),
                SizedBox(width: Get.width * 0.02),
                Expanded(
                  child: AppButton(
                    height: Get.height * 0.02,
                    color: poteaPrimaryColor,
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    onTap: () {},
                    child: Text('Yes, Remove', style: TextStyle(fontSize: 16, color: white)),
                  ),
                ),
              ],
            ),
            16.height,
          ],
        ),
      ),
    );
  }
}
