import 'package:access_maketicket/constants.dart';
import 'package:access_maketicket/helper.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/musicPodcast/models/MusicModel.dart';
import 'package:access_maketicket/fullApps/musicPodcast/screen/MPDashboardScreen.dart';
import 'package:access_maketicket/fullApps/musicPodcast/utils/MPColors.dart';
import 'package:access_maketicket/fullApps/musicPodcast/utils/MPDataGenerator.dart';
import 'package:access_maketicket/fullApps/musicPodcast/utils/MPImages.dart';
import 'package:access_maketicket/main/utils/AppWidget.dart';

class DrawerScreen extends StatefulWidget {
  @override
  DrawerScreenState createState() => DrawerScreenState();
}

class DrawerScreenState extends State<DrawerScreen> {
  List<DrawerList> drawerList = getDrawerList();
  Helper helper = Helper();
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    helper.context = context;
    return Theme(
      data: ThemeData(canvasColor: mpAppBackGroundColor),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 260,
              color: mpAppBackGroundColor,
              child: DrawerHeader(
                decoration: BoxDecoration(color: mpAppButtonColor),
                child: Column(
                  children: [
                    16.height,
                    commonCacheImageWidget(mpImages_2, 100, width: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(50),
                    16.height,
                    Text('Menu', style: boldTextStyle(color: Colors.white, size: 18)),
                    20.height,
                    Text(APP_VERSION, style: boldTextStyle(color: Colors.white, size: 18)),
                  ],
                ),
              ),
            ),
            Container(
              color: mpAppBackGroundColor,
              padding: EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: drawerList.map((e) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(e.name!, style: primaryTextStyle(color: white)).paddingAll(8),
                          Divider(color: mpAppTextColor1),
                        ],
                      ).onTap(() {
                        e.widget.launch(context);
                      });
                    }).toList(),
                  ).paddingAll(8),
                  16.height,
                  AppButton(
                    child: Text('Salir', style: boldTextStyle(color: Colors.white, size: 14)),
                    color: mpAppButtonColor,
                    width: 140,
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    onTap: () {
                      helper.goLogin();
                      // showAlertDialog(context);
                    },
                  ).cornerRadiusWithClipRRect(16).center(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text("Cancel", style: secondaryTextStyle(color: Colors.white)).onTap(() {
          finish(context);
          finish(context);
        }).paddingOnly(top: 4, bottom: 4),
        32.width,
        Text("OK", style: secondaryTextStyle(color: Colors.white)).paddingOnly(right: 8, top: 4, bottom: 4).onTap(() {
          MPDashboardScreen().launch(context);
        }),
      ],
    );
    AlertDialog alert = AlertDialog(
      backgroundColor: mpBottomBgColor,
      content: Text("Are you sure , you Want to sign out ?", style: boldTextStyle(color: Colors.white)),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
