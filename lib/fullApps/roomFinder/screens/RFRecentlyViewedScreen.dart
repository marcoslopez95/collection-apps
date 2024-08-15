import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/roomFinder/components/RFHotelListComponent.dart';
import 'package:access_maketicket/fullApps/roomFinder/components/RFPremiumServiceComponent.dart';
import 'package:access_maketicket/fullApps/roomFinder/models/RoomFinderModel.dart';
import 'package:access_maketicket/fullApps/roomFinder/utils/RFColors.dart';
import 'package:access_maketicket/fullApps/roomFinder/utils/RFDataGenerator.dart';
import 'package:access_maketicket/fullApps/roomFinder/utils/RFWidget.dart';
import 'package:access_maketicket/main.dart';

class RFRecentlyViewedScreen extends StatelessWidget {
  final List<RoomFinderModel> hotelListData = hotelList();
  final bool showHeight = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarWidget(context, showLeadingIcon: false, title: 'Recently Viewed', roundCornerShape: true, appBarHeight: 80),
      body: SingleChildScrollView(
        child: Column(
          children: [
            24.height,
            ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: hotelListData.length,
              itemBuilder: (BuildContext context, int index) {
                return RFHotelListComponent(hotelData: hotelListData[index], showHeight: true);
              },
            ),
            Container(
              margin: EdgeInsets.all(16),
              decoration: boxDecorationWithRoundedCorners(backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : rf_selectedCategoryBgColor),
              padding: EdgeInsets.all(16),
              child: RFPremiumServiceComponent(),
            ),
          ],
        ),
      ),
    );
  }
}
