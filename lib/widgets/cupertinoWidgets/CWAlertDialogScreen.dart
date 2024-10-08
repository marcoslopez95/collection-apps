import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/main.dart';
import 'package:access_maketicket/main/model/ListModels.dart';
import 'package:access_maketicket/main/utils/AppWidget.dart';

class CWAlertDialogScreen extends StatefulWidget {
  static String tag = '/alert_dialog_screen';

  @override
  CWAlertDialogScreenState createState() => CWAlertDialogScreenState();
}

class CWAlertDialogScreenState extends State<CWAlertDialogScreen> {
  List<ListModel> example = [
    ListModel(name: 'Alert Dialog'),
    ListModel(name: 'Alert Dialog with Title'),
    ListModel(name: 'Alert Dialog with Selection'),
  ];

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
    void displayAlertDialog1() {
      showCupertinoDialog(
          context: context,
          builder: (BuildContext context) => CustomTheme(
                child: CupertinoAlertDialog(
                  title: Text(
                    'Logout?',
                    style: boldTextStyle(color: appStore.textPrimaryColor, size: 18),
                  ),
                  content: Text(
                    'Are you sure want to logout?',
                    style: secondaryTextStyle(color: appStore.textPrimaryColor, size: 16),
                  ),
                  actions: [
                    CupertinoDialogAction(
                      child: Text(
                        'Cancel',
                        style: primaryTextStyle(color: dodgerBlue, size: 18),
                      ),
                      onPressed: () {
                        toasty(context, 'Cancel');
                        finish(context);
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text(
                        'Logout',
                        style: primaryTextStyle(color: redColor, size: 18),
                      ),
                      onPressed: () {
                        toasty(context, 'Logout');
                        finish(context);
                      },
                    )
                  ],
                ),
              ));
    }

    void displayAlertDialog2() {
      showCupertinoDialog(
          context: context,
          builder: (BuildContext context) => CustomTheme(
                child: CupertinoAlertDialog(
                  title: Text(
                    'Allow "Maps to access your location while you use the app?',
                    style: boldTextStyle(color: appStore.textPrimaryColor, size: 18),
                  ),
                  content: Text(
                    'your current location will be displayed on the map and used for directions,nearby search results, and estimated travel times',
                    style: secondaryTextStyle(color: appStore.textPrimaryColor, size: 16),
                  ),
                  actions: [
                    CupertinoDialogAction(
                      child: Text(
                        'Don\'t Allow',
                        style: primaryTextStyle(color: dodgerBlue, size: 18),
                      ),
                      onPressed: () {
                        toasty(context, 'Don\'t Allow');
                        finish(context);
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text(
                        'Allow',
                        style: primaryTextStyle(color: dodgerBlue, size: 18),
                      ),
                      onPressed: () {
                        toasty(context, ' Allow');
                        finish(context);
                      },
                    )
                  ],
                ),
              ));
    }

    void displayAlertDialog3() {
      showCupertinoDialog(
          context: context,
          builder: (BuildContext context) => CustomTheme(
                child: CupertinoAlertDialog(
                  title: Text(
                    'Select favorite Desert',
                    style: boldTextStyle(color: appStore.textPrimaryColor, size: 18),
                  ),
                  actions: [
                    CupertinoDialogAction(
                      child: Text(
                        'CheeseCake',
                        style: primaryTextStyle(color: dodgerBlue, size: 18),
                      ),
                      onPressed: () {
                        toasty(context, 'CheeseCake');
                        finish(context);
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text(
                        'Chocolate Brownie',
                        style: primaryTextStyle(color: dodgerBlue, size: 18),
                      ),
                      onPressed: () {
                        toasty(context, 'Chocolate Brownie');
                        finish(context);
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text(
                        'Hazelnut',
                        style: primaryTextStyle(color: dodgerBlue, size: 18),
                      ),
                      onPressed: () {
                        toasty(context, 'Hazelnut');
                        finish(context);
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text(
                        'Apple Pie',
                        style: primaryTextStyle(color: dodgerBlue, size: 18),
                      ),
                      onPressed: () {
                        toasty(context, ' Apple Pie');
                        finish(context);
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text(
                        'Cancel',
                        style: primaryTextStyle(color: Colors.red, size: 18),
                      ),
                      onPressed: () {
                        toasty(context, 'Cancel');
                        finish(context);
                      },
                    ),
                  ],
                ),
              ));
    }

    return Scaffold(
      appBar: appBar(context, 'Cupertino Alert Dialog'),
      body: SafeArea(
          child: ListView.builder(
              itemCount: example.length,
              itemBuilder: (BuildContext context, index) {
                return ExampleItemWidget(example[index], onTap: () {
                  if (index == 0) {
                    displayAlertDialog1();
                  } else if (index == 1) {
                    displayAlertDialog2();
                  } else if (index == 2) {
                    displayAlertDialog3();
                  }
                });
              })),
    );
  }
}
