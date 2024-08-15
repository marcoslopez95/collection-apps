import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/components/app_scaffold.dart';

import '../../../../../main.dart';
import '../../../utils/colors.dart';
import '../../../utils/image.dart';
import 'forgot_pass_controller.dart';
import 'forgot_pass_pin.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final ForgotPasswordController controller = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('Forgot Password'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Image.network(imageRemoveforgotpass, height: Get.height * 0.3)),
            16.height,
            Text(
              'Select which contact details should we use to reset your password',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Column(
              children: List.generate(
                controller.options.length,
                (index) {
                  return Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.selectedOptionIndex.value = index;
                        print(controller.selectedOptionIndex.value = index);
                      },
                      child: Container(
                        height: Get.height * 0.12,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: context.cardColor,
                          border: Border.all(
                            color: controller.selectedOptionIndex.value == index ? poteaPrimaryColor : grey,
                            width: controller.selectedOptionIndex.value == index ? Get.width * 0.005 : Get.width * 0.001,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              child: Image.network(controller.options[index].Image, height: 20, color: poteaPrimaryColor),
                              backgroundColor: appStore.isDarkModeOn ? darkFocusedColor : lightFocusedColor,
                              radius: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.options[index].text, style: TextStyle(fontSize: 14, color: grey)),
                                SizedBox(height: Get.height * 0.006),
                                Text(controller.options[index].inputText, style: TextStyle(fontSize: 14)),
                              ],
                            ).paddingOnly(left: Get.width * 0.020, right: Get.width * 0.08, bottom: Get.height * 0.024, top: Get.height * 0.024),
                          ],
                        ).paddingSymmetric(horizontal: 16),
                      ),
                    ),
                  );
                },
              ),
            ),
            40.height,
            AppButton(
              width: Get.width,
              height: Get.height * 0.02,
              color: poteaPrimaryColor,
              shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              onTap: () {
                Get.to(() => ForgotPassPin());
              },
              child: Text(
                'Continue',
                style: TextStyle(fontSize: 16, color: white),
              ),
            ),
          ],
        ).paddingAll(Get.height * 0.03),
      ),
    );
  }
}
