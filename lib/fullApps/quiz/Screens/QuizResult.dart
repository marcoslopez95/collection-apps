import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/quiz/utils/QuizColors.dart';
import 'package:access_maketicket/fullApps/quiz/utils/QuizConstant.dart';
import 'package:access_maketicket/fullApps/quiz/utils/QuizImages.dart';
import 'package:access_maketicket/main/utils/AppWidget.dart';
import 'package:access_maketicket/main/utils/percent_indicator/circular_percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class QuizResult extends StatefulWidget {
  static String tag = '/QuizResult';

  const QuizResult({
    Key? key,
  }) : super(key: key);

  @override
  _QuizResultState createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.height(),
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 8),
                alignment: Alignment.centerLeft,
                width: context.width(),
                height: 50,
                child: IconButton(
                  icon: Icon(Icons.close, color: quiz_icon_color),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Container(
                height: context.height(),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularPercentIndicator(
                      radius: 190.0,
                      lineWidth: 10.0,
                      animation: true,
                      arcType: ArcType.FULL,
                      percent: 1.0,
                      backgroundColor: quiz_view_color,
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          text("100", fontSize: 20.0, fontFamily: fontBold),
                          text("5 out 5", textColor: quiz_textColorSecondary),
                        ],
                      ),
                      footer: Container(
                        transform: Matrix4.translationValues(0.0, -30.0, 0.0),
                        decoration: boxDecoration(showShadow: true, bgColor: context.cardColor, radius: 8),
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: new Text("+50 XP", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0)),
                      ),
                      progressColor: quiz_colorAccent,
                    ),
                    text("You are awesome!", fontFamily: fontMedium, fontSize: textSizeLargeMedium),
                    text("Congratulations for getting\nall the answer correct!", isLongText: true, textColor: quiz_textColorSecondary),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(16),
                      width: context.width() * 0.15,
                      height: context.width() * 0.15,
                      decoration: boxDecoration(radius: 10, bgColor: quiz_color_facebook, showShadow: true),
                      child: Padding(padding: EdgeInsets.all(10.0), child: SvgPicture.asset(quiz_ic_facebook, color: quiz_white)),
                    ).onTap(() {
                      const url = 'https://www.facebook.com/';
                      // ignore: unnecessary_null_comparison
                      if (canLaunch(url) != null) {
                        launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }),
                    Container(
                      margin: EdgeInsets.all(16),
                      width: context.width() * 0.15,
                      height: context.width() * 0.15,
                      decoration: boxDecoration(radius: 10, bgColor: quiz_form_google, showShadow: true),
                      child: Padding(padding: EdgeInsets.all(10.0), child: SvgPicture.asset(quiz_ic_google, color: quiz_white)),
                    ).onTap(() {
                      const url = 'https://www.google.com/';
                      // ignore: unnecessary_null_comparison
                      if (canLaunch(url) != null) {
                        launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }),
                    Container(
                      margin: EdgeInsets.all(16),
                      width: context.width() * 0.15,
                      height: context.width() * 0.15,
                      decoration: boxDecoration(radius: 10, bgColor: quiz_color_message, showShadow: true),
                      child: Padding(padding: EdgeInsets.all(10.0), child: SvgPicture.asset(quiz_ic_mail, color: quiz_white)),
                    ).onTap(() {
                      const url = 'https://mail.google.com/';
                      // ignore: unnecessary_null_comparison
                      if (canLaunch(url) != null) {
                        launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }),
                    Container(
                      margin: EdgeInsets.all(16),
                      width: context.width() * 0.15,
                      height: context.width() * 0.15,
                      decoration: boxDecoration(radius: 10, bgColor: quiz_color_twitter, showShadow: true),
                      child: Padding(padding: EdgeInsets.all(10.0), child: SvgPicture.asset(quiz_ic_twitter, color: quiz_white)),
                    ).onTap(() {
                      print("https://twitter.com/");
                      const url = 'https://twitter.com/';
                      // ignore: unnecessary_null_comparison
                      if (canLaunch(url) != null) {
                        launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
