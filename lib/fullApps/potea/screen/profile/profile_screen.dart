import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/components/app_scaffold.dart';
import 'package:access_maketicket/fullApps/potea/screen/profile/payment/payment_profile_screen.dart';
import 'package:access_maketicket/fullApps/potea/screen/profile/privacy_policy/privacy_policy.dart';
import 'package:access_maketicket/fullApps/potea/screen/profile/profile_contoller.dart';
import 'package:access_maketicket/fullApps/potea/screen/profile/security/security_screen.dart';

import '../../../../main.dart';
import '../../components/image_picker_widget.dart';
import '../../utils/colors.dart';
import '../../utils/common_base.dart';
import '../../utils/image.dart';
import '../auth/logout_bottom_nav.dart';
import '../dashboard/dashboard_controller.dart';
import 'address/profile_address_screen.dart';
import 'edit_profile.dart';
import 'fill_profile/fill_profile_controller.dart';
import 'fill_profile/image_picker_controller.dart';
import 'help_center/help.dart';
import 'invite_friends/friend_invite_screen.dart';
import 'language/language.dart';
import 'language/language_controller.dart';
import 'notification/notification_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  ImagePickerController controller = Get.put(ImagePickerController());
  FillProfileController fillController = Get.put(FillProfileController());
  final ProfileController profileController = Get.put(ProfileController());
  final LanguageController languageController = Get.put(LanguageController());
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return homeController.onWillPop(context);
      },
      child: AppScaffold(
        hasLeadingWidget: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.network(
              icMore,
              color: appStore.isDarkModeOn ? white : black,
              width: 23,
            ),
          ),
          8.width,
        ],
        appBarTitle: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(assetsPoteaLogo, height: 28),
              SizedBox(width: Get.width * 0.03),
              Text('Profile', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Observer(builder: (context) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ImagePickerWidget(),
                        16.height,
                        Text('Andrew Ainsley', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        8.height,
                        Text('+1 111 467 378 399', style: TextStyle(fontSize: 12, color: appStore.isDarkModeOn ? Colors.white70 : Colors.black87)),
                        16.height,
                        commonDivider.paddingSymmetric(horizontal: 16),
                        8.height,
                        SettingItemWidget(
                          title: 'Edit Profile',
                          splashColor: transparentColor,
                          onTap: () {
                            Get.to(() => EditProfile(), duration: const Duration(milliseconds: 800));
                          },
                          titleTextStyle: TextStyle(fontSize: 14, color: appStore.isDarkModeOn ? white : black),
                          leading: Image.network(icProfile, height: 20, width: 20, color: appStore.isDarkModeOn ? white : black),
                          trailing: trailing,
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                        ),
                        SettingItemWidget(
                          title: 'Address',
                          splashColor: transparentColor,
                          onTap: () {
                            Get.to(() => ProfileAddress(), duration: const Duration(milliseconds: 800));
                          },
                          titleTextStyle: TextStyle(fontSize: 14, color: appStore.isDarkModeOn ? white : black),
                          leading: Image.network(icPin, height: 20, width: 20, color: appStore.isDarkModeOn ? white : black),
                          trailing: trailing,
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                        ),
                        SettingItemWidget(
                          title: 'Notification',
                          splashColor: transparentColor,
                          onTap: () {
                            Get.to(() => NotificationProfile(), duration: const Duration(milliseconds: 800));
                          },
                          titleTextStyle: TextStyle(fontSize: 14, color: appStore.isDarkModeOn ? white : black),
                          leading: Image.network(icNotification, height: 20, width: 20, color: appStore.isDarkModeOn ? white : black),
                          trailing: trailing,
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                        ),
                        SettingItemWidget(
                          title: 'Payment',
                          splashColor: transparentColor,
                          onTap: () {
                            Get.to(() => PaymentProfileScreen(), duration: const Duration(milliseconds: 800));
                          },
                          titleTextStyle: TextStyle(fontSize: 14, color: appStore.isDarkModeOn ? white : black),
                          leading: Image.network(icWallet, height: 20, width: 20, color: appStore.isDarkModeOn ? white : black),
                          trailing: trailing,
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                        ),
                        SettingItemWidget(
                          title: 'Security',
                          splashColor: transparentColor,
                          onTap: () {
                            Get.to(() => SecurityScreen(), duration: const Duration(milliseconds: 800));
                          },
                          titleTextStyle: TextStyle(fontSize: 14, color: appStore.isDarkModeOn ? white : black),
                          leading: Image.network(icSecurity, height: 20, width: 20, color: appStore.isDarkModeOn ? white : black),
                          trailing: trailing,
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                        ),
                        Obx(
                          () => SettingItemWidget(
                            title: 'Language',
                            titleTextStyle: TextStyle(
                              fontSize: 14,
                              color: appStore.isDarkModeOn ? white : black,
                            ),
                            leading: Image.network(
                              icLanguage,
                              height: 20,
                              width: 20,
                              color: appStore.isDarkModeOn ? white : black,
                            ),
                            trailing: Row(
                              children: [
                                Text(
                                  languageController.selectedlang.value != null ? languageController.selectedlang.value!.lang : 'Default Language',
                                  style: TextStyle(fontSize: 14),
                                ),
                                8.width,
                                trailing,
                              ],
                            ),
                            onTap: () {
                              Get.to(() => LanguageProfile(), duration: const Duration(milliseconds: 800));
                            },
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                          ),
                        ),
                        SettingItemWidget(
                          title: 'Dark Mode',
                          splashColor: transparentColor,
                          titleTextStyle: TextStyle(fontSize: 14, color: appStore.isDarkModeOn ? white : black),
                          leading: Image.network(icEye, height: 20, width: 20, color: appStore.isDarkModeOn ? white : black),
                          trailing: Transform.scale(
                            scale: 0.6,
                            child: Switch(
                              value: appStore.isDarkModeOn,
                              onChanged: (newValue) => profileController.toggleDarkMode(newValue),
                              activeColor: Colors.white,
                              activeTrackColor: poteaPrimaryColor,
                              inactiveThumbColor: Colors.white,
                              inactiveTrackColor: Color(0xFF35383F),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                        SettingItemWidget(
                          title: 'Privacy Policy',
                          splashColor: transparentColor,
                          onTap: () {
                            Get.to(() => PrivacyPolicy(), duration: const Duration(milliseconds: 800));
                          },
                          titleTextStyle: TextStyle(fontSize: 14, color: appStore.isDarkModeOn ? white : black),
                          leading: Image.network(icPrivacyPolicy, height: 20, width: 20, color: appStore.isDarkModeOn ? white : black),
                          trailing: trailing,
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                        ),
                        SettingItemWidget(
                          title: 'Help Center',
                          splashColor: transparentColor,
                          onTap: () {
                            Get.to(() => HelpBar(), duration: const Duration(milliseconds: 800));
                          },
                          titleTextStyle: TextStyle(fontSize: 14, color: appStore.isDarkModeOn ? white : black),
                          leading: Image.network(iconsHelpInfo, height: 20, width: 20, color: appStore.isDarkModeOn ? white : black),
                          trailing: trailing,
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                        ),
                        SettingItemWidget(
                          title: 'Invite Friends',
                          splashColor: transparentColor,
                          onTap: () {
                            Get.to(() => InviteFriendsScreen(), duration: const Duration(milliseconds: 800));
                          },
                          titleTextStyle: TextStyle(fontSize: 14, color: appStore.isDarkModeOn ? white : black),
                          leading: Image.network(icInviteFriends, height: 20, width: 20, color: appStore.isDarkModeOn ? white : black),
                          trailing: trailing,
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                        ),
                        SettingItemWidget(
                          title: 'Logout',
                          splashColor: transparentColor,
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                              ),
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return LogOutBottom();
                              },
                            );
                          },
                          titleTextStyle: TextStyle(fontSize: 14, color: logoutColor),
                          leading: Image.network(icLogout, height: 20, width: 20, color: logoutColor),
                          trailing: trailing,
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get trailing => Icon(Icons.arrow_forward_ios, size: 12, color: appStore.isDarkModeOn ? white : black);
}
