import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/adoptify/components/appscaffold.dart';

import '../../../../components/pagenavigator.dart';
import '../../../../utils/color.dart';
import '../../signin_screen/signin.dart';
import '../signup_controller.dart';
import 'detail_1.dart';
import 'detail_2.dart';
import 'detail_3.dart';
import 'detail_4.dart';

class SignUpFlow extends StatelessWidget {
  final controller = PageController();
  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Obx(
        () => GradientProgressIndicator(
          value: (signUpController.currentPage.value + 1) / 4,
        ),
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: controller,
            onPageChanged: (int page) {
              signUpController.currentPage.value = page;
            },
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return DetailPage1();
              } else if (index == 1) {
                return DetailPage2();
              } else if (index == 2) {
                return DetailPage3();
              } else {
                return DetailPage4();
              }
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(
              () => Container(
                  width: Get.width,
                  decoration: BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
                  child: AppButton(
                    elevation: 0,
                    text: signUpController.currentPage.value < 3 ? "Continue" : "Finish",
                    textStyle: primaryTextStyle(size: 20, weight: FontWeight.bold, color: white),
                    color: adoptifyPrimaryColor,
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    onTap: () {
                      hideKeyboard(context);
                      print("Current page index: ${signUpController.currentPage.value}");
                      if (signUpController.currentPage.value < 3) {
                        controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      } else {
                        Get.to(() => SignInPage());
                      }
                    },
                  ).paddingSymmetric(vertical: 30, horizontal: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
