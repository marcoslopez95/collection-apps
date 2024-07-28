import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/potea/components/app_scaffold.dart';

import '../../../../../main.dart';
import '../../../utils/colors.dart';
import '../../../utils/image.dart';
import '../../dashboard/dashboard.dart';
import 'fingerprint_controller.dart';

class FingarPrint extends StatelessWidget {
  final FingarPrintController fingarPrintController = Get.put(FingarPrintController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('Set Your Fingerprint'),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.1),
              Text('Add a fingerprint to make your account more secure.', style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
              Image.network(imageFingarprint, height: Get.height * 0.30),
              Text(
                'Please put your finger on the fingerprint scanner to get started.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Get.height * 0.23),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButton(
                    width: Get.width * 0.45,
                    height: Get.height * 0.02,
                    color: appStore.isDarkModeOn ? darkGrayGeneral2 : lightGreenColour,
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    onTap: () {
                      Get.to(() => DashboardScreen());
                    },
                    child: Text('Skip', style: TextStyle(fontSize: 16, color: appStore.isDarkModeOn ? white : poteaPrimaryColor)),
                  ),
                  AppButton(
                    width: Get.width * 0.45,
                    height: Get.height * 0.02,
                    color: poteaPrimaryColor,
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    onTap: () async {
                      await fingarPrintController.authentificateWithBiometrics();
                      if (fingarPrintController.isBiometric.value) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return Observer(
                              builder: (context) {
                                return AlertDialog(
                                  shape: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                  backgroundColor: appStore.isDarkModeOn ? context.cardColor : null,
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.network(imageCong),
                                      Text(
                                        'Congratulations!',
                                        style: TextStyle(fontSize: 20, color: appStore.isDarkModeOn ? white : black, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: Get.height * 0.02),
                                      Text(
                                        'Your account is ready to use. You will be redirected to the Home page in a few seconds..',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Lottie.network(lottiePoteaLoader, width: 150),
                                    ],
                                  ),
                                );
                              }
                            );
                          },
                        );
                        Future.delayed(Duration(seconds: 2), () {
                          Get.back();
                          Get.to(() => DashboardScreen());
                        });
                      } else {
                        Get.to(() => FingarPrint());
                      }
                    },
                    child: Text('Continue', style: TextStyle(fontSize: 16, color: white)),
                  ),
                ],
              ),
            ],
          ).paddingSymmetric(horizontal: 16),
        ],
      ),
    );
  }
}
