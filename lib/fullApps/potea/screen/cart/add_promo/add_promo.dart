import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/potea/components/app_scaffold.dart';

import '../../../../../main.dart';
import '../../../components/searchbar_widget.dart';
import '../../../utils/colors.dart';
import '../../../utils/image.dart';
import '../model/add_promo_model.dart';
import '../payment/payment_screen.dart';
import 'add_promo_controller.dart';

class AddPromoScreen extends StatelessWidget {
  AddPromoScreen({super.key});

  final AddPromoController addPromoController = Get.put(AddPromoController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('Add Promo', style: TextStyle(fontSize: 18)),
      actions: [
        InkWell(
          onTap: () {
            Get.to(() => SearchBarWidget());
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.network(icSearch, height: 24, color: appStore.isDarkModeOn ? white : black),
          ),
        ),
      ],
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: addPromoController.addPromo.length,
                itemBuilder: (context, index) {
                  final addpromo = addPromoController.addPromo[index];
                  return Obx(
                    () => Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: appStore.isDarkModeOn ? containerCardColor : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Image.network(icPromo, height: 35),
                          SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                addpromo.heading,
                                style: TextStyle(fontSize: 16, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                              ),
                              LimitedBox(
                                maxWidth: Get.width * 0.6,
                                child: Text(addpromo.subtitle, style: TextStyle(fontSize: 12), overflow: TextOverflow.ellipsis, maxLines: 1),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          Spacer(),
                          Radio<AddPromoModel>(
                            activeColor: poteaPrimaryColor,
                            value: addpromo,
                            groupValue: addPromoController.selectedaddpromo.value,
                            onChanged: (AddPromoModel? value) {
                              addPromoController.setSelectedaddpromo(value);
                            },
                          ),
                        ],
                      ),
                    ).paddingSymmetric(horizontal: 16, vertical: 8),
                  );
                },
              ),
            ),
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
                elevation: 0,
                width: Get.width,
                color: poteaPrimaryColor,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                onTap: () {
                  Get.to(() => PaymentScreen());
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
