import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:access_maketicket/fullApps/grocery/utils/GroceryColors.dart';
import 'package:access_maketicket/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:access_maketicket/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:access_maketicket/main/utils/AppWidget.dart';

import 'GrocerySuccessfulVerify.dart';

class GroceryVerifyNumber extends StatefulWidget {
  static String tag = '/GroceryVerifyNumber';

  @override
  _GroceryVerifyNumberState createState() => _GroceryVerifyNumberState();
}

class _GroceryVerifyNumberState extends State<GroceryVerifyNumber> {
  late Timer _timer;
  int _start = 9;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    changeStatusColor(grocery_colorPrimary);
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: title(grocery_lbl_Verify_Number, grocery_colorPrimary, grocery_color_white, context),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: context.width(),
          decoration: boxDecorationWithRoundedCorners(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
            boxShadow: defaultBoxShadow(),
            backgroundColor: context.cardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              8.height,
              text(grocery_hint_Verify_Number, fontSize: textSizeLarge, fontFamily: fontBold).paddingOnly(top: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: text("4 digit code send to", textColor: grocery_textColorSecondary, fontSize: textSizeLargeMedium, fontFamily: fontRegular).paddingOnly(
                      left: spacing_standard_new,
                    ),
                  ),
                  Flexible(
                      child: text("+94 7187876789", textColor: grocery_textGreenColor, fontSize: textSizeLargeMedium, fontFamily: fontRegular)
                          .paddingOnly(left: spacing_standard, right: spacing_standard_new)),
                ],
              ),
              16.height,
              PinEntryTextField(
                fields: 4,
                fontSize: textSizeLargeMedium,
              ).paddingOnly(left: spacing_standard, right: spacing_standard),
              42.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _start == 0
                      ? text("Resend", textColor: grocery_textColorSecondary, fontSize: textSizeLargeMedium, fontFamily: fontMedium)
                          .paddingOnly(left: spacing_standard_new, bottom: spacing_standard_new)
                          .onTap(() {
                          startTimer();
                          _start = 9;
                          setState(() {});
                        })
                      : text("Resend in 00:0$_start s", textColor: grocery_textColorSecondary, fontSize: textSizeLargeMedium).paddingOnly(left: spacing_standard_new, bottom: spacing_standard_new),
                  FittedBox(
                    child: groceryButton(
                      textContent: grocery_lbl_Verify,
                      onPressed: (() {
                        GrocerySuccessfulVerify().launch(context);
                      }),
                    ).paddingOnly(right: spacing_standard_new, bottom: spacing_standard_new),
                  ).paddingOnly(top: spacing_standard_new, bottom: spacing_standard_new)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
