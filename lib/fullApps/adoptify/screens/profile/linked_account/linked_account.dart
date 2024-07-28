import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/adoptify/components/appscaffold.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

import '../../../../../main.dart';
import '../../../utils/color.dart';

class LinkedAccount extends StatelessWidget {
  const LinkedAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return AppScaffold(
        isCenterTitle: true,
        appBarTitle: Text(
          "Linked Account",
          style: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 18, weight: FontWeight.bold),
        ),
        body: Column(
          children: [
            linkedAcc(
              context: context,
              imagepath: "${BaseUrl}/images/adoptify/icons/google.png",
              status: "Connected",
              title: "Google",
              onTap: () {},
            ),
            linkedAcc(
              context: context,
              imagepath: appStore.isDarkModeOn ? "${BaseUrl}/images/adoptify/icons/apple.png" : "${BaseUrl}/images/adoptify/icons/apple-light.png",
              status: "Connected",
              title: "Apple",
              onTap: () {},
            ),
            linkedAcc(
              context: context,
              imagepath: "${BaseUrl}/images/adoptify/icons/facebook.png",
              status: "Conntect",
              title: "Facebook",
              isconnected: true,
              onTap: () {},
            ),
            linkedAcc(
              context: context,
              imagepath: "${BaseUrl}/images/adoptify/icons/twitter.png",
              status: "Conntect",
              title: "Twitter",
              isconnected: true,
              onTap: () {},
            ),
          ],
        ),
      );
    });
  }

  Widget linkedAcc({required BuildContext context, required String imagepath, required String title, required String status, bool isconnected = false, required VoidCallback onTap}) {
    return Container(
      height: Get.height * 0.1,
      decoration: BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Image(
            image: NetworkImage(imagepath),
            height: 25,
          ).paddingBottom(10),
          title: Text(
            title,
            style: primaryTextStyle(size: 18, color: appStore.isDarkModeOn ? white : black, weight: FontWeight.bold),
          ).paddingBottom(Get.height * 0.01),
          trailing: Text(
            status,
            style: secondaryTextStyle(size: 16, color: isconnected ? adoptifyPrimaryColor : (appStore.isDarkModeOn ? white : black), weight: FontWeight.bold),
          ),
          onTap: onTap,
        ),
      ).paddingSymmetric(horizontal: 16),
    ).paddingAll(16);
  }
}
