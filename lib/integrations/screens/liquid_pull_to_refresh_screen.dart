import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/main.dart';
import 'package:access_maketicket/main/utils/AppColors.dart';
import 'package:access_maketicket/main/utils/AppWidget.dart';
import 'package:access_maketicket/main/utils/Lipsum.dart' as lipsum;
import 'package:access_maketicket/main/utils/liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class LiquidPullToRefreshScreen extends StatefulWidget {
  static String tag = '/liquid_pull_to_refresh';
  final bool isDirect;

  LiquidPullToRefreshScreen({this.isDirect = false});

  @override
  LiquidPullToRefreshScreenState createState() => LiquidPullToRefreshScreenState();
}

class LiquidPullToRefreshScreenState extends State<LiquidPullToRefreshScreen> {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    changeStatusColor(appStore.scaffoldBackground!);
    super.initState();
    refreshData();
  }

  @override
  void dispose() {
    changeStatusColor(appStore.scaffoldBackground!);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Liquid Pull To Refresh', isDashboard: widget.isDirect),
      body: LiquidPullToRefresh(
          key: refreshIndicatorKey,
          color: appColorPrimary,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  (index + 1).toString() + ' ' + lipsum.createText(),
                  maxLines: 1,
                  style: primaryTextStyle(),
                ),
              );
            },
            itemCount: 100,
            shrinkWrap: true,
          ),
          onRefresh: refreshData),
    );
  }

  Future<void> refreshData() async {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 1), () {
      completer.complete();
    });
    return completer.future.then<void>((_) {
      if (refreshIndicatorKey.currentState != null) {
        refreshIndicatorKey.currentState!.show();
      }
    });
  }
}
