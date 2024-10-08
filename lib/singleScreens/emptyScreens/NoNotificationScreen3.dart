import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/main.dart';

import '../../main/utils/AppConstant.dart';

class NoNotificationScreen3 extends StatefulWidget {
  static var tag = "/no_notification3";

  const NoNotificationScreen3({Key? key}) : super(key: key);

  @override
  _NoNotificationScreen3State createState() => _NoNotificationScreen3State();
}

class _NoNotificationScreen3State extends State<NoNotificationScreen3> {
  @override
  void dispose() {
    setStatusBarColor(appStore.scaffoldBackground!);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            70.height,
            Column(
              children: [
                Text('No Notification', style: boldTextStyle(size: 20)),
                16.height,
                Text(
                  ProKitShortText,
                  style: primaryTextStyle(size: 15),
                  textAlign: TextAlign.center,
                ).paddingSymmetric(vertical: 8, horizontal: 60),
              ],
            ),
            100.height,
            Container(
              padding: EdgeInsets.all(32),
              child: Image.asset('images/emptyScreen1/mobileTick.png'),
              height: 230,
              decoration: BoxDecoration(color: lightGray.withOpacity(0.3), shape: BoxShape.circle),
            ),
          ],
        ),
      ),
    );
  }
}
