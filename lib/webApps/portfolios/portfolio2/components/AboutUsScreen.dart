import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/dating/utils/DAWidgets.dart';
import 'package:access_maketicket/webApps/portfolios/portfolio2/Colors.dart';
import 'package:access_maketicket/webApps/portfolios/utils/Images.dart';

import '../../../../main.dart';

class AboutUsScreen extends StatefulWidget {
  static String tag = '/AboutUsScreen';

  @override
  AboutUsScreenState createState() => AboutUsScreenState();
}

class AboutUsScreenState extends State<AboutUsScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Container(
        height: context.height() + 32,
        width: context.width(),
        padding: EdgeInsets.only(top: 30, bottom: 30, left: 16, right: 16),
        child: Wrap(
          children: [
            commonCachedNetworkImage(
              p2AboutImg,
              alignment: Alignment.topCenter,
              fit: BoxFit.cover,
            ).cornerRadiusWithClipRRect(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.height,
                Text(
                  'I\'m a Passionate designer & developer who loves simplicity in things and crafts beautiful user interfaces with love.',
                  style: boldTextStyle(size: 24, letterSpacing: 1.2),
                ),
                16.height,
                Text(
                  "ProKit – Biggest Flutter UI kit is the ultimate library of Flutter UI templates combined into a high-quality "
                  "Flutter UI kit for Android/iOS developers. The collection "
                  "consists of UI elements and styles based on Material Design Guidelines. "
                  "With its clean and direct effect, this set of mixed App UI design easily becomes your standalone solution.",
                  style: boldTextStyle(letterSpacing: 1.3, size: 12, color: appStore.textSecondaryColor),
                ),
                16.height,
                MaterialButton(
                  onPressed: () {},
                  color: portfolio2PrimaryColor,
                  padding: EdgeInsets.only(top: 16, bottom: 16, left: 32, right: 32),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  child: Text('About me', style: primaryTextStyle(color: Colors.white)),
                )
              ],
            ).expand(flex: 2),
          ],
        ).withWidth(context.width() * 0.7),
      ),
      web: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 30, bottom: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonCachedNetworkImage(
              p2AboutImg,
              height: context.height() * 0.4,
              width: context.width() * 0.2,
              alignment: Alignment.topCenter,
              fit: BoxFit.cover,
            ).cornerRadiusWithClipRRect(16),
            40.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'I\'m a Passionate designer & developer who loves simplicity in things and crafts beautiful user interfaces with love.',
                  style: boldTextStyle(size: 24, letterSpacing: 1.2),
                ),
                16.height,
                Text(
                  "ProKit – Biggest Flutter UI kit is the ultimate library of Flutter UI templates combined into a high-quality "
                  "Flutter UI kit for Android/iOS developers. The collection "
                  "consists of UI elements and styles based on Material Design Guidelines. "
                  "With its clean and direct effect, this set of mixed App UI design easily becomes your standalone solution. ",
                  style: boldTextStyle(letterSpacing: 1.3, size: 12, color: appStore.textSecondaryColor),
                ),
                16.height,
                MaterialButton(
                  onPressed: () {},
                  color: portfolio2PrimaryColor,
                  padding: EdgeInsets.only(top: 16, bottom: 16, left: 32, right: 32),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  child: Text('About me', style: primaryTextStyle(color: Colors.white)),
                )
              ],
            ).expand(flex: 2),
          ],
        ).withWidth(context.width() * 0.7),
      ),
      tablet: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 30, bottom: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonCachedNetworkImage(
              p2AboutImg,
              height: context.height() * 0.4,
              width: context.width() * 0.2,
              alignment: Alignment.topCenter,
              fit: BoxFit.cover,
            ).cornerRadiusWithClipRRect(16),
            40.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'I\'m a Passionate designer & developer who loves simplicity in things and crafts beautiful user interfaces with love.',
                  style: boldTextStyle(size: 24, letterSpacing: 1.2),
                ),
                16.height,
                Text(
                  "ProKit – Biggest Flutter UI kit is the ultimate library of Flutter UI templates "
                  "combined into a high-quality Flutter UI kit for Android/iOS developers. "
                  "The collection consists of UI elements and styles based on Material Design Guidelines. "
                  "With its clean and direct effect, this set of mixed App UI design easily becomes your standalone solution.",
                  style: boldTextStyle(letterSpacing: 1.3, size: 12, color: appStore.textSecondaryColor),
                ),
                16.height,
                MaterialButton(
                  onPressed: () {},
                  color: portfolio2PrimaryColor,
                  padding: EdgeInsets.only(top: 16, bottom: 16, left: 32, right: 32),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  child: Text('About me', style: primaryTextStyle(color: Colors.white)),
                )
              ],
            ).expand(flex: 2),
          ],
        ).withWidth(context.width() * 0.7),
      ),
    );
  }
}
