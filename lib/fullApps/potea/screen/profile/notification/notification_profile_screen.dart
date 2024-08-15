import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/components/app_scaffold.dart';

import '../../../../../main.dart';
import '../../../utils/colors.dart';
import 'notification_profile_controller.dart';

class NotificationProfile extends StatelessWidget {
  NotificationProfile({super.key});

  final NotificationProfileController notificationProfileController = Get.put(NotificationProfileController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('Notification', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      body: Column(
        children: [
          SettingItemWidget(
            title: 'General Notification',
            splashColor: transparentColor,
            titleTextStyle: TextStyle(fontSize: 16, color: appStore.isDarkModeOn ? white : black),
            trailing: Obx(() => _buildSwitch(notificationProfileController.isGeneralNotificationSwitched, notificationProfileController.toggleGeneralNotification)),
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
          ),
          SettingItemWidget(
            title: 'Sound',
            splashColor: transparentColor,
            titleTextStyle: TextStyle(fontSize: 16, color: appStore.isDarkModeOn ? white : black),
            trailing: Obx(() => _buildSwitch(notificationProfileController.isSoundSwitched, notificationProfileController.toggleSound)),
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
          ),
          SettingItemWidget(
            title: 'Vibrate',
            splashColor: transparentColor,
            titleTextStyle: TextStyle(fontSize: 16, color: appStore.isDarkModeOn ? white : black),
            trailing: Obx(() => _buildSwitch(notificationProfileController.isVibrateSwitched, notificationProfileController.toggleVibrate)),
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
          ),
          SettingItemWidget(
            title: 'Special Offers',
            splashColor: transparentColor,
            titleTextStyle: TextStyle(fontSize: 16, color: appStore.isDarkModeOn ? white : black),
            trailing: Obx(() => _buildSwitch(notificationProfileController.isSpecialOffersSwitched, notificationProfileController.toggleSpecialOffers)),
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
          ),
          SettingItemWidget(
            title: 'Promo & Discount',
            splashColor: transparentColor,
            titleTextStyle: TextStyle(fontSize: 16, color: appStore.isDarkModeOn ? white : black),
            trailing: Obx(() => _buildSwitch(notificationProfileController.isPromoDiscountSwitched, notificationProfileController.togglePromoDiscount)),
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
          ),
          SettingItemWidget(
            title: 'Payments',
            splashColor: transparentColor,
            titleTextStyle: TextStyle(fontSize: 16, color: appStore.isDarkModeOn ? white : black),
            trailing: Obx(() => _buildSwitch(notificationProfileController.isPaymentsSwitched, notificationProfileController.togglePayments)),
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
          ),
          SettingItemWidget(
            title: 'Cashback',
            splashColor: transparentColor,
            titleTextStyle: TextStyle(fontSize: 16, color: appStore.isDarkModeOn ? white : black),
            trailing: Obx(() => _buildSwitch(notificationProfileController.isCashbackSwitched, notificationProfileController.toggleCashback)),
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
          ),
          SettingItemWidget(
            title: 'App Updates',
            splashColor: transparentColor,
            titleTextStyle: TextStyle(fontSize: 16, color: appStore.isDarkModeOn ? white : black),
            trailing: Obx(() => _buildSwitch(notificationProfileController.isAppUpdatesSwitched, notificationProfileController.toggleAppUpdates)),
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
          ),
          SettingItemWidget(
            title: 'New Service Available',
            splashColor: transparentColor,
            titleTextStyle: TextStyle(fontSize: 16, color: appStore.isDarkModeOn ? white : black),
            trailing: Obx(() => _buildSwitch(notificationProfileController.isNewServiceAvailableSwitched, notificationProfileController.toggleNewServiceAvailable)),
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
          ),
          SettingItemWidget(
            title: 'New Tips Available',
            splashColor: transparentColor,
            titleTextStyle: TextStyle(fontSize: 16, color: appStore.isDarkModeOn ? white : black),
            trailing: Obx(() => _buildSwitch(notificationProfileController.isNewTipsAvailableSwitched, notificationProfileController.toggleNewTipsAvailable)),
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
          ),
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
}
