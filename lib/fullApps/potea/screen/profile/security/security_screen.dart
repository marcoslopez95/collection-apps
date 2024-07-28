import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/potea/components/app_scaffold.dart';
import 'package:prokit_flutter/fullApps/potea/screen/profile/security/security_controller.dart';

import '../../../../../main.dart';
import '../../../utils/colors.dart';

class SecurityScreen extends StatelessWidget {
  SecurityScreen({super.key});

  final SecurityController notificationProfileController = Get.put(SecurityController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('Security', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      body: Column(
        children: [
          SettingItemWidget(
            title: 'Remember me',
            splashColor: transparentColor,
            titleTextStyle: TextStyle(fontSize: 16, color: appStore.isDarkModeOn ? white : black),
            trailing: Obx(() => _buildSwitch(notificationProfileController.isRememberMe, notificationProfileController.toggleRememberMe)),
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
          ),
          SettingItemWidget(
            title: 'Face ID',
            splashColor: transparentColor,
            titleTextStyle: TextStyle(fontSize: 16, color: appStore.isDarkModeOn ? white : black),
            trailing: Obx(() => _buildSwitch(notificationProfileController.isFaceID, notificationProfileController.toggleFaceID)),
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
          ),
          SettingItemWidget(
            title: 'Biometric ID',
            splashColor: transparentColor,
            titleTextStyle: TextStyle(fontSize: 16, color: appStore.isDarkModeOn ? white : black),
            trailing: Obx(() => _buildSwitch(notificationProfileController.isBiometricID, notificationProfileController.toggleBiometricID)),
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
          ),
          SettingItemWidget(
            title: 'Google Authenticator',
            splashColor: transparentColor,
            onTap: () {},
            titleTextStyle: TextStyle(fontSize: 14, color: appStore.isDarkModeOn ? white : black),
            trailing: trailing,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
          ),
          AppButton(
            width: Get.width,
            height: Get.height * 0.06,
            color: appStore.isDarkModeOn ? slateGrey : lightaddressColor,
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            onTap: () {},
            child: Text('Change PIN', style: TextStyle(fontSize: 16, color: appStore.isDarkModeOn ? white : poteaPrimaryColor)),
          ).paddingSymmetric(horizontal: 16, vertical: 16),
          AppButton(
            width: Get.width,
            height: Get.height * 0.06,
            color: appStore.isDarkModeOn ? slateGrey : lightaddressColor,
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            onTap: () {},
            child: Text('Change Password', style: TextStyle(fontSize: 16, color: appStore.isDarkModeOn ? white : poteaPrimaryColor)),
          ).paddingSymmetric(horizontal: 16),
        ],
      ),
    );
  }

  Widget _buildSwitch(RxBool switchValue, Function(bool) onChanged) {
    return Transform.scale(
      scale: 0.6,
      child: Switch(
        value: switchValue.value,
        onChanged: onChanged,
        activeColor: Colors.white,
        activeTrackColor: poteaPrimaryColor,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Color(0xFF35383F),
      ),
    );
  }

  Widget get trailing => Icon(Icons.arrow_forward_ios, size: 16, color: poteaPrimaryColor);
}
