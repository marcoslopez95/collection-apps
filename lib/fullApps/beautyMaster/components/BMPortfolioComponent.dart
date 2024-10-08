import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/beautyMaster/models/BMCommonCardModel.dart';
import 'package:access_maketicket/fullApps/beautyMaster/screens/BMSinglePortfolioScreen.dart';
import 'package:access_maketicket/fullApps/beautyMaster/utils/BMColors.dart';
import 'package:access_maketicket/fullApps/beautyMaster/utils/BMCommonWidgets.dart';
import 'package:access_maketicket/fullApps/beautyMaster/utils/BMDataGenerator.dart';
import 'package:access_maketicket/main.dart';

class BMPortfolioComponent extends StatelessWidget {
  List<BMCommonCardModel> portfolioList = getRecommendedList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: portfolioList.map((e) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          width: context.width() - 32,
          decoration: BoxDecoration(color: context.cardColor, borderRadius: radius(32)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bmCommonCachedNetworkImage(
                e.image,
                width: context.width() - 32,
                height: 150,
                fit: BoxFit.cover,
              ).cornerRadiusWithClipRRectOnly(topLeft: 32, topRight: 32),
              8.height,
              Text(e.title, style: boldTextStyle(size: 18, color: appStore.isDarkModeOn ? Colors.white : bmSpecialColorDark)).paddingSymmetric(horizontal: 8),
              4.height,
              Row(
                children: [
                  Icon(Icons.favorite, color: bmPrimaryColor, size: 16),
                  2.width,
                  Text(e.likes!, style: secondaryTextStyle(color: appStore.isDarkModeOn ? bmTextColorDarkMode : bmPrimaryColor, size: 14)),
                  8.width,
                  Icon(Icons.messenger, color: bmPrimaryColor, size: 16),
                  2.width,
                  Text(e.comments!, style: secondaryTextStyle(color: appStore.isDarkModeOn ? bmTextColorDarkMode : bmPrimaryColor, size: 14)),
                ],
              ).paddingSymmetric(horizontal: 8),
              16.height,
            ],
          ),
        ).onTap(() {
          BMSinglePortfolioScreen(element: e).launch(context);
        });
      }).toList(),
    ).paddingSymmetric(vertical: 8);
  }
}
