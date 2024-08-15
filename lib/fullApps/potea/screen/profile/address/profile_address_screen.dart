import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/components/app_scaffold.dart';

import '../../../utils/colors.dart';
import '../../../utils/image.dart';
import '../../cart/address/address_controller.dart';
import 'add_new_address_screen.dart';

class ProfileAddress extends StatelessWidget {
  ProfileAddress({super.key});

  final AddressController addressController = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('Address', style: TextStyle(fontSize: 18)),
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
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: context.cardColor,
                      ),
                      child: ListTile(
                        leading: Image.network(icLocationMain, height: 40),
                        title: Text(address.place, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                        subtitle: Text(address.address, style: TextStyle(fontSize: 12)),
                        trailing: IconButton(
                          icon: Icon(Icons.edit, color: poteaPrimaryColor),
                          onPressed: () {},
                        ),
                      ),
                    ).paddingSymmetric(horizontal: 16, vertical: 8);
                  },
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AppButton(
              elevation: 0,
              width: Get.width,
              color: poteaPrimaryColor,
              shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              onTap: () {
                Get.to(() => AddNewAddressScreen());
              },
              child: Text('Add New Address', style: TextStyle(fontSize: 16, color: white)),
            ).paddingSymmetric(horizontal: 16, vertical: 16),
          ),
        ],
      ),
    );
  }
}
