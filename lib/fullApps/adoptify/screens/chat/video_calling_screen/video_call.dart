import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/adoptify/components/appscaffold.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

import '../../../utils/color.dart';

class VideoCallscreen extends StatelessWidget {
  final String? image;
  final String? name;

  const VideoCallscreen({super.key, this.name, this.image});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hideAppBar: true,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: Image(
              image: NetworkImage("${BaseUrl}/images/adoptify/call/women.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ).paddingTop(Get.height * 0.06),
          Positioned(
            top: Get.height * 0.65,
            bottom: Get.height * 0.15,
            left: Get.width * 0.05,
            right: Get.width * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    LimitedBox(
                      maxWidth: Get.width * 0.5,
                      child: Text(
                        name ?? "",
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: primaryTextStyle(color: white, size: 30, weight: FontWeight.bold),
                      ),
                    ),
                    20.height,
                    Text(
                      "06:25 minutes",
                      style: secondaryTextStyle(
                        color: white,
                        size: 18,
                      ),
                    )
                  ],
                ),
                10.width,
                Container(
                  height: Get.height * 0.2,
                  width: Get.width * 0.3,
                  decoration: BoxDecoration(color: adoptifyPrimaryColor),
                  child: Stack(
                    children: [
                      Container(
                        height: Get.height * 0.2,
                        // width: Get.width * 0.2,
                        child: Image(
                          image: NetworkImage("${BaseUrl}/images/adoptify/call/men.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: Get.height * 0.15,
                        bottom: Get.height * 0.001,
                        left: Get.width * 0.16,
                        child: Container(
                          height: 50,
                          child: Image(
                            image: NetworkImage("${BaseUrl}/images/adoptify/call/switch-camera.png"),
                            color: white,
                            height: 20,
                          ).paddingAll(Get.height * 0.005),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: Get.height * 0.87,
            bottom: Get.height * 0.03,
            left: Get.width * 0.06,
            right: Get.width * 0.06,
            child: Container(
              // color: redColor,
              width: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(color: whiteColor.withOpacity(0.4), shape: BoxShape.circle),
                    child: Image(
                      image: NetworkImage("${BaseUrl}/images/adoptify/call/volume.png"),
                      color: white,
                      height: 30,
                    ).paddingAll(Get.height * 0.015),
                  ),
                  Container(
                    decoration: BoxDecoration(color: whiteColor.withOpacity(0.4), shape: BoxShape.circle),
                    child: Image(
                      image: NetworkImage("${BaseUrl}/images/adoptify/call/cam-recorder.png"),
                      color: white,
                      height: 30,
                    ).paddingAll(Get.height * 0.015),
                  ),
                  Container(
                    decoration: BoxDecoration(color: whiteColor.withOpacity(0.4), shape: BoxShape.circle),
                    child: Image(
                      image: NetworkImage("${BaseUrl}/images/adoptify/call/mic.png"),
                      color: white,
                      height: 30,
                    ).paddingAll(Get.height * 0.015),
                  ),
                  Container(
                    decoration: BoxDecoration(color: cancelStatusColor, shape: BoxShape.circle),
                    child: Image(
                      image: NetworkImage("${BaseUrl}/images/adoptify/call/decline.png"),
                      color: white,
                      height: 30,
                    ).paddingAll(Get.height * 0.015),
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
