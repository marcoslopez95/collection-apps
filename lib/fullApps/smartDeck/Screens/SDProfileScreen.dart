import 'package:access_maketicket/helper.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/smartDeck/SDUtils/SDColors.dart';
import 'package:access_maketicket/fullApps/smartDeck/Screens/SDSettingScreen.dart';
import 'package:access_maketicket/integrations/screens/StickyHeader/stickyHeaderHomePage.dart';
import 'package:access_maketicket/main/utils/AppWidget.dart';
import 'package:access_maketicket/src/Model/ProfileService/QrScans.dart';
import 'package:access_maketicket/src/Model/UserAuth.dart';
import 'package:access_maketicket/src/Services/ProfileService.dart';
import 'SDEditProfileScreen.dart';

// ignore: camel_case_types
class sdPRofileScreen extends StatefulWidget {
  @override
  _sdPRofileScreenState createState() => _sdPRofileScreenState();
}

// ignore: camel_case_types
class _sdPRofileScreenState extends State<sdPRofileScreen> {
  Helper helper = Helper();
  UserAuth? _userAuth;
  List<QrScans> _QrScans = [];
  ProfileService _profileService = ProfileService();
  _generateData() {
    var taskData = [
      Task(task: 'Completed', value: 82.0, color: Colors.blue),
      Task(task: 'On going', value: 22.0, color: Colors.deepOrangeAccent),
    ];
  }

  @override
  void initState() {
    _generateData();
    changeStatusColor(sdPrimaryColor);
    super.initState();
    init();
  }

  Future<void> init() async{
    var user = await helper.getUserAuth();
    var qrScan = await _profileService.getTotalScans();
    setState((){
        _userAuth = user;
        _QrScans = qrScan;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: <Widget>[
                Container(
                  height: 320,
                  width: size.width,
                  padding: EdgeInsets.only(top: 25, right: 10),
                  color: sdPrimaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            SDSettingScreen().launch(context);
                          },
                          child: Icon(Icons.settings, color: Colors.white),
                        ),
                      ),
                      commonCacheImageWidget(
                        'https://i.insider.com/5de6dd81fd9db241b00c04d3?width=1100&format=jpeg&auto=webp',
                        80,
                        width: 80,
                        fit: BoxFit.cover,
                      ).cornerRadiusWithClipRRect(40),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Text('${_userAuth?.attributes.name ?? ''}', style: boldTextStyle(color: Colors.white)),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          '${_userAuth?.relationships?.role?.attributes.name ?? ''}',
                          style: secondaryTextStyle(size: 12, color: Colors.white.withOpacity(0.7)),
                        ),
                      ),
                      /*FittedBox(
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                          decoration: boxDecorations(radius: 4),
                          child: Center(
                            child: Text('Edit Profile', style: boldTextStyle(size: 12, color: sdPrimaryColor)),
                          ),
                        ),
                      ).onTap(() {
                        SDEditProfileScreen().launch(context);
                      })*/
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16,top: 320.00 - 50),
                  height: 600,
                  child:
                  GridView.count(
                    crossAxisCount: 2,
                    scrollDirection: Axis.vertical,
                    children: [
                      for (int index = 0;  index < _QrScans.length; index++)
                        Container(
                          margin: EdgeInsets.all(2),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('${_QrScans[index].name}', style: boldTextStyle(size: 16)),
                              8.height,
                              Text('${_QrScans[index].value ?? ''}', style: boldTextStyle(color: Colors.green.withOpacity(0.8), size: 26)),
                              8.height,
                            ],
                          ),
                        ),
                    ],
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Task {
  String? task;
  double? value;
  Color? color;

  Task({this.task, this.value, this.color});
}
