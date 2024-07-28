import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/adoptify/components/appscaffold.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

import '../../../../../../main.dart';
import '../../../../utils/color.dart';
import '../opt_screen/otp.dart';
import '../signin_controller.dart';

class ForgotPassword extends StatelessWidget {
  final SigninController controller = Get.put(SigninController());

  ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Observer(builder: (context) {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Forgot Your Password?🔑 ",
                    style: primaryTextStyle(weight: FontWeight.bold, size: 25, color: appStore.isDarkModeOn ? white : black),
                  ),
                  30.height,
                  Text(
                    "We've got you covered. Enter your registered email to reset your password. We will send an OTP code to your email for the next steps.",
                    style: secondaryTextStyle(size: 18, color: appStore.isDarkModeOn ? Colors.white38 : Colors.black45),
                  ),
                  20.height,
                  Text(
                    "Your Registered Email",
                    style: primaryTextStyle(size: 16, color: appStore.isDarkModeOn ? Colors.white70 : Colors.black87),
                  ),
                  10.height,
                  Container(
                    height: Get.height * 0.065,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: context.cardColor,
                      border: Border.all(color: transparentColor, width: Get.width * 0.003),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: NetworkImage("${BaseUrl}/images/adoptify/icons/ic_mail.png"),
                          color: appStore.isDarkModeOn ? grey : Colors.black45,
                          height: 18,
                        ),
                        20.width,
                        Text(
                          "andrew.anisley@yourdomain.com",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: primaryTextStyle(
                            size: 18,
                            color: appStore.isDarkModeOn ? Colors.white70 : Colors.black87,
                            weight: FontWeight.w500,
                          ),
                        ).expand(),
                      ],
                    ).paddingSymmetric(horizontal: Get.height * 0.02),
                  ),
                ],
              ).paddingAll(Get.height * 0.02),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
                  child: AppButton(
                    elevation: 0,
                    text: "Send OTP Code",
                    textStyle: primaryTextStyle(size: 20, weight: FontWeight.bold, color: white),
                    color: adoptifyPrimaryColor,
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    onTap: () {
                      Get.to(() => OTPPage());
                    },
                  ).paddingSymmetric(vertical: 30, horizontal: 16)),
            ),
          ],
        );
      }),
    );
  }
}
