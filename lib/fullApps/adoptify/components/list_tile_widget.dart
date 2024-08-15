import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/main/utils/AppConstant.dart';

import '../../../main.dart';
import '../utils/color.dart';

class ListTileWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool isDelete;
  final VoidCallback? onTap;

  ListTileWidget({
    Key? key,
    required this.title,
    this.subtitle,
    this.isDelete = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        title: Text(
          title,
          style: primaryTextStyle(
            size: 16,
            color: isDelete ? cancelStatusColor : (appStore.isDarkModeOn ? white : black),
            weight: FontWeight.bold,
          ),
        ).paddingBottom(5),
        subtitle: Text(
          subtitle ?? "",
          style: secondaryTextStyle(
            size: 14,
            color: appStore.isDarkModeOn ? Colors.white54 : Colors.black54,
          ),
        ),
        trailing: Image(
          image: NetworkImage("${BaseUrl}/images/adoptify/icons/next.png"),
          height: 20,
          color: appStore.isDarkModeOn ? white : black,
        ),
        onTap: onTap,
      );
    });
  }
}
