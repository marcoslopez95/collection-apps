import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/adoptify/components/appscaffold.dart';

import '../../../../../main.dart';
import '../../../utils/color.dart';

class BlogDetailScreen extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? date;
  final String? time;
  final String? image;
  final String? paragraph;
  final String? summary;
  final String? content;
  final String? text;
  final String? text2;
  final String? text3;
  final String? text4;
  final String? text5;
  final String? text6;
  final String? text7;
  final String? text8;

  const BlogDetailScreen({this.title, this.subtitle, this.date, this.time, this.image, this.paragraph, this.summary, this.content, this.text, this.text2, this.text3, this.text4, this.text5, this.text6, this.text7, this.text8});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text("Blog Detail"),
      body: SingleChildScrollView(
        child: Observer(builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? "",
                style: TextStyle(color: adoptifyPrimaryColor, fontSize: 12, fontStyle: FontStyle.italic),
              ).paddingOnly(left: 16, right: 16, bottom: 10),
              Text(
                subtitle ?? "",
                style: TextStyle(color: appStore.isDarkModeOn ? white : black, fontSize: 18, fontWeight: FontWeight.bold),
              ).paddingOnly(left: 16, right: 16, bottom: 10),
              Row(
                children: [
                  Text(
                    date ?? "",
                    style: TextStyle(color: grey, fontSize: 12),
                  ),
                  Spacer(),
                  Text(
                    "Read Time : ${time ?? ""}",
                    style: TextStyle(color: grey, fontSize: 12),
                  )
                ],
              ).paddingOnly(left: 16, right: 16, bottom: 10),
              Hero(
                tag: image ?? "",
                child: Container(
                  width: double.infinity,
                  child: Image(
                    image: NetworkImage(image ?? ""),
                    fit: BoxFit.cover,
                  ),
                ).paddingOnly(bottom: 10),
              ),
              Text(
                paragraph ?? "",
                style: TextStyle(color: appStore.isDarkModeOn ? white : black, fontSize: 16),
              ).paddingOnly(left: 16, right: 16, bottom: 15),
              Text(summary ?? "", style: TextStyle(color: appStore.isDarkModeOn ? white : black, fontSize: 18, fontWeight: FontWeight.bold)).paddingOnly(left: 16, right: 16, bottom: 15),
              Text(
                content ?? "",
                style: TextStyle(color: appStore.isDarkModeOn ? white : black),
              ).paddingOnly(left: 16, right: 16, bottom: 15),
              Text(
                text ?? "",
                style: TextStyle(
                  color: appStore.isDarkModeOn ? white : black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ).paddingOnly(left: 16, right: 16, bottom: 15),
              Text(
                text2 ?? "",
                style: TextStyle(color: appStore.isDarkModeOn ? white : black, fontSize: 16),
              ).paddingOnly(left: 16, right: 16, bottom: 100),
            ],
          );
        }),
      ),
    );
  }
}
