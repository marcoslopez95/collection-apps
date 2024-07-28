import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/adoptify/components/appscaffold.dart';

import '../../../../../main.dart';
import '../../../utils/color.dart';
import 'app_appearancecontroller.dart';

class AppLanguage extends StatelessWidget {
  final AppAppearanceController _controller = Get.put(AppAppearanceController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isCenterTitle: true,
      appBarTitle: Observer(builder: (context) {
        return Text(
          "Select Language",
          style: primaryTextStyle(
            color: appStore.isDarkModeOn ? white : black,
            weight: FontWeight.bold,
            size: 18,
          ),
        );
      }),
      body: Obx(() {
        return ListView(
          children: List.generate(_controller.languages.length, (index) {
            final language = _controller.languages[index];
            final isSelected = _controller.selectedLanguage.value == language.code;

            return GestureDetector(
              onTap: () {
                _controller.selectedLanguage.value = language.code ?? "";
                print("Selected Language: ${_controller.selectedLanguage.value}");
              },
              child: Container(
                padding: EdgeInsets.all(Get.height * 0.01),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: context.cardColor,
                  border: Border.all(
                    color: isSelected ? adoptifyPrimaryColor : transparentColor,
                  ),
                ),
                child: ListTile(
                  leading: Text(
                    language.flag ?? "",
                    style: primaryTextStyle(
                      size: 22,
                    ),
                  ),
                  title: Observer(builder: (context) {
                    return Text(
                      language.name ?? "",
                      style: primaryTextStyle(
                        color: appStore.isDarkModeOn ? white : black,
                        weight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    );
                  }),
                  trailing: isSelected ? Icon(Icons.check, color: Colors.orange) : null,
                ),
              ).paddingAll(Get.height * 0.015),
            );
          }),
        );
      }),
    );
  }
}
