import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/potea/screen/cart/model/model.dart';

import '../../../../main.dart';
import '../../utils/colors.dart';
import '../../utils/image.dart';
import '../home/quantity_widget.dart';
import 'delete_screen.dart';

class CartItemWidget extends StatelessWidget {
  final CartModel item;

  const CartItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.179,
      width: Get.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: context.cardColor),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  QuantitySelector(
                    color: appStore.isDarkModeOn ? darkCardContainerColor : lightCardConatinerColor,
                    height: Get.height * 0.046,
                  ),
                  SizedBox(width: Get.width * 0.15),
                  InkWell(
                    child: Image.network(
                      icDelete,
                      height: Get.height * 0.029,
                      color: appStore.isDarkModeOn ? white : black,
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return DeleteBottom(item: item);
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ).paddingSymmetric(horizontal: 16, vertical: 16),
    );
  }
}
