import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/main.dart';
import 'package:access_maketicket/main/utils/AppColors.dart';
import 'package:access_maketicket/main/utils/AppWidget.dart';

class CWButtonScreen extends StatefulWidget {
  static String tag = '/button_screen';

  @override
  CWButtonScreenState createState() => CWButtonScreenState();
}

class CWButtonScreenState extends State<CWButtonScreen> {
  Color one = getColorFromHex('#DB7093');

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
    return Scaffold(
      appBar: appBar(context, 'Cupertino button'),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            16.height,
            Container(
              width: context.width(),
              child: CupertinoButton(
                child: Text('Default Button', style: primaryTextStyle(color: appStore.textPrimaryColor, size: 18)),
                onPressed: () {
                  toasty(context, 'Default Button');
                },
              ).paddingAll(8.0),
            ),
            Container(
              width: context.width(),
              decoration: BoxDecoration(border: Border.all(color: appColorPrimary, width: 1.5), borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: CupertinoButton(
                child: Text('Button with Border', style: primaryTextStyle(color: getColorFromHex('#8998FF'), size: 18)),
                onPressed: () {
                  toasty(context, 'Button with Border');
                },
              ),
            ).paddingAll(8.0),
            Container(
              width: context.width(),
              padding: EdgeInsets.all(8.0),
              child: CupertinoButton(
                child: Text('Button with Color', style: primaryTextStyle(color: white, size: 18)),
                onPressed: () {
                  toasty(context, 'Button with Color');
                },
                color: getColorFromHex('#8998FF'),
              ),
            ),
            Container(
              width: context.width(),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [getColorFromHex('#8998FF'), getColorFromHex('#75D7D3')],
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: CupertinoButton(
                child: Text('Button with Gradient', style: primaryTextStyle(color: white, size: 18)),
                onPressed: () {
                  toasty(context, 'Button with Gradient');
                },
              ),
            ).paddingAll(8.0),
            Container(
              width: context.width(),
              padding: EdgeInsets.all(8.0),
              child: CupertinoButton(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Text('Circular Button', style: primaryTextStyle(color: white, size: 18)),
                onPressed: () {
                  toasty(context, 'Circular Button');
                },
                color: getColorFromHex('#f2866c'),
              ),
            ),
            Container(
              width: context.width(),
              decoration: BoxDecoration(color: getColorFromHex('#DB7093'), border: Border.all(width: 2, color: appStore.iconColor!), borderRadius: BorderRadius.all(Radius.circular(30))),
              child: CupertinoButton(
                disabledColor: getColorFromHex('#DB7093'),
                child: Text('Circular button with custom border color', style: primaryTextStyle(color: white, size: 18)),
                onPressed: () {
                  toasty(context, 'Circular button with custom border color');
                },
                // color: getColorFromHex('#f2866c'),
              ),
            ).paddingAll(8),
            Container(
              width: context.width(),
              padding: EdgeInsets.all(8.0),
              child: CupertinoButton(
                child: Text('Disable Button', style: primaryTextStyle(size: 18)),
                onPressed: null,
                disabledColor: Colors.black38,
                color: getColorFromHex('#8998FF'),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
