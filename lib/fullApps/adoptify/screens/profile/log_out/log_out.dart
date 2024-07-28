import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../main.dart';
import '../../../utils/color.dart';
import '../../auth/option_screen/option.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: Get.height * 0.34,
      width: double.infinity,
      decoration: BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Logout",
              style: primaryTextStyle(size: 18, color: adoptifyPrimaryColor, weight: FontWeight.bold),
            ).paddingBottom(Get.height * 0.03),
            Divider(
              thickness: 0.2,
              height: 0,
            ).paddingBottom(Get.height * 0.03),
            Text("Are you sure you want to log out?", style: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 18)).paddingBottom(Get.height * 0.03),
            Divider(
              thickness: 0.2,
              height: 0,
            ).paddingBottom(Get.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: Get.height * 0.063,
                  width: Get.width * 0.4,
                  child: AppButton(
                    width: Get.width,
                    elevation: 0,
                    text: "Cancel",
                    textStyle: TextStyle(fontSize: Get.width * 0.05, color: appStore.isDarkModeOn ? white : adoptifyPrimaryColor),
                    color: appStore.isDarkModeOn ? Color(0xFF35383F) : adoptifyPrimaryColor.withOpacity(0.15),
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    onTap: () {
                      Get.back();
                    },
                  ),
                ),
                Container(
                  height: Get.height * 0.063,
                  width: Get.width * 0.4,
                  child: AppButton(
                    width: Get.width,
                    elevation: 0,
                    text: "Yes, Logout",
                    textStyle: TextStyle(fontSize: Get.width * 0.05, color: white),
                    color: adoptifyPrimaryColor,
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    onTap: () {
                      Get.to(() => OptionScreen());
                    },
                  ),
                )
              ],
            )
          ],
        ).paddingAll(Get.height * 0.02),
      ),
    );
  }
}
