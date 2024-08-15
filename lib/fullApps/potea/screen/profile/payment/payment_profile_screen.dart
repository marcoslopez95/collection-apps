import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/components/app_scaffold.dart';
import 'package:access_maketicket/fullApps/potea/screen/profile/payment/payment_profile_controller.dart';

import '../../../../../main.dart';
import '../../../utils/colors.dart';
import '../../../utils/image.dart';
import 'add_new_card_screen.dart';

class PaymentProfileScreen extends StatelessWidget {
  PaymentProfileScreen({super.key});

  final PaymentProfileController paymentProfileController = Get.put(PaymentProfileController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('Payment', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      actions: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Image.network(
            icMore,
            color: appStore.isDarkModeOn ? white : black,
            width: 20,
          ),
        ),
      ],
      body: Stack(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: paymentProfileController.payment.length,
            itemBuilder: (context, index) {
              final payment = paymentProfileController.payment[index];
              return GestureDetector(
                onTap: () {
                  paymentProfileController.setSelectedpayment(payment);
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: appStore.isDarkModeOn ? Colors.grey[900] : Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Image.network(payment.profileImage, height: 35),
                      SizedBox(width: 10),
                      Text(payment.paymentType, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      Spacer(),
                      Text('Connected', style: TextStyle(color: poteaPrimaryColor)),
                    ],
                  ),
                ).paddingSymmetric(horizontal: 16, vertical: 8),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AppButton(
              elevation: 0,
              width: Get.width,
              color: poteaPrimaryColor,
              shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              onTap: () {
                Get.to(() => AddNewCard());
              },
              child: Text('Add New Cad', style: TextStyle(fontSize: 16, color: white)),
            ).paddingSymmetric(horizontal: 16, vertical: 25),
          ),
        ],
      ),
    );
  }
}
