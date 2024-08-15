import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/components/app_scaffold.dart';
import 'package:access_maketicket/fullApps/potea/screen/auth/sign_in_screen.dart';
import 'package:access_maketicket/fullApps/potea/screen/auth/sign_up_screen.dart';

import '../../../../main.dart';
import '../../utils/colors.dart';
import '../../utils/common_base.dart';
import '../../utils/image.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hideAppBar: true,
      body: Column(
        children: [
          SizedBox(height: Get.height * 0.060),
          SizedBox(
            height: 200,
            width: 300,
            child: CircleAvatar(
              backgroundColor: context.cardColor,
              child: Image.network(
                imageWindowTransparent800x646,
                width: 300,
                height: 300,
              ),
            ),
          ),
          SizedBox(height: Get.height * 0.016),
          Text("Let's you in", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
          SizedBox(height: Get.height * 0.020),
          AppButton(
            elevation: 0.0,
            color: context.cardColor,
            shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(icFacebook, width: Get.width * 0.07),
                5.width,
                Text('Continue with Facebook'),
              ],
            ),
          ).paddingSymmetric(horizontal: 16),
          SizedBox(height: Get.height * 0.016),
          AppButton(
            elevation: 0.0,
            color: context.cardColor,
            shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(icGoogle, width: Get.width * 0.07),
                5.width,
                Text('Continue with Google'),
              ],
            ),
          ).paddingSymmetric(horizontal: 16),
          SizedBox(height: Get.height * 0.016),
          AppButton(
            elevation: 0.0,
            color: context.cardColor,
            shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(icAppleLogo, color: appStore.isDarkModeOn ? Colors.white : Colors.black, width: Get.width * 0.07),
                5.width,
                Text('Continue with Apple'),
              ],
            ),
          ).paddingSymmetric(horizontal: 16),
          SizedBox(height: Get.height * 0.030),
          Row(children: <Widget>[
            Expanded(child: commonDivider),
            5.width,
            Text('or'),
            5.width,
            Expanded(child: commonDivider),
          ]).paddingSymmetric(horizontal: 16),
          SizedBox(height: Get.height * 0.030),
          AppButton(
            elevation: 0.0,
            width: Get.width,
            height: Get.height * 0.02,
            color: poteaPrimaryColor,
            shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onTap: () {
              Get.to(() => SignIn());
            },
            child: Text('Sign in with password', style: TextStyle(fontSize: 16, color: white)),
          ).paddingSymmetric(horizontal: 16),
          SizedBox(height: Get.height * 0.016),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?", style: TextStyle(fontSize: 14)),
              TextButton(
                onPressed: () {
                  Get.to(() => SignUp());
                },
                child: Text('Sign up', style: TextStyle(color: poteaPrimaryColor)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
