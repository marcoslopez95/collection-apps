import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/main.dart';
import 'package:access_maketicket/main/utils/AppWidget.dart';

class MWIconButtonScreen extends StatefulWidget {
  static String tag = '/icon_button_screen';

  @override
  MWIconButtonScreenState createState() => MWIconButtonScreenState();
}

class MWIconButtonScreenState extends State<MWIconButtonScreen> {
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
        appBar: appBar(context, "Icon Button"),
        body: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              Ink(
                decoration: const ShapeDecoration(
                  color: Colors.lightBlue,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.file_upload,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                  onPressed: () {
                    toasty(context, "upload");
                  },
                ),
              ),
              10.height,
              IconButton(
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.save_alt,
                    ),
                    10.width,
                    Text('Download', style: primaryTextStyle()),
                  ],
                ),
                onPressed: () {
                  toasty(context, 'download');
                },
              ),
              10.height,
              Ink(
                decoration: ShapeDecoration(
                  color: Colors.greenAccent,
                  shape: CircleBorder(side: BorderSide(width: 2, color: Colors.black)),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                  onPressed: () {
                    toasty(context, "Share");
                  },
                ),
              ),
              10.height,
              IconButton(
                icon: Icon(
                  Icons.message,
                  color: appStore.iconColor,
                ),
                iconSize: 30,
                onPressed: () {
                  toasty(context, "Message");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
