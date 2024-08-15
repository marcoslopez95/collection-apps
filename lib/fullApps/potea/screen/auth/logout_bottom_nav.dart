import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/screen/auth/option_screen.dart';

import '../../../../main.dart';
import '../../utils/colors.dart';
import '../../utils/common_base.dart';

class LogOutBottom extends StatelessWidget {
  const LogOutBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: Get.height * 0.28,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: context.cardColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              indent: 3,
              height: 1,
              thickness: 3,
              color: borderColor.withOpacity(0.5),
            ).paddingSymmetric(horizontal: 140),
            SizedBox(height: Get.height * 0.018),
            Center(
              child: Text('Logout', style: TextStyle(color: logoutColor, fontSize: 20, fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: Get.height * 0.018),
            commonDivider,
            SizedBox(height: Get.height * 0.018),
            Center(child: Text('Are you sure you want to log out?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
            SizedBox(height: Get.height * 0.018),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    height: Get.height * 0.02,
                    color: appStore.isDarkModeOn ? slateGrey : lightaddressColor,
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    onTap: () {
                      Get.back();
                    },
                    child: Text('Cancel', style: TextStyle(fontSize: 16, color: appStore.isDarkModeOn ? white : poteaPrimaryColor)),
                  ),
                ),
                SizedBox(width: Get.width * 0.02),
                Expanded(
                  child: AppButton(
                    height: Get.height * 0.02,
                    color: poteaPrimaryColor,
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    onTap: () {
                      Get.to(() => OptionScreen());
                    },
                    child: Text(
                      'Yes, Logout',
                      style: TextStyle(fontSize: 16, color: white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
