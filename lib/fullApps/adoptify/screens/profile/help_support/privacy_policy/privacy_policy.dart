import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/adoptify/components/appscaffold.dart';

import '../../../../../../main.dart';
import '../../../../utils/color.dart';
import '../../../../utils/constants.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollbarTheme(
      data: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all<Color>(adoptifyPrimaryColor),
      ),
      child: Observer(builder: (context) {
        return AppScaffold(
          isCenterTitle: true,
          appBarTitle: Observer(
            builder: (context) {
              return Text(
                "Privacy Policy",
                style: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, weight: FontWeight.bold, size: 18),
              );
            }
          ),
          body: Scrollbar(
            thumbVisibility: true,
            trackVisibility: true,
            thickness: 3,
            radius: Radius.circular(8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Effective Date: December 19, 2024",
                    style: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 18, weight: FontWeight.bold),
                  ),
                  30.height,
                  tile(
                    context,
                    "1. Information Collection:",
                    PrivacyPolicyrules.InformationCollection,
                  ),
                  tile(
                    context,
                    "2. Information Usage:",
                    PrivacyPolicyrules.InformationUsage,
                  ),
                  tile(
                    context,
                    "3. Information Sharing:",
                    PrivacyPolicyrules.InformationSharing,
                  ),
                  tile(
                    context,
                    "4. Security Measures :",
                    PrivacyPolicyrules.SecurityMeasures,
                  ),
                  tile(
                    context,
                    "5. Cookies",
                    PrivacyPolicyrules.Cookies,
                  ),
                  tile(
                    context,
                    "6. Cookies",
                    PrivacyPolicyrules.Cookies,
                  ),
                ],
              ).paddingAll(Get.height * 0.02),
            ),
          ),
        );
      }),
    );
  }

  Widget tile(
    BuildContext context,
    String title,
    String subtitle,
  ) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: primaryTextStyle(
          size: 18,
          color: appStore.isDarkModeOn ? white : black,
          weight: FontWeight.bold,
        ),
      ).paddingBottom(10),
      subtitle: Text(
        subtitle,
        style: secondaryTextStyle(
          size: 17,
          color: appStore.isDarkModeOn ? Colors.white70 : Colors.black87,
        ),
      ),
    ).paddingBottom(9);
  }
}
