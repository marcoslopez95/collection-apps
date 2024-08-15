import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/beautyMaster/models/BMCommonCardModel.dart';
import 'package:access_maketicket/fullApps/beautyMaster/utils/BMBottomSheet.dart';
import 'package:access_maketicket/fullApps/beautyMaster/utils/BMColors.dart';
import 'package:access_maketicket/main/utils/AppConstant.dart';
import 'package:access_maketicket/fullApps/beautyMaster/utils/BMCommonWidgets.dart';

class BMSinglePortfolioScreen extends StatefulWidget {
  BMCommonCardModel element;

  BMSinglePortfolioScreen({required this.element});

  @override
  _BMSinglePortfolioScreenState createState() => _BMSinglePortfolioScreenState();
}

class _BMSinglePortfolioScreenState extends State<BMSinglePortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(widget.element.image), fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: bmCommonCachedNetworkImage('$BaseUrl/images/beauty_master/x.png', height: 16, fit: BoxFit.cover, color: bmPrimaryColor),
            decoration: BoxDecoration(
              borderRadius: radius(100),
              color: context.cardColor,
            ),
            padding: EdgeInsets.all(12),
          ).onTap(() {
            finish(context);
          }),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.element.title, style: boldTextStyle(color: Colors.white, size: 20)),
                  4.height,
                  Text(widget.element.subtitle!, style: secondaryTextStyle(color: Colors.white, size: 12)),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: widget.element.liked! ? Icon(Icons.favorite, color: bmPrimaryColor) : Icon(Icons.favorite_outline, color: bmPrimaryColor),
                    decoration: BoxDecoration(
                      borderRadius: radius(100),
                      color: context.cardColor,
                    ),
                    padding: EdgeInsets.all(8),
                  ).onTap(() {
                    widget.element.liked = !widget.element.liked!;
                    setState(() {});
                  }, borderRadius: radius(100)),
                  8.height,
                  Text(widget.element.likes!, style: secondaryTextStyle(color: Colors.white, size: 12)),
                  20.height,
                  Container(
                    child: Image.asset('images/beauty_master/chat.png', height: 16, fit: BoxFit.cover, color: bmPrimaryColor),
                    decoration: BoxDecoration(
                      borderRadius: radius(100),
                      color: context.cardColor,
                    ),
                    padding: EdgeInsets.all(12),
                  ).onTap(() {
                    showCommentBottomSheet(context);
                  }, borderRadius: radius(100)),
                  8.height,
                  Text(widget.element.comments!, style: secondaryTextStyle(color: Colors.white, size: 12)),
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
