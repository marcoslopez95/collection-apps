import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/shopHop/utils/ShColors.dart';
import 'package:access_maketicket/fullApps/shopHop/utils/ShConstant.dart';
import 'package:access_maketicket/fullApps/shopHop/utils/ShStrings.dart';
import 'package:access_maketicket/fullApps/shopHop/utils/ShWidget.dart';
import 'package:access_maketicket/main.dart';

class ShFAQScreen extends StatefulWidget {
  static String tag = '/ShFAQScreen';

  @override
  ShFAQScreenState createState() => ShFAQScreenState();
}

class ShFAQScreenState extends State<ShFAQScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sh_lbl_faq, style: boldTextStyle(size: 18)),
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : sh_textColorPrimary),
        actionsIconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : sh_colorPrimary),
        actions: <Widget>[
          cartIcon(context, 3),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          ExpansionTile(
            title: getTitle(sh_lbl_account_deactivate),
            children: <Widget>[
              Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      getSubTitle(sh_lbl_account_deactivate),
                      getSubTitle(sh_lbl_quick_pay),
                      getSubTitle(sh_lbl_return_items),
                      getSubTitle(sh_lbl_replace_items),
                    ],
                  )),
            ],
          ),
          ExpansionTile(
            title: getTitle(sh_lbl_quick_pay),
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    getSubTitle(sh_lbl_account_deactivate),
                    getSubTitle(sh_lbl_quick_pay),
                    getSubTitle(sh_lbl_return_items),
                    getSubTitle(sh_lbl_replace_items),
                  ],
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: getTitle(sh_lbl_return_items),
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    getSubTitle(sh_lbl_account_deactivate),
                    getSubTitle(sh_lbl_quick_pay),
                    getSubTitle(sh_lbl_return_items),
                    getSubTitle(sh_lbl_replace_items),
                  ],
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: getTitle(sh_lbl_replace_items),
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    getSubTitle(sh_lbl_account_deactivate),
                    getSubTitle(sh_lbl_quick_pay),
                    getSubTitle(sh_lbl_return_items),
                    getSubTitle(sh_lbl_replace_items),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getTitle(String content) {
    return Text(content, style: primaryTextStyle());
  }

  Widget getSubTitle(String content) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.0, spacing_standard, 16.0, spacing_standard),
      child: Text(content, style: secondaryTextStyle()),
    );
  }
}
