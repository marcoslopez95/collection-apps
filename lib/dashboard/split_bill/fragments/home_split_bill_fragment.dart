import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:access_maketicket/dashboard/split_bill/component/nearby_split_component.dart';
import 'package:access_maketicket/dashboard/split_bill/component/split_with_component.dart';
import 'package:access_maketicket/dashboard/split_bill/model/split_bill_info_model.dart';
import 'package:access_maketicket/dashboard/split_bill/utils/colors.dart';
import 'package:access_maketicket/dashboard/split_bill/utils/common.dart';
import 'package:access_maketicket/dashboard/split_bill/utils/constant.dart';
import 'package:access_maketicket/dashboard/split_bill/utils/images.dart';
import 'package:access_maketicket/main.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/main/screens/ProKitLauncher.dart';

class HomeSplitBillFragment extends StatefulWidget {
  final bool isDirect;

  HomeSplitBillFragment({this.isDirect = false});

  @override
  _HomeSplitBillFragmentState createState() => _HomeSplitBillFragmentState();
}

class _HomeSplitBillFragmentState extends State<HomeSplitBillFragment> {
  List<SplitBillInfoModel> splitModelInfo = getSplitWithList();
  List<SplitBillInfoModel> splitNearbyFriendsInfo = getNearbyFriendsList();
  List<SplitBillInfoModel> recentSplitIconInfo = getRecentSplitIconList();
  List<SplitBillInfoModel> recentSplitInfo = getRecentSplitList();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(gradient: appStore.isDarkModeOn ? primarySplitBillLinearGradient() : primarySplitBillLightGradient()),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (widget.isDirect.validate()) {
                            ProKitLauncher().launch(context, isNewTask: true, pageRouteAnimation: PageRouteAnimation.Fade);
                          } else {
                            finish(context);
                          }
                        },
                        visualDensity: VisualDensity.compact,
                        icon: Icon(Icons.arrow_back),
                      ),
                      8.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hi,Tushaar', style: primaryTextStyle(color: Colors.white)),
                          6.height,
                          Text('Splitter Your Bill', style: boldTextStyle(size: 18, color: Colors.white)),
                        ],
                      ).expand(),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: appStore.isDarkModeOn ? containerColor : Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: radius(10),
                        ),
                        child: Image.asset(ic_man, height: 24, width: 24),
                      ),
                    ],
                  ),
                  30.height,
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: appStore.isDarkModeOn ? containerColor : context.cardColor,
                      shape: BoxShape.rectangle,
                      borderRadius: radius(DEFAULT_RADIUS),
                    ),
                    child: SplitWithComponent(splitModelInfo: splitModelInfo),
                  ),
                  30.height,
                  Container(
                    decoration: BoxDecoration(
                      color: appStore.isDarkModeOn ? containerColor : context.cardColor,
                      shape: BoxShape.rectangle,
                      borderRadius: radius(10),
                    ),
                    child: NearbySplitComponent(
                      splitNearbyFriendsInfo: splitNearbyFriendsInfo,
                      recentSplitIconInfo: recentSplitIconInfo,
                      recentSplitInfo: recentSplitInfo,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
