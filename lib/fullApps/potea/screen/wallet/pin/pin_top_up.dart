import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/potea/components/app_scaffold.dart';
import 'package:prokit_flutter/fullApps/potea/screen/order/transaction_screen.dart';
import 'package:prokit_flutter/fullApps/potea/screen/wallet/pin/top_up_pin_controller.dart';

import '../../../../../main.dart';
import '../../../utils/colors.dart';
import '../../../utils/image.dart';

class TopUpPin extends StatelessWidget {
  final TopUpPinController pinController = Get.put(TopUpPinController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < _focusNodes.length - 1; i++) {
      _focusNodes[i].addListener(() {
        if (!_focusNodes[i].hasFocus) {
          _focusNodes[i + 1].requestFocus();
        }
      });
    }
    return AppScaffold(
      appBarTitle: Text('Enter Your PIN', style: TextStyle(fontSize: 18)),
      body: Stack(
        children: [
          Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Enter your PIN to confirm top up', style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
                SizedBox(height: Get.height * 0.070),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    _focusNodes.length,
                    (index) => Obx(() => _buildPinField(context, pinController.hidePin.value, _focusNodes[index])),
                  ),
                ),
                SizedBox(height: Get.height * 0.070),
              ],
            ).paddingSymmetric(horizontal: 16),
          ),
          Positioned(
            bottom: 26,
            left: 16,
            right: 16,
            child: AppButton(
              width: Get.width,
              height: Get.height * 0.02,
              color: poteaPrimaryColor,
              shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              onTap: () async {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return Observer(
                      builder: (context) {
                        return AlertDialog(
                          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.network(imageCong),
                              Text('Top Up Sccessful!', style: TextStyle(fontSize: 20, color: appStore.isDarkModeOn ? white : black, fontWeight: FontWeight.bold)),
                              SizedBox(height: Get.height * 0.02),
                              Text('You have successfully top up e-wallet for \$100', textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
                              SizedBox(height: Get.height * 0.02),
                              AppButton(
                                width: Get.width,
                                height: Get.height * 0.02,
                                onTap: () {
                                  Get.to(() => TransactionScreen());
                                },
                                color: poteaPrimaryColor,
                                shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                child: Text('View E-Receipt', style: TextStyle(fontSize: 16, color: white)),
                              ).paddingSymmetric(horizontal: 16),
                              SizedBox(height: Get.height * 0.02),
                              AppButton(
                                width: Get.width,
                                height: Get.height * 0.02,
                                onTap: () {
                                  Get.back();
                                },
                                color: poteaPrimaryColor,
                                shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                child: Text('Cancel', style: TextStyle(fontSize: 16, color: white)),
                              ).paddingSymmetric(horizontal: 16),
                            ],
                          ),
                        );
                      }
                    );
                  },
                );
              },
              child: Text('Continue', style: TextStyle(fontSize: 16, color: white)),
            ).paddingSymmetric(horizontal: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildPinField(BuildContext context, bool hidePin, FocusNode focusNode) {
    return Container(
      height: 60,
      width: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: focusNode.hasFocus ? poteaPrimaryColor : commonDividerColor),
        borderRadius: BorderRadius.circular(16),
        color: focusNode.hasFocus ? (appStore.isDarkModeOn ? darkFocusedColor : lightFocusedColor) : context.cardColor,
      ),
      child: TextFormField(
        focusNode: focusNode,
        obscureText: hidePin,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).unfocus();
          }
        },
        style: TextStyle(fontSize: 25, color: appStore.isDarkModeOn ? white : black),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
