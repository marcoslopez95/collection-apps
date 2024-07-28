import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/potea/components/app_scaffold.dart';

import '../../../../../main.dart';
import '../../../utils/colors.dart';
import '../../../utils/image.dart';
import '../../profile/address/add_new_address_screen.dart';
import '../checkout/checkout_screen.dart';
import '../model/address_model.dart';
import 'address_controller.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({super.key});

  final AddressController addressController = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('Shipping Address', style: TextStyle(fontSize: 18)),
      body: Stack(
        children: [
          Column(
            children: [
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: addressController.addresss.length,
                  itemBuilder: (context, index) {
                    final address = addressController.addresss[index];
                    return Obx(
                      () => Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: context.cardColor),
                        child: ListTile(
                          leading: Image.network(icLocationMain, height: 40),
                          title: Text(address.place, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          subtitle: Text(address.address, style: TextStyle(fontSize: 12)),
                          trailing: Radio<AddressModel>(
                            value: address,
                            activeColor: poteaPrimaryColor,
                            groupValue: addressController.selectedAddress.value,
                            onChanged: (AddressModel? value) {
                              addressController.setSelectedAddress(value);
                            },
                          ),
                          onTap: () {
                            addressController.setSelectedAddress(address);
                          },
                        ),
                      ).paddingSymmetric(horizontal: 16, vertical: 8),
                    );
                  },
                ),
              ),
              AppButton(
                elevation: 0,
                width: Get.width,
                height: Get.height * 0.01,
                color: appStore.isDarkModeOn ? slateGrey : lightaddressColor,
                shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                onTap: () {
                  Get.to(() => AddNewAddressScreen());
                },
                child: Text('Add New Address', style: TextStyle(fontSize: 16, color: appStore.isDarkModeOn ? white : poteaPrimaryColor)),
              ).paddingAll(16),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                color: appStore.isDarkModeOn ? scaffoldSecondaryDark : scaffoldLightColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
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
