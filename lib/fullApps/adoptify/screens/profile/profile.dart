import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/adoptify/components/appscaffold.dart';
import 'package:access_maketicket/fullApps/adoptify/screens/profile/pet_preferences/pet_preferences.dart';
import 'package:access_maketicket/fullApps/adoptify/screens/profile/profile_controller.dart';
import 'package:access_maketicket/main/utils/AppConstant.dart';

import '../../../../main.dart';
import '../../utils/color.dart';
import 'account_security/account_security.dart';
import 'app_appearance_screen/app_appearance.dart';
import 'data_analytics/data_analytics..dart';
import 'edit_profile/edit_profle.dart';
import 'help_support/help_support.dart';
import 'linked_account/linked_account.dart';
import 'log_out/log_out.dart';
import 'notification/notification.dart';

class Profile extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());
  final commonpadding = EdgeInsets.symmetric(vertical: Get.height * 0.007, horizontal: Get.width * 0.035);

  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hasLeadingWidget: false,
      leadingWidget: Image(
        image: NetworkImage("${BaseUrl}/images/adoptify/image/adoptify.png"),
        color: adoptifyPrimaryColor,
        height: 30,
      ).paddingOnly(left: Get.width * 0.02),
      isCenterTitle: true,
      appBarTitle: Observer(builder: (context) {
        return Text(
          "Account",
          style: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, weight: FontWeight.bold, size: 18),
        );
      }),
      actions: [
        Observer(builder: (context) {
          return GestureDetector(
            onTap: () {},
            child: Image(
              image: NetworkImage("${BaseUrl}/images/adoptify/icons/more.png"),
              height: 18,
              color: appStore.isDarkModeOn ? Colors.white70 : Colors.black87,
            ),
          ).paddingRight(28);
        }),
      ],
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: () async {
          return controller.onWillPop(context);
        },
        child: Observer(builder: (context) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SettingItemWidget(
                  title: "Andrew Ainsley",
                  subTitle: "andrew.ainsley@youdomin.com",
                  splashColor: transparentColor,
                  titleTextStyle: primaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black, size: 16, weight: FontWeight.bold),
                  subTitleTextStyle: secondaryTextStyle(
                    color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                    size: 14,
                  ),
                  subTitleMaxLine: 1,
                  leading: CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage("${BaseUrl}/images/adoptify/person/person2.jpg"),
                  ),
                  trailing: trailing,
                  padding: commonpadding,
                  onTap: () {
                    Get.to(() => MyProfile());
                  },
                ),
                30.height,
                Divider(
                  thickness: 0.2,
                  height: 0,
                ),
                30.height,
                SettingItemWidget(
                  title: "My Pet Preferences",
                  splashColor: transparentColor,
                  titleTextStyle: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 16, weight: FontWeight.bold),
                  leading: Image.network(
                    "${BaseUrl}/images/adoptify/profile/pawP.png",
                    height: 25,
                    color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                  ),
                  trailing: trailing,
                  padding: commonpadding,
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: context.cardColor,
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                      ),
                      builder: (BuildContext context) {
                        return PetPreference();
                      },
                    );
                  },
                ),
                30.height,
                SettingItemWidget(
                  title: "Notification",
                  splashColor: transparentColor,
                  titleTextStyle: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 16, weight: FontWeight.bold),
                  leading: Image.network(
                    "${BaseUrl}/images/adoptify/profile/notification-bell.png",
                    height: 25,
                    color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                  ),
                  trailing: trailing,
                  padding: commonpadding,
                  onTap: () {
                    Get.to(() => ManageNotification());
                  },
                ),
                30.height,
                SettingItemWidget(
                  title: "Account & Security",
                  splashColor: transparentColor,
                  titleTextStyle: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 16, weight: FontWeight.bold),
                  leading: Image.network(
                    "${BaseUrl}/images/adoptify/profile/verified.png",
                    height: 25,
                    color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                  ),
                  trailing: trailing,
                  padding: commonpadding,
                  onTap: () {
                    Get.to(() => AccountSecurity());
                  },
                ),
                30.height,
                SettingItemWidget(
                  title: "Linked Accounts",
                  splashColor: transparentColor,
                  titleTextStyle: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 16, weight: FontWeight.bold),
                  leading: Image.network(
                    "${BaseUrl}/images/adoptify/profile/updown.png",
                    height: 25,
                    color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                  ),
                  trailing: trailing,
                  padding: commonpadding,
                  onTap: () {
                    Get.to(() => LinkedAccount());
                  },
                ),
                30.height,
                SettingItemWidget(
                  title: "App Appearance",
                  splashColor: transparentColor,
                  titleTextStyle: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 16, weight: FontWeight.bold),
                  leading: Image.network(
                    "${BaseUrl}/images/adoptify/profile/visible.png",
                    height: 25,
                    color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                  ),
                  trailing: trailing,
                  padding: commonpadding,
                  onTap: () {
                    Get.to(() => AppAppearance());
                  },
                ),
                30.height,
                SettingItemWidget(
                  title: "Data & Analytics",
                  splashColor: transparentColor,
                  titleTextStyle: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 16, weight: FontWeight.bold),
                  leading: Image.network(
                    "${BaseUrl}/images/adoptify/profile/analytics.png",
                    height: 25,
                    color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                  ),
                  trailing: trailing,
                  padding: commonpadding,
                  onTap: () {
                    Get.to(() => DataAnalytics());
                  },
                ),
                30.height,
                SettingItemWidget(
                  title: "Help & Support",
                  splashColor: transparentColor,
                  titleTextStyle: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 16, weight: FontWeight.bold),
                  leading: Image.network(
                    "${BaseUrl}/images/adoptify/profile/reminder.png",
                    height: 25,
                    color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                  ),
                  trailing: trailing,
                  padding: commonpadding,
                  onTap: () {
                    Get.to(() => HelpSupport());
                  },
                ),
                30.height,
                SettingItemWidget(
                  title: "Invite Friends",
                  splashColor: transparentColor,
                  titleTextStyle: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 16, weight: FontWeight.bold),
                  leading: Image.network(
                    "${BaseUrl}/images/adoptify/profile/group.png",
                    height: 25,
                    color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                  ),
                  trailing: trailing,
                  padding: commonpadding,
                  onTap: () {},
                ),
                30.height,
                SettingItemWidget(
                  title: "Log Out",
                  splashColor: transparentColor,
                  titleTextStyle: primaryTextStyle(color: cancelStatusColor, size: 16, weight: FontWeight.bold),
                  leading: Image.network(
                    "${BaseUrl}/images/adoptify/profile/exit.png",
                    height: 25,
                    color: cancelStatusColor,
                  ),
                  padding: commonpadding,
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: context.cardColor,
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                      builder: (BuildContext context) {
                        return LogOut();
                      },
                    );
                  },
                ),
              ],
            ).paddingAll(16),
          );
        }),
      ),
    );
  }

  Widget get trailing => Icon(
        Icons.arrow_forward_ios,
        size: 20,
        color: appStore.isDarkModeOn ? Colors.white : Colors.black,
      );
}
