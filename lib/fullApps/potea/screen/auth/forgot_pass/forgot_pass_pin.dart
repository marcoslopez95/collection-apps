import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../main.dart';
import '../../../utils/colors.dart';
import '../create_new_pass/create_new_pass.dart';
import 'forgot_pin_controller.dart';

class ForgotPassPin extends StatelessWidget {
  final ForgotPinController forgotpinController = Get.put(ForgotPinController());
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
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text('Create New PIN'),
          ),
          body: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Code has been send to +1 111 ******99', style: TextStyle(fontSize: 16)),
                SizedBox(height: Get.height * 0.070),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    _focusNodes.length,
                    (index) => Observer(
                      builder: (context) {
                        return _buildPinField(context, _focusNodes[index]);
                      }
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.070),
                Obx(
                  () => forgotpinController.timeLeft.value > 0
                      ? RichText(
                          text: TextSpan(
                            text: 'Resend code in ',
                            style: TextStyle(color: appStore.isDarkModeOn ? white : black),
                            children: <TextSpan>[
                              TextSpan(text: '${forgotpinController.timeLeft.value}', style: TextStyle(color: poteaPrimaryColor)),
                              TextSpan(text: ' s'),
                            ],
                          ),
                        )
                      : AppButton(
                          width: Get.width * 0.02,
                          height: Get.height * 0.02,
                          color: poteaPrimaryColor,
                          shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                          onTap: () {
                            forgotpinController.resetTimer();
                          },
                          child: Text('Resend', style: TextStyle(fontSize: 16, color: white)),
                        ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: AppButton(
            width: Get.width,
            height: Get.height * 0.02,
            color: poteaPrimaryColor,
            shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onTap: () {
              hideKeyboard(context);
              Get.to(() => CreateNewPass());
            },
            child: Text('Verify', style: TextStyle(fontSize: 16, color: white)),
          ).paddingSymmetric(horizontal: 16),
        ),
      ],
    );
  }

  Widget _buildPinField(BuildContext context, FocusNode focusNode) {
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
        decoration: InputDecoration(border: InputBorder.none),
      ),
    );
  }
}
