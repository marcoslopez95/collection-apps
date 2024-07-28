import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../utils/color.dart';
import '../blogs_controller.dart';
import '../blogs_detail_screen.dart';

class BlogsItem extends StatelessWidget {
  final BlogController blogsController = Get.put(BlogController());

  BlogsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Obx(
          () {
            final item = blogsController.items[index];
            return GestureDetector(
              onTap: () {
                Get.to(
                  () => BlogDetailScreen(
                    title: item.title,
                    subtitle: item.subtitle,
                    date: item.date,
                    time: item.time,
                    image: item.image,
                    paragraph: item.paragraph,
                    summary: item.summary,
                    content: item.content,
                    text: item.text,
                    text2: item.text2,
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: boxDecorationDefault(color: context.cardColor, borderRadius: radius(15)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: item.image ?? "",
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                          child: Image.network(item.image ?? "", fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        8.height,
                        Text(
                          item.title ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: secondaryTextStyle(
                            color: adoptifyPrimaryColor,
                            weight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        4.height,
                        Text(
                          item.subtitle ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: primaryTextStyle(color: Colors.grey, weight: FontWeight.bold),
                        ),
                        4.height,
                        Text(
                          item.date ?? "",
                          maxLines: 1,
                          style: secondaryTextStyle(
                            color: Colors.grey,
                            weight: FontWeight.bold,
                            size: 12,
                          ),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 16).expand(),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
