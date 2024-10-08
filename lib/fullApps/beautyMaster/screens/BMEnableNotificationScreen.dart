import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/beautyMaster/screens/BMWelcomeScreen.dart';
import 'package:access_maketicket/fullApps/beautyMaster/utils/BMColors.dart';
import 'package:access_maketicket/fullApps/beautyMaster/utils/BMCommonWidgets.dart';
import 'package:access_maketicket/main.dart';
import 'package:access_maketicket/main/utils/AppConstant.dart';

class BMEnableNotificationScreen extends StatelessWidget {
  const BMEnableNotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          20.height,
          Column(
            children: [
              bmCommonCachedNetworkImage('$BaseUrl/images/beauty_master/notification.png', height: 200),
              Text('Get notified about new deals, messages, people and more.', style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : bmSpecialColorDark), textAlign: TextAlign.center),
              16.height,
              Text(
                'Turn on push notifications to help you don\'t missing anything awesome.',
                style: secondaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : bmSpecialColorDark),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            children: [
              AppButton(
                width: context.width() - 40,
                shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                child: Text('Enable Notification', style: boldTextStyle(color: Colors.white)),
                padding: EdgeInsets.all(16),
                color: bmPrimaryColor,
                onTap: () {
                  BMWelcomeScreen().launch(context);
                },
              ),
              20.height,
              Text('Maybe Later', style: boldTextStyle(color: appStore.isDarkModeOn ? bmPrimaryColor : Colors.grey)),
            ],
          )
        ],
      ).paddingAll(20),
    );
  }
}
