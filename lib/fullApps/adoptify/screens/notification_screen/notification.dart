import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/adoptify/components/appscaffold.dart';
import 'package:access_maketicket/main/utils/AppConstant.dart';

import '../../../../main.dart';
import '../../utils/color.dart';
import 'notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  final NotificationController controller = Get.put(NotificationController());
  final commonpadding = EdgeInsets.symmetric(vertical: Get.height * 0.007, horizontal: Get.width * 0.035);

  NotificationScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return AppScaffold(
        isCenterTitle: true,
        appBarTitle: Text(
          "Notification",
          style: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 18, weight: FontWeight.bold),
        ),
        actions: [
          Observer(builder: (context) {
            return GestureDetector(
              onTap: () {},
              child: Image(
                image: NetworkImage("${BaseUrl}/images/adoptify/icons/setting.png"),
                height: 18,
                color: appStore.isDarkModeOn ? Colors.white70 : Colors.black87,
              ),
            ).paddingAll(16);
          }),
        ],
        body: Column(
          children: [
            Row(
              children: [
                Text(
                  "Today",
                  style: primaryTextStyle(
                    color: appStore.isDarkModeOn ? Colors.white24 : Colors.black26,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: appStore.isDarkModeOn ? Colors.white24 : Colors.black26,
                  ).paddingSymmetric(horizontal: 5),
                ),
              ],
            ),
            20.height,
            Expanded(
              child: ListView.builder(
                itemCount: controller.notifications.length,
                itemBuilder: (context, index) {
                  var notification = controller.notifications[index];
                  Widget trailing = Row(
                    children: [
                      if (notification.hasNotification)
                        Icon(
                          Icons.circle,
                          color: adoptifyPrimaryColor,
                          size: 12,
                        ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                      ),
                    ],
                  );

                  Widget listItem = SettingItemWidget(
                    title: notification.title,
                    subTitle: notification.description,
                    splashColor: transparentColor,
                    titleTextStyle: primaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black, size: 16, weight: FontWeight.bold),
                    subTitleTextStyle: primaryTextStyle(
                      color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                      size: 14,
                    ),
                    leading: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: appStore.isDarkModeOn ? Colors.white24 : Colors.black26,
                        ),
                      ),
                      child: Image(
                        image: NetworkImage(notification.icon),
                        height: 22,
                        color: appStore.isDarkModeOn ? white : black,
                      ).paddingAll(9),
                    ),
                    trailing: trailing,
                    padding: commonpadding,
                    onTap: () {},
                  );

                  if (index % 4 == 1 && index != controller.notifications.length - 1) {
                    return Column(
                      children: [
                        listItem,
                        Row(
                          children: [
                            Text(
                              "Yesterday",
                              style: primaryTextStyle(
                                color: appStore.isDarkModeOn ? Colors.white24 : Colors.black26,
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: appStore.isDarkModeOn ? Colors.white24 : Colors.black26,
                                thickness: 1,
                                height: 0,
                              ).paddingSymmetric(horizontal: 16, vertical: 20),
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return listItem;
                  }
                },
              ),
            ),
          ],
        ).paddingAll(16),
      );
    });
  }
}
