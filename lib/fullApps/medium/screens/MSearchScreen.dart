import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/medium/modal/MModel.dart';
import 'package:access_maketicket/fullApps/medium/screens/MAudioArticlesScreen.dart';
import 'package:access_maketicket/fullApps/medium/utils/MColors.dart';
import 'package:access_maketicket/fullApps/medium/utils/MDataProvider.dart';

class MSearchScreen extends StatefulWidget {
  static String tag = '/MSearchScreen';

  @override
  MSearchScreenState createState() => MSearchScreenState();
}

class MSearchScreenState extends State<MSearchScreen> {
  List<MTopicModel> topicList = getTopicList();

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
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget('Search Medium', color: Colors.black, textColor: white),
        body: Container(
          color: mGreyColor,
          child: ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: topicList.length,
            itemBuilder: (_, index) {
              MTopicModel data = topicList[index];
              return Container(
                padding: EdgeInsets.all(8),
                child: Text(data.title!, style: boldTextStyle(size: 16, color: mLimeColor)),
              ).onTap(() {
                MAudioArticlesScreen(appBarTitle: data.title).launch(context);
              });
            },
          ),
        ),
      ),
    );
  }
}
