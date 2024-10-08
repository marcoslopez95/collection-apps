import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/roomFinder/components/RFPremiumServiceComponent.dart';
import 'package:access_maketicket/fullApps/roomFinder/utils/RFColors.dart';
import 'package:access_maketicket/fullApps/roomFinder/utils/RFImages.dart';
import 'package:access_maketicket/fullApps/roomFinder/utils/RFWidget.dart';
import 'package:access_maketicket/main.dart';
import '../../../main/utils/AppConstant.dart';

class RFAboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarWidget(context, showLeadingIcon: false, title: 'About Us', roundCornerShape: true, appBarHeight: 80),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            rfCommonCachedNetworkImage(rf_aboutUs, fit: BoxFit.cover, height: 150, width: context.width()),
            Container(
              decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.cardColor),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About the Company', style: boldTextStyle()),
                  8.height,
                  Text(ProKitLongText, style: secondaryTextStyle()),
                  16.height,
                  Text('About the Members', style: boldTextStyle()),
                  8.height,
                  Text(
                    ProKitSoLongText,
                    style: secondaryTextStyle(),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 24),
              decoration: boxDecorationWithRoundedCorners(
                backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : rf_selectedCategoryBgColor,
              ),
              padding: EdgeInsets.all(16),
              child: RFPremiumServiceComponent(),
            ),
          ],
        ),
      ),
    );
  }
}
