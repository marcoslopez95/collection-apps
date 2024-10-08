import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/integrations/screens/firebaseCrud/FAddUserScreen.dart';
import 'package:access_maketicket/integrations/screens/firebaseCrud/FirebaseUserService.dart';
import 'package:access_maketicket/integrations/screens/firebaseCrud/model/FBusermodel.dart';
import 'package:access_maketicket/main.dart';
import 'package:access_maketicket/main/utils/AppColors.dart';
import 'package:access_maketicket/main/utils/AppWidget.dart';

FirebaseUserService userService = FirebaseUserService();

class FUserListScreen extends StatefulWidget {
  static String tag = '/firebase_user_list';
  final bool isDirect;

  FUserListScreen({this.isDirect = false});

  @override
  _FUserListScreenState createState() => _FUserListScreenState();
}

class _FUserListScreenState extends State<FUserListScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(appStore.appBarColor!);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    setStatusBarColor(context.scaffoldBackgroundColor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'Firebase User List', isDashboard: widget.isDirect),
        body: StreamBuilder<List<FBUserModel>>(
          stream: userService.getData(),
          builder: (context, snap) {
            if (snap.hasData) {
              if (snap.data!.isEmpty) {
                return Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("images/integrations/img/no_data_found.png", height: 150, fit: BoxFit.cover),
                      16.height,
                      Text("No User Found", style: boldTextStyle()),
                    ],
                  ),
                ).center();
              }

              return ListView.builder(
                padding: EdgeInsets.only(bottom: 80, top: 8, left: 8, right: 8),
                itemCount: snap.data!.length,
                shrinkWrap: true,
                itemBuilder: (_, int index) {
                  FBUserModel data = snap.data![index];

                  return SettingItemWidget(
                    padding: EdgeInsets.all(16),
                    decoration: boxDecorationDefault(color: context.cardColor),
                    onTap: () {
                      FAddUserScreen(data: data).launch(context);
                    },
                    title: data.name.validate(),
                    subTitle: data.email,
                    trailing: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: appColorPrimary),
                      child: Text(data.age.validate().toString(), style: primaryTextStyle(color: white)),
                    ),
                    subTitleTextStyle: secondaryTextStyle(size: 14),
                    titleTextStyle: boldTextStyle(size: 18),
                  ).paddingSymmetric(vertical: 4, horizontal: 8);
                },
              );
            }
            return snapWidgetHelper(snap);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            FAddUserScreen().launch(context);
          },
          backgroundColor: appStore.appBarColor,
          child: Icon(Icons.add, color: appColorPrimary, size: 32),
        ),
      ),
    );
  }
}
