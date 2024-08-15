import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/adoptify/components/appscaffold.dart';
import 'package:access_maketicket/main/utils/AppConstant.dart';

import '../../../utils/color.dart';

class Callscreen extends StatelessWidget {
  final String? image;
  final String? name;

  const Callscreen({super.key, this.name, this.image});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hideAppBar: true,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: Image(
              image: NetworkImage("${BaseUrl}/images/adoptify/call/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back, size: 30),
          ).paddingTop(Get.height * 0.06),
          Positioned(
            top: Get.height * 0.2,
            bottom: Get.height * 0.2,
            left: Get.width * 0.27,
            right: Get.width * 0.29,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundColor: adoptifyPrimaryColor,
                  backgroundImage: NetworkImage(image ?? ""),
                ),
                30.height,
                Text(
                  name ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: white, fontSize: 30, fontWeight: FontWeight.bold),
                ),
                20.height,
                Text(
                  "06:25 minutes",
                  style: TextStyle(
                    color: white,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: Get.height * 0.8,
            bottom: Get.height * 0.1,
            left: Get.width * 0.07,
            right: Get.width * 0.07,
            child: Container(
              // color: redColor,
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(color: whiteColor.withOpacity(0.3), shape: BoxShape.circle),
                    child: Image(
                      image: NetworkImage("${BaseUrl}/images/adoptify/call/volume.png"),
                      color: white,
                      height: 20,
                    ).paddingAll(Get.height * 0.03),
                  ),
                  Container(
                    decoration: BoxDecoration(color: whiteColor.withOpacity(0.3), shape: BoxShape.circle),
                    child: Image(
                      image: NetworkImage("${BaseUrl}/images/adoptify/call/mic.png"),
                      color: white,
                      height: 30,
                    ).paddingAll(Get.height * 0.03),
                  ),
                  Container(
                    decoration: BoxDecoration(color: cancelStatusColor, shape: BoxShape.circle),
                    child: Image(
                      image: NetworkImage("${BaseUrl}/images/adoptify/call/decline.png"),
                      color: white,
                      height: 30,
                    ).paddingAll(Get.height * 0.03),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
