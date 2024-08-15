import 'package:flutter/material.dart';
import 'package:access_maketicket/fullApps/social/model/SocialModel.dart';
import 'package:access_maketicket/fullApps/social/utils/SocialConstant.dart';
import 'package:access_maketicket/fullApps/social/utils/SocialDataGenerator.dart';
import 'package:access_maketicket/fullApps/social/utils/SocialWidget.dart';
import 'package:access_maketicket/main/utils/AppWidget.dart';

import 'SocialHomeChats.dart';

class SocialViewChat extends StatefulWidget {
  static String tag = '/SocialViewChat';

  @override
  SocialViewChatState createState() => SocialViewChatState();
}

class SocialViewChatState extends State<SocialViewChat> {
  late List<SocialUser> mList;

  @override
  void initState() {
    super.initState();
    mList = addSeeMoreData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            mTop(context, ""),
            Container(
              margin: EdgeInsets.all(spacing_standard_new),
              decoration: boxDecoration(radius: spacing_middle),
              padding: EdgeInsets.all(spacing_middle),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Chats(mList[index], index);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
