import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/adoptify/walkthrough/walkthrough.dart';
import 'package:access_maketicket/main/utils/AppConstant.dart';

import '../../../generated/assets.dart';
import '../components/adoptify_loader.dart';
import '../utils/color.dart';

class AdoptifySplashscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Get.off(() => WalkThrough());
    });
    return Scaffold(
      backgroundColor: adoptifyPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            200.height,
            Image.network(
              "${BaseUrl}/images/adoptify/image/adoptify.png",
              height: Get.height * 0.2,
            ),
            30.height,
            Text(
              'Adoptify',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w600,
                // ignore: deprecated_member_use
              ),
            ).paddingBottom(Get.height * 0.2),
            LoaderWidget(color: white)
          ],
        ),
      ),
    );
  }
}
