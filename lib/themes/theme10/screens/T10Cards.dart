import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/main/utils/AppWidget.dart';
import 'package:access_maketicket/themes/theme10/models/T10Models.dart';
import 'package:access_maketicket/themes/theme10/utils/T10Colors.dart';
import 'package:access_maketicket/themes/theme10/utils/T10Constant.dart';
import 'package:access_maketicket/themes/theme10/utils/T10DataGenerator.dart';
import 'package:access_maketicket/themes/theme10/utils/T10Strings.dart';
import 'package:access_maketicket/themes/theme10/utils/T10Widget.dart';

import '../../../main.dart';

class T10Cards extends StatefulWidget {
  static String tag = '/T10Cards';

  @override
  T10CardsState createState() => T10CardsState();
}

class T10CardsState extends State<T10Cards> {
  late List<T10Product> mList;

  @override
  void initState() {
    super.initState();
    mList = getProducts();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            T10TopBar(theme10_title_cards),
            16.height,
            ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: mList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ProductList(mList[index], index);
                }),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ProductList extends StatelessWidget {
  late T10Product model;

  ProductList(T10Product model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = context.width();
    return Container(
      decoration: boxDecoration(showShadow: true, radius: spacing_middle, bgColor: context.scaffoldBackgroundColor),
      padding: EdgeInsets.all(spacing_standard),
      margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, bottom: spacing_standard_new),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(spacing_middle)),
              child: CachedNetworkImage(
                placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                imageUrl: model.img,
                fit: BoxFit.fill,
                height: width * 0.2,
              ),
            ),
          ),
          SizedBox(width: spacing_standard_new),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    text(model.name, textColor: appStore.textPrimaryColor, fontFamily: fontMedium),
                  ],
                ),
                text(model.category, textColor: t10_textColorSecondary),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        text(model.price, textColor: appStore.textSecondaryColor),
                        SizedBox(width: spacing_control),
                        text(model.subPrice, textColor: appStore.textSecondaryColor, lineThrough: true),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.remove_circle, color: t10_textColorSecondary, size: 20),
                        SizedBox(width: 4),
                        text("2", textColor: appStore.textSecondaryColor, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
                        SizedBox(width: 4),
                        Icon(Icons.add_circle, color: t10_textColorSecondary, size: 20)
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
