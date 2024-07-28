import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/potea/components/app_scaffold.dart';

import '../../../../../main.dart';
import '../../../utils/colors.dart';
import '../../cart/model/payment_model.dart';
import '../../cart/payment/payment_conmtroller.dart';
import '../../profile/payment/add_new_card_screen.dart';
import '../pin/pin_top_up.dart';

class TopUpSelect extends StatelessWidget {
  TopUpSelect({super.key});

  final PaymentController paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('Top Up E-Wallet', style: TextStyle(fontSize: 18)),
      body: Column(
        children: [
          Align(alignment: Alignment.topLeft, child: Text('Select the top up method you want to use')).paddingSymmetric(horizontal: 16),
          Obx(
            () => ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: paymentController.payment.length,
              itemBuilder: (context, index) {
                final payment = paymentController.payment[index];
                return Obx(
                  () => Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: appStore.isDarkModeOn ? containerCardColor : Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        payment.paymentType == 'Apple Pay'
                            ? ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                  appStore.isDarkModeOn ? Colors.white : Colors.black,
                                  BlendMode.srcIn,
                                ),
                                child: Image.network(payment.profileImage, height: 35),
                              )
                            : Image.network(payment.profileImage, height: 35),
                        SizedBox(width: 10),
                        Text(payment.paymentType, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        Spacer(),
                        Radio<PaymentModel>(
                          activeColor: poteaPrimaryColor,
                          value: payment,
                          groupValue: paymentController.selectedpayment.value,
                          onChanged: (PaymentModel? value) {
                            paymentController.setSelectedpayment(value);
                          },
                        ),
                      ],
                    ),
                  ).paddingSymmetric(horizontal: 16, vertical: 8),
                );
              },
            ),
          ),
          AppButton(
            width: Get.width,
            height: Get.height * 0.01,
            color: appStore.isDarkModeOn ? slateGrey : lightaddressColor,
            shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onTap: () {
              Get.to(() => AddNewCard());
            },
            child: Text('Add New Card', style: TextStyle(fontSize: 16, color: appStore.isDarkModeOn ? Colors.white : poteaPrimaryColor)),
          ).paddingAll(16),
        ],
      ),
      bottomNavBar: Container(
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
            Get.to(() => TopUpPin());
          },
          child: Text('Continue', style: TextStyle(fontSize: 16, color: Colors.white)),
        ).paddingSymmetric(horizontal: 16, vertical: 16),
      ),
    );
  }
}
