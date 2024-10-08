import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/integrations/models/follower_model.dart';
import 'package:access_maketicket/integrations/network/rest_apis.dart';
import 'package:access_maketicket/integrations/utils/common.dart';
import 'package:access_maketicket/main.dart';
import 'package:access_maketicket/main/utils/AppWidget.dart';

class GETMethodExampleScreen extends StatefulWidget {
  static String tag = '/api_get_method_example';

  final bool isDirect;

  GETMethodExampleScreen({this.isDirect = false});

  @override
  GETMethodExampleScreenState createState() => GETMethodExampleScreenState();
}

class GETMethodExampleScreenState extends State<GETMethodExampleScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget followerList(List<FollowerModel> data) {
      return ListView.builder(
        itemCount: data.length,
        shrinkWrap: true,
        padding: EdgeInsets.fromLTRB(8, 8, 8, 70),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            decoration: boxDecorationRoundedWithShadow(8, backgroundColor: appStore.appBarColor!),
            child: Row(
              children: [
                networkImage(data[index].avatar_url, fit: BoxFit.fill, aWidth: 60, aHeight: 60).cornerRadiusWithClipRRect(50),
                10.width,
                Text(data[index].login!, style: boldTextStyle()),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: appBar(context, 'GET method', isDashboard: widget.isDirect),
      body: FutureBuilder<List<FollowerModel>>(
        future: getFollowers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text(snapshot.error as String).center();
          if (snapshot.hasData) return followerList(snapshot.data!);
          return loadingWidgetMaker().center();
        },
      ),
    );
  }
}
