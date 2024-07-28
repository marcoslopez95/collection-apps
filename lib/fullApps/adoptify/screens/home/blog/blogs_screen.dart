import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../main.dart';
import '../../../utils/color.dart';
import 'blog_list.dart';
import 'blogs_controller.dart';
import 'component/blog_item.dart';

class Blogs extends StatelessWidget {
  final BlogController blogsController = Get.put(BlogController());

  Blogs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Blogs",
                style: primaryTextStyle(
                  color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                  size: 18,
                  weight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () => Get.to(() => BlogsviewAll(items: blogsController.items.toList())),
                child: Row(
                  children: [
                    Text(
                      'View All',
                      style: secondaryTextStyle(color: adoptifyPrimaryColor, size: 14, weight: FontWeight.bold),
                    ),
                    5.width,
                    Icon(Icons.arrow_right_alt, color: adoptifyPrimaryColor),
                  ],
                ),
              ),
            ],
          ).paddingOnly(left: 16),
          BlogsItem().paddingSymmetric(horizontal: 16),
        ],
      );
    });
  }
}
