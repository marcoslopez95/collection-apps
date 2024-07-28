import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../main.dart';
import '../../../../../main/utils/AppColors.dart';
import '../../../utils/color.dart';
import 'model/app_appearance_model.dart';

class AppAppearanceController extends GetxController {
  RxList<String> appModeListItem = RxList<String>(['Light', 'Dark'].obs);

  void updateThemeMode(ThemeMode mode) {
    appStore.toggleDarkMode(value: mode == ThemeMode.dark);
  }

  String getThemeModeString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return "Light";
      case ThemeMode.dark:
        return "Dark";
      default:
        return "Light";
    }
  }

  void showThemeBottomSheet(BuildContext context) {
    Get.bottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      Observer(builder: (context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: appStore.isDarkModeOn ? appSecondaryBackgroundColor : Colors.white, // Manually set color based on isDarkMode
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Choose Theme",
                style: primaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black, size: 18, weight: FontWeight.bold),
              ),
              15.height,
              Divider(
                thickness: 0.2,
                height: 0,
                color: appStore.isDarkModeOn ? Colors.white : Colors.black, // Divider color
              ),
              15.height,
              RadioListTile<ThemeMode>(
                title: Text('Light', style: primaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black)),
                value: ThemeMode.light,
                groupValue: appStore.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
                onChanged: (ThemeMode? value) {
                  if (value != null) {
                    updateThemeMode(value);
                  }
                },
                activeColor: adoptifyPrimaryColor,
              ),
              RadioListTile<ThemeMode>(
                title: Text('Dark', style: primaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black)),
                value: ThemeMode.dark,
                groupValue: appStore.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
                onChanged: (ThemeMode? value) {
                  if (value != null) {
                    updateThemeMode(value);
                  }
                },
                activeColor: adoptifyPrimaryColor,
              ),
              15.height,
            ],
          ).paddingAll(Get.height * 0.02),
        );
      }),
    );
  }

  final RxString selectedLanguage = 'en_US'.obs;

  final RxList<LanguageModel> languages = RxList<LanguageModel>([
    LanguageModel(code: 'en_US', name: 'English (US)', flag: '🇺🇸'),
    LanguageModel(code: 'en_UK', name: 'English (UK)', flag: '🇬🇧'),
    LanguageModel(code: 'zh_CN', name: 'Mandarin', flag: '🇨🇳'),
    LanguageModel(code: 'es_ES', name: 'Spanish', flag: '🇪🇸'),
    LanguageModel(code: 'hi_IN', name: 'Hindi', flag: '🇮🇳'),
    LanguageModel(code: 'fr_FR', name: 'French', flag: '🇫🇷'),
    LanguageModel(code: 'ar_AE', name: 'Arabic', flag: '🇦🇪'),
    LanguageModel(code: 'ru_RU', name: 'Russian', flag: '🇷🇺'),
    LanguageModel(code: 'ja_JP', name: 'Japanese', flag: '🇯🇵'),
  ].obs);

  String getSelectedLanguageName() {
    final selectedLang = languages.firstWhere((language) => language.code == selectedLanguage.value, orElse: () => LanguageModel(code: 'en_US', name: 'English (US)', flag: '🇺🇸'));
    return selectedLang.name ?? "Unknown";
  }
}
