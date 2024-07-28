import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/adoptify/walkthrough/walkthrough_controller.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../generated/assets.dart';
import '../../../main.dart';
import '../screens/auth/option_screen/option.dart';
import '../utils/color.dart';

class WalkThrough extends StatelessWidget {
  final _controller = Get.put(WalkThroughController());
  final slider = appStore.isDarkModeOn ? Colors.white54 : Colors.black54;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => PageView.builder(
              controller: _controller.pageController,
              onPageChanged: (index) {
                _controller.selectedPageIndex.value = index;
              },
              itemCount: _controller.walkthrough.length,
              itemBuilder: (context, index) {
                final walkthroughItem = _controller.walkthrough[index];

                return Observer(
                  builder: (context) {
                    return Container(
                      color: adoptifyPrimaryColor,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Observer(builder: (context) {
                              return Image(
                                image: NetworkImage(appStore.isDarkModeOn ? walkthroughItem.darkImage.validate() : walkthroughItem.lightImage.validate()),
                                fit: BoxFit.cover,
                              );
                            }),
                          ),
                          Positioned(
                            top: Get.height * 0.50,
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Stack(
                              children: [
                                Container(
                                  height: 600,
                                  width: double.infinity,
                                  child: Observer(builder: (context) {
                                    return Image(
                                      image: appStore.isDarkModeOn ? NetworkImage("${BaseUrl}/images/adoptify/walkthrough/DC.png") : NetworkImage("${BaseUrl}/images/adoptify/walkthrough/LC.png"),
                                      fit: BoxFit.fill,
                                    );
                                  }),
                                ),
                                Positioned(
                                  top: Get.height * 0.093,
                                  right: Get.width * 0.01,
                                  left: Get.width * 0.01,
                                  bottom: Get.height * 0.22,
                                  child: Observer(builder: (context) {
                                    return Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          walkthroughItem.title ?? "",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          ),
                                        ).paddingSymmetric(horizontal: Get.width * 0.04),
                                        30.height,
                                        Text(
                                          walkthroughItem.description ?? "",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: appStore.isDarkModeOn ? Colors.white : Colors.black38,
                                          ),
                                        ).paddingSymmetric(horizontal: Get.width * 0.04),
                                      ],
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                );
              },
            ),
          ),
          Observer(
            builder: (context) {
              return Positioned(
                top: Get.height * 0.81,
                bottom: Get.height * 0.17,
                left: Get.width * 0.42,
                right: Get.width * 0.42,
                child: Obx(
                  () => SmoothPageIndicator(
                    controller: _controller.pageController,
                    count: _controller.walkthrough.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: adoptifyPrimaryColor,
                      dotColor: appStore.isDarkModeOn ? Color.fromARGB(137, 50, 50, 50) : ghostWhite,
                      dotHeight: Get.height * 0.014,
                      dotWidth: Get.width * 0.025,
                    ),
                    onDotClicked: (index) {
                      _controller.pageController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 5),
                        curve: Curves.linear,
                      );
                    },
                  ),
                ),
              );
            }
          ),
          Positioned(
            top: Get.height * 0.92,
            bottom: Get.height * 0.015,
            left: Get.width * 0.08,
            right: Get.width * 0.08,
            child: Obx(
              () {
                return _controller.isLastPage
                    ? AppButton(
                        height: Get.height * 0.2,
                        width: Get.width * 0.80,
                        text: "Let's Get Started",
                        textStyle: TextStyle(fontSize: 18, color: white),
                        color: adoptifyPrimaryColor,
                        shapeBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        onTap: () {
                          Get.off(() => OptionScreen());
                        },
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Observer(
                            builder: (context) {
                              return AppButton(
                                height: Get.height * 0.2,
                                width: Get.width * 0.40,
                                elevation: 0,
                                text: "Skip",
                                textStyle: TextStyle(
                                  color: appStore.isDarkModeOn ? white : adoptifyPrimaryColor,
                                  fontSize: 18,
                                ),
                                color: appStore.isDarkModeOn ? Color(0xFF35383F) : Color(0xFFFEF7EF),
                                shapeBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                onTap: () {
                                  Get.off(() => OptionScreen());
                                },
                              );
                            }
                          ),
                          AppButton(
                            height: Get.height * 0.2,
                            width: Get.width * 0.40,
                            elevation: 0,
                            text: "Continue",
                            textStyle: TextStyle(color: white, fontSize: 18),
                            color: adoptifyPrimaryColor,
                            shapeBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            onTap: () {
                              _controller.forwardAction();
                            },
                          )
                        ],
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
