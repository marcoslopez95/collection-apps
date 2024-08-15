import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/components/app_scaffold.dart';
import 'package:access_maketicket/fullApps/potea/screen/cart/payment/payment_conmtroller.dart';

import '../../../../../main.dart';
import '../../../utils/colors.dart';
import '../../../utils/image.dart';
import '../enter_pin/enter_pin.dart';
import '../model/payment_model.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  final PaymentController paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('Payment Methods', style: TextStyle(fontSize: 18)),
      actions: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Image.network(
            icAdd,
            color: appStore.isDarkModeOn ? Colors.white : Colors.black,
            width: 20,
          ),
        ),
      ],
      body: Stack(
        children: [
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
                      // Background color
                      borderRadius: BorderRadius.circular(15), // Rounded corners
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
                shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                onTap: () {
                  Get.to(() => EnterPin());
                },
                child: Text('Confirm Payment', style: TextStyle(fontSize: 16, color: Colors.white)),
              ).paddingSymmetric(horizontal: 16, vertical: 16),
            ),
          ),
        ],
      ),
    );
  }
}
