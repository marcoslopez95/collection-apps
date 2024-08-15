import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/components/app_scaffold.dart';

import '../../../../../main.dart';
import '../../../utils/colors.dart';
import '../../../utils/common_base.dart';
import '../../../utils/image.dart';
import '../add_promo/add_promo.dart';
import '../address/address_controller.dart';
import '../address/address_screen.dart';
import '../cart_list.dart';
import '../choose_shipping/choose_shipping.dart';
import '../choose_shipping/choose_shipping_controller.dart';
import '../model/address_model.dart';
import '../order_list/order_list_item.dart';
import 'checkout_screen_controller.dart';

class Checkout extends StatelessWidget {
  Checkout({super.key});

  final AddressController addressController = Get.put(AddressController());
  final ShippingController shippingController = Get.put(ShippingController());
  final PromoController promoController = Get.put(PromoController());
  final TextEditingController promoTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('Checkout', style: TextStyle(fontSize: 18)),
      actions: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Image.network(icMore, color: appStore.isDarkModeOn ? Colors.white : Colors.black, width: 20),
        ),
      ],
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Obx(() {
                  AddressModel? selectedAddress = addressController.selectedAddress.value;
                  if (selectedAddress == null) {
                    return Center(
                      child: Text('No Home address available'),
                    );
                  }
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: context.cardColor,
                    ),
                    child: ListTile(
                      leading: Image.network(icLocationMain, height: 40),
                      title: Text(selectedAddress.place, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      subtitle: Text(selectedAddress.address, style: TextStyle(fontSize: 12)),
                      trailing: Icon(Icons.edit, color: poteaPrimaryColor),
                      onTap: () {
                        Get.to(() => AddressScreen());
                      },
                    ),
                  ).paddingSymmetric(horizontal: 16, vertical: 8);
                }),
                SizedBox(height: 8),
                commonDivider.paddingSymmetric(horizontal: 16),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Order List', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ).paddingSymmetric(horizontal: 16),
                SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    final item = cart[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CartOrderItemWidget(item: item),
                    );
                  },
                ).paddingSymmetric(horizontal: 16),
                SizedBox(height: 16),
                commonDivider.paddingSymmetric(horizontal: 16),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Choose Shipping', style: TextStyle(color: appStore.isDarkModeOn ? white : black, fontSize: 16)),
                ).paddingSymmetric(horizontal: 16),
                SizedBox(height: 8),
                Obx(() {
                  final shipping = shippingController.selectedShipping.value;
                  return InkWell(
                    onTap: () {
                      Get.to(() => ChooseShippingScreen());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      decoration: BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Icon(Icons.local_shipping, color: Colors.green),
                          SizedBox(width: 10),
                          Expanded(child: Text(shipping?.shippingType ?? 'Choose Shipping Type', style: TextStyle(fontSize: 16))),
                          if (shipping != null)
                            Icon(Icons.edit, color: poteaPrimaryColor)
                          else
                            Icon(
                              Icons.arrow_forward_ios,
                              color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                              size: 16,
                            ),
                        ],
                      ),
                    ).paddingSymmetric(horizontal: 16),
                  );
                }),
                SizedBox(height: 16),
                commonDivider.paddingSymmetric(horizontal: 16),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Promo Code', style: TextStyle(color: appStore.isDarkModeOn ? white : black, fontSize: 16)),
                ).paddingSymmetric(horizontal: 16),
                SizedBox(height: 8),
                Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.80,
                      child: AppTextField(
                        controller: promoTextController,
                        textStyle: TextStyle(fontSize: 12),
                        textFieldType: TextFieldType.NAME,
                        titleTextStyle: TextStyle(fontSize: 14),
                        decoration: inputDecoration(
                          context,
                          hintText: 'Enter Promo Code',
                          fillColor: context.cardColor,
                          filled: true,
                          borderRadius: 15,
                        ),
                      ).paddingSymmetric(horizontal: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        promoController.togglePromoSuggestion();
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: poteaPrimaryColor),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Obx(() {
                  if (promoController.showPromoSuggestion.value) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      height: 40,
                      width: 210,
                      decoration: BoxDecoration(
                        color: poteaPrimaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          promoTextController.text = 'Discount 30% off';
                          promoController.hidePromoSuggestion();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Discount 30% off', style: TextStyle(fontSize: 16, color: white)),
                            IconButton(
                              icon: Icon(Icons.close, color: white),
                              onPressed: () {
                                promoController.hidePromoSuggestion();
                              },
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 16),
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                }),
                SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: context.cardColor),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Amount', style: secondaryTextStyle()),
                          Text('\$250', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                      8.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Shipping', style: secondaryTextStyle()),
                          Text('\$15', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                      8.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Promo', style: secondaryTextStyle(color: poteaPrimaryColor)),
                          Text('-\$75', style: TextStyle(fontSize: 14, color: poteaPrimaryColor)),
                        ],
                      ),
                      8.height,
                      commonDivider,
                      8.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total', style: secondaryTextStyle()),
                          Text(
                            (shippingController.selectedShipping.value != null) ? '\$${250 + int.parse(shippingController.selectedShipping.value!.price.substring(1))}' : '-',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ).paddingAll(16),
                ).paddingSymmetric(horizontal: 16),
                SizedBox(height: 120),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
                color: context.cardColor,
              ),
              child: AppButton(
                elevation: 0,
                width: Get.width,
                color: poteaPrimaryColor,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                onTap: () {
                  Get.to(() => AddPromoScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Continue to Payment', style: TextStyle(fontSize: 16, color: Colors.white)),
                    SizedBox(width: 12),
                    Image.network(icRight, height: 20),
                  ],
                ),
              ).paddingAll(16),
            ),
          ),
        ],
      ),
    );
  }
}
