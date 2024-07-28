import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/adoptify/components/appscaffold.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

import '../../../../../../generated/assets.dart';
import '../../../../../../main.dart';
import '../../../../utils/color.dart';
import '../../../dashbord/dashboard.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return AppScaffold(
          hasLeadingWidget: false,
          body: Stack(
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: NetworkImage("${BaseUrl}/images/adoptify/icons/success.png"),
                      height: 200,
                    ),
                    20.height,
                    Text(
                      "You're All Set!",
                      style: primaryTextStyle(weight: FontWeight.bold, size: 30, color: appStore.isDarkModeOn ? white : black),
                    ),
                    10.height,
                    Text(
                      "Your password has been successfully changed.",
                      textAlign: TextAlign.center,
                      style: secondaryTextStyle(size: 20, color: appStore.isDarkModeOn ? Colors.white38 : Colors.black45),
                    ),
                  ],
                ).paddingSymmetric(vertical: 150, horizontal: 16),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
                    child: AppButton(
                      elevation: 0,
                      text: "Go to Homepage",
                      textStyle: primaryTextStyle(size: 20, weight: FontWeight.bold, color: white),
                      color: adoptifyPrimaryColor,
                      shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      onTap: () {
                        Get.to(() => Dashboard());
                      },
                    ).paddingSymmetric(vertical: 30, horizontal: 16)),
              ),
            ],
          ),
        );
      }
    );
  }
}
