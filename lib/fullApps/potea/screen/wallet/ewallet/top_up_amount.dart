import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/potea/components/app_scaffold.dart';
import 'package:prokit_flutter/fullApps/potea/screen/wallet/ewallet/top_up_amount_controller.dart';
import 'package:prokit_flutter/fullApps/potea/screen/wallet/ewallet/top_up_select.dart';

import '../../../components/amount_button_row.dart';
import '../../../utils/colors.dart';

class TopUpAmount extends StatelessWidget {
  final TopUpAmountController controller = Get.put(TopUpAmountController());

  TopUpAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('Top Up E-Wallet', style: TextStyle(fontSize: 18)),
      body: Column(
        children: [
          Text('Enter the amount of top up'),
          16.height,
          Obx(() => SizedBox(
                height: 50,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: context.scaffoldBackgroundColor,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: poteaPrimaryColor)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: poteaPrimaryColor)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: poteaPrimaryColor)),
                    hintText: '\$${controller.selectedAmount.value}',
                    hintStyle: TextStyle(color: poteaPrimaryColor),
                  ),
                  style: TextStyle(color: poteaPrimaryColor),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      controller.selectAmount(int.parse(value));
                    }
                  },
                ),
              )),
          16.height,
          AmountButtonRow(amounts: [10, 20, 50], controller: controller),
          16.height,
          AmountButtonRow(amounts: [100, 200, 250], controller: controller),
          16.height,
          AmountButtonRow(amounts: [500, 750, 1000], controller: controller),
          36.height,
          AppButton(
            width: Get.width,
            height: Get.height * 0.06,
            color: poteaPrimaryColor,
            shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onTap: () {
              Get.to(() => TopUpSelect());
            },
            child: Text('Continue', style: TextStyle(fontSize: 16, color: white)),
          ).paddingSymmetric(horizontal: 16),
        ],
      ).paddingSymmetric(horizontal: 16),
    );
  }
}
