import 'package:flutter/material.dart';
import 'package:access_maketicket/main/utils/AppWidget.dart';
import 'package:access_maketicket/webApps/portfolios/portfolio1/components/AvailableForHireWidget.dart';
import 'package:access_maketicket/webApps/portfolios/portfolio1/components/InfoWidget.dart';
import 'package:access_maketicket/webApps/portfolios/portfolio1/components/IntroductionWidget.dart';
import 'package:access_maketicket/webApps/portfolios/portfolio1/components/MySiteWidget.dart';
import 'package:access_maketicket/webApps/portfolios/portfolio1/components/SocialWidget.dart';
import 'package:access_maketicket/webApps/portfolios/portfolio1/components/ToDoWidget.dart';

import 'components/GuideLineWidget.dart';

class Portfolio1Screen extends StatefulWidget {
  static String tag = '/Portfolio1Screen';

  @override
  Portfolio1ScreenState createState() => Portfolio1ScreenState();
}

class Portfolio1ScreenState extends State<Portfolio1Screen> {
  var scrollController = ScrollController();
  var top = 0.0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    /*scrollController.addListener(() {
      setState(() => top = scrollController.offset * 0.5);
    });*/
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Portfolio 1'),
      body: Container(
        child: Scrollbar(
          child: NotificationListener(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  IntroductionWidget(),
                  MySiteWidget(),
                  AvailableForHireWidget(),
                  ToDoWidget(),
                  InfoWidget(),
                  GuideLineWidget(),
                  SocialWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
