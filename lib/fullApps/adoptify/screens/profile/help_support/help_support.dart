import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/adoptify/components/appscaffold.dart';
import 'package:prokit_flutter/fullApps/adoptify/screens/profile/help_support/privacy_policy/privacy_policy.dart';
import 'package:prokit_flutter/fullApps/adoptify/screens/profile/help_support/terms_of_service/terms_of_service.dart';

import '../../../../../main.dart';
import '../../../components/list_tile_widget.dart';
import 'contact_support/contact_support.dart';
import 'faq/faq.dart';

class HelpSupport extends StatelessWidget {
  const HelpSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return AppScaffold(
        isCenterTitle: true,
        appBarTitle: Observer(builder: (context) {
          return Text(
            "Help & Support",
            style: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, weight: FontWeight.bold, size: 18),
          );
        }),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTileWidget(
                  title: "FAQ",
                  onTap: () {
                    Get.to(() => FAQ());
                  }),
              ListTileWidget(
                  title: "Contact Support",
                  onTap: () {
                    Get.to(() => ContactSupport());
                  }),
              ListTileWidget(
                  title: "Privacy Policy",
                  onTap: () {
                    Get.to(() => PrivacyPolicy());
                  }),
              ListTileWidget(
                  title: "Terms of Service",
                  onTap: () {
                    Get.to(() => TermOfService());
                  }),
              ListTileWidget(title: "Partner", onTap: () {}),
              ListTileWidget(title: "Job Vacancy", onTap: () {}),
              ListTileWidget(title: "Accessibility", onTap: () {}),
              ListTileWidget(title: "Feedback", onTap: () {}),
              ListTileWidget(title: "About us", onTap: () {}),
              ListTileWidget(title: "Rate us", onTap: () {}),
              ListTileWidget(title: "Visit Our Website", onTap: () {}),
              ListTileWidget(title: "Follow us on Social Media", onTap: () {}),
            ],
          ),
        ),
      );
    });
  }
}
