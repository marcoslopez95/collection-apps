import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/components/app_scaffold.dart';

import '../../../../main.dart';
import '../../components/searchbar_widget.dart';
import '../../utils/colors.dart';
import '../../utils/image.dart';
import '../dashboard/dashboard_controller.dart';
import 'cart_item.dart';
import 'cart_list.dart';
import 'checkout/checkout_screen.dart';

class Cart extends StatelessWidget {
  Cart({super.key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return homeController.onWillPop(context);
      },
      child: AppScaffold(
        hasLeadingWidget: false,
        appBarTitle: Row(
          children: [
            16.width,
            Image.network(assetsLogo, height: Get.height * 0.029),
            16.width,
            Text('My Cart', style: TextStyle(fontSize: 18)),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.to(() => SearchBarWidget());
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.network(
                icSearch,
                height: Get.height * 0.029,
                color: appStore.isDarkModeOn ? white : black,
              ),
            ),
          ),
        ],
        body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final item = cart[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CartItemWidget(item: item),
            );
          },
        ).paddingSymmetric(horizontal: 16),
        bottomNavBar: Container(
          height: 90,
          decoration: BoxDecoration(
            border: Border.all(color: context.cardColor),
            borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            color: appStore.isDarkModeOn ? scaffoldSecondaryDark : scaffoldLightColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text('Total Price', style: TextStyle(fontSize: 12)),
                  Text('\$250', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                ],
              ),
              SizedBox(width: Get.width * 0.030),
              Expanded(
                child: AppButton(
                  elevation: 0,
                  height: Get.height * 0.02,
                  color: poteaPrimaryColor,
                  shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  onTap: () {
                    Get.to(() => Checkout());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Checkout', style: TextStyle(fontSize: 16, color: white)),
                      16.width,
                      Image.network(icRight),
                    ],
                  ),
                ),
              ),
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
