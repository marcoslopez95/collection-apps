import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/evSpot/utils/colors.dart';
import 'package:access_maketicket/fullApps/evSpot/utils/data_provider.dart';
import 'package:access_maketicket/main.dart';
import '../../../main/utils/AppConstant.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: appStore.isDarkModeOn ? Colors.black : Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Privacy policy', style: boldTextStyle(size: 22)),
            SizedBox(height: 30),
            Text(ProKitShortText, style: primaryTextStyle(), textAlign: TextAlign.justify),
            SizedBox(height: 30),
            Text('Privacy Policies', style: secondaryTextStyle(size: 16)),
            ListView.builder(
              itemCount: policyText.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                String policyData = policyText[index];
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: const EdgeInsets.only(top: 4), child: Icon(Icons.circle, size: 10, color: ev_primary_color)),
                      SizedBox(width: 16),
                      Expanded(child: Text('$policyData', textAlign: TextAlign.justify, style: primaryTextStyle())),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
