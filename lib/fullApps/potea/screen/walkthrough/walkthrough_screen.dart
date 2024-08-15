import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/components/app_scaffold.dart';
import 'package:access_maketicket/fullApps/potea/screen/walkthrough/walkthrough_screen_controller.dart';

import '../../../../main.dart';
import '../../utils/colors.dart';

class WalkthroughScreen extends StatelessWidget {
  WalkthroughScreen({super.key});

  final WalkthroughController walkthroughController = Get.put(WalkthroughController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      scaffoldBackgroundColor: context.scaffoldBackgroundColor,
      hideAppBar: true,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: walkthroughController.walkthroughDetails.length,
              controller: walkthroughController.pageController,
              onPageChanged: (int index) {
                walkthroughController.currentPage.value = index;
              },
              itemBuilder: (context, index) {
                final String? imagePath = appStore.isDarkModeOn ? walkthroughController.walkthroughDetails[index].image2 : walkthroughController.walkthroughDetails[index].image1;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width,
                      height: 400,
                      child: Image.network(
                        imagePath ?? "",
                        fit: BoxFit.cover,
                      ),
                    ),
                    16.height,
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            walkthroughController.walkthroughDetails[index].title ?? "",
                            style: TextStyle(fontSize: 30),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ).paddingSymmetric(horizontal: 16),
                  ],
                );
              },
            ),
          ),
          Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List<Widget>.generate(
                    walkthroughController.walkthroughDetails.length,
                    (index) {
                      return InkWell(
                        onTap: () {
                          walkthroughController.pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Container(
                          height: 8,
                          width: walkthroughController.currentPage.value == index ? 25 : 8,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: walkthroughController.currentPage.value == index ? poteaPrimaryColor : grey,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 50),
                walkthroughController.currentPage.value == walkthroughController.walkthroughDetails.length - 1
                    ? AppButton(
                        width: Get.width,
                        color: poteaPrimaryColor,
                        onTap: walkthroughController.handleNext,
                        child: Text('Get Started', style: TextStyle(color: white)),
                        shapeBorder: RoundedRectangleBorder(borderRadius: radius(50)),
                      )
                    : AppButton(
                        width: Get.width,
                        color: poteaPrimaryColor,
                        onTap: walkthroughController.handleNext,
                        child: Text('Next', style: TextStyle(color: white)),
                        shapeBorder: RoundedRectangleBorder(borderRadius: radius(50)),
                      ),
              ],
            ).paddingSymmetric(horizontal: 16),
          ),
          20.height,
        ],
      ),
    );
  }
}
