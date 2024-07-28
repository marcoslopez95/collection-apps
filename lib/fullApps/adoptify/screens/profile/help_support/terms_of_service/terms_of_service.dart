import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/adoptify/components/appscaffold.dart';

import '../../../../../../main.dart';
import '../../../../utils/color.dart';
import '../../../../utils/constants.dart';

class TermOfService extends StatelessWidget {
  const TermOfService({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollbarTheme(
      data: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all<Color>(adoptifyPrimaryColor), // Change the color here
      ),
      child: Observer(
        builder: (context) {
          return AppScaffold(
            isCenterTitle: true,
            appBarTitle: Observer(
              builder: (context) {
                return Text(
                  "Terms of Service",
                  style: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, weight: FontWeight.bold, size: 18),
                );
              }
            ),
            body: Scrollbar(
              trackVisibility: true,
              thumbVisibility: true,
              thickness: 3,
              radius: Radius.circular(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Effective Date: December 20, 2024",
                      style: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 18, weight: FontWeight.bold),
                    ),
                    30.height,
                    tile(
                      context,
                      "1. Acceptance of Terms:",
                      TermsofServicerule.AcceptanceofTerms,
                    ),
                    tile(
                      context,
                      "2. Eligibility:",
                      TermsofServicerule.Eligibility,
                    ),
                    tile(
                      context,
                      "3. User Accounts:",
                      TermsofServicerule.UserAccounts,
                    ),
                    tile(
                      context,
                      "4. Adoption Process :",
                      TermsofServicerule.AdoptionProcess,
                    ),
                    tile(
                      context,
                      "5. User Conduct",
                      TermsofServicerule.UserConduct,
                    ),
                    tile(
                      context,
                      "6. Intellectual Property",
                      TermsofServicerule.IntellectualProperty,
                    ),
                    tile(
                      context,
                      "7. Intellectual Property",
                      TermsofServicerule.IntellectualProperty,
                    ),
                    tile(
                      context,
                      "8. Intellectual Property",
                      TermsofServicerule.IntellectualProperty,
                    ),
                    tile(
                      context,
                      "9. Intellectual Property",
                      TermsofServicerule.IntellectualProperty,
                    ),
                  ],
                ).paddingAll(16),
              ),
            ),
          );
        }
      ),
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
