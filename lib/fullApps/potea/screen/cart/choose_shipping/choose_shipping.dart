import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/potea/components/app_scaffold.dart';

import '../../../../../main.dart';
import '../../../utils/colors.dart';
import '../checkout/checkout_screen.dart';
import '../model/choose_shipping_model.dart';
import 'choose_shipping_controller.dart';

class ChooseShippingScreen extends StatelessWidget {
  ChooseShippingScreen({super.key});

  final ShippingController shippingController = Get.find<ShippingController>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('Choose Shipping', style: TextStyle(fontSize: 18)),
      body: Stack(
        children: [
          Obx(
            () => ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: shippingController.chooseshipping.length,
              itemBuilder: (context, index) {
                final chooseship = shippingController.chooseshipping[index];
                return Obx(
                  () => Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: appStore.isDarkModeOn ? containerCardColor : Colors.white,
                      borderRadius: BorderRadius.circular(15), // Rounded corners
                    ),
                    child: Row(
                      children: [
                        Image.network(chooseship.profileImage, height: 35),
                        SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              chooseship.shippingType,
                              style: TextStyle(fontSize: 16, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                            ),
                            LimitedBox(
                              maxWidth: Get.width * 0.6,
                              child: Text(chooseship.date, style: TextStyle(fontSize: 12), overflow: TextOverflow.ellipsis, maxLines: 1),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Spacer(),
                        Text(chooseship.price, style: TextStyle(fontSize: 16, color: poteaPrimaryColor)),
                        Radio<ChooseShippingModel>(
                          activeColor: poteaPrimaryColor,
                          value: chooseship,
                          groupValue: shippingController.selectedShipping.value,
                          onChanged: (ChooseShippingModel? value) {
                            shippingController.setSelectedShipping(value);
                            shippingController.setSelectedShipping(value);
                          },
                        ),
                      ],
                    ),
                  ).paddingSymmetric(horizontal: 16, vertical: 8),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                color: appStore.isDarkModeOn ? scaffoldSecondaryDark : scaffoldLightColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                border: Border(top: BorderSide(color: commonDividerColor)),
              ),
              child: AppButton(
                width: Get.width,
                color: poteaPrimaryColor,
                shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                onTap: () {
                  Get.to(() => Checkout());
                },
                child: Text('Apply', style: TextStyle(fontSize: 16, color: white)),
              ).paddingSymmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ],
      ),
    );
  }
}
