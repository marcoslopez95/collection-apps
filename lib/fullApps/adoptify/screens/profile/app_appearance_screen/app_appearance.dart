import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/adoptify/components/appscaffold.dart';

import '../../../../../main.dart';
import 'app_appearancecontroller.dart';
import 'app_language.dart';

class AppAppearance extends StatelessWidget {
  final AppAppearanceController _controller = Get.put(AppAppearanceController());

  final commonPadding = EdgeInsets.symmetric(
    vertical: Get.height * 0.007,
    horizontal: Get.width * 0.035,
  );

  AppAppearance({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isCenterTitle: true,
      appBarTitle: Observer(builder: (context) {
        return Text(
          "App Appearance",
          style: primaryTextStyle(
            color: appStore.isDarkModeOn ? white : black,
            weight: FontWeight.bold,
            size: 18,
          ),
        );
      }),
      body: Column(
        children: [
          Observer(builder: (context) {
            return SettingItemWidget(
              title: "Theme",
              splashColor: transparentColor,
              titleTextStyle: primaryTextStyle(
                color: appStore.isDarkModeOn ? white : black,
                size: 16,
                weight: FontWeight.bold,
              ),
              trailing: Observer(builder: (context) {
                return Row(
                  children: [
                    Text(
                      _controller.getThemeModeString(appStore.isDarkModeOn ? ThemeMode.dark : ThemeMode.light),
                      style: primaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black, size: 14),
                    ),
                    10.width,
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                    ),
                  ],
                );
              }),
              padding: commonPadding,
              onTap: () {
                _controller.showThemeBottomSheet(context);
              },
            );
          }),
          20.height,
          Observer(builder: (context) {
            return SettingItemWidget(
              title: "App Language",
              splashColor: transparentColor,
              titleTextStyle: primaryTextStyle(
                color: appStore.isDarkModeOn ? white : black,
                size: 16,
                weight: FontWeight.bold,
              ),
              trailing: Obx(() => Row(
                    children: [
                      Text(
                        _controller.getSelectedLanguageName(),
                        style: TextStyle(
                          color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      10.width,
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                      ),
                    ],
                  )),
              padding: commonPadding,
              onTap: () {
                Get.to(() => AppLanguage());
              },
            );
          }),
        ],
      ).paddingAll(Get.height * 0.02),
    );
  }

  Widget get trailing => Icon(Icons.arrow_forward_ios, size: 20, color: appStore.isDarkModeOn ? Colors.white : Colors.black);
}
