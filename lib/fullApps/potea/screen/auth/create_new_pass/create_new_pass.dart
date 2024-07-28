import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/potea/components/app_scaffold.dart';
import 'package:prokit_flutter/fullApps/potea/utils/common_base.dart';

import '../../../../../main.dart';
import '../../../utils/colors.dart';
import '../../../utils/image.dart';
import '../../dashboard/dashboard.dart';
import 'create_new_pass_controller.dart';

class CreateNewPass extends StatelessWidget {
  CreateNewPass({super.key});

  final CreateNewPassController newPassController = Get.put(CreateNewPassController());
  final GlobalKey<FormState> _createNewPassformKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('Create New Password'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(imageChangePass, height: Get.height * 0.30, width: Get.width),
            Form(
              key: _createNewPassformKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.05),
                  Text('Create Your New Password', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  SizedBox(height: Get.height * 0.04),
                  SizedBox(
                    height: 50,
                    child: Obx(
                      () => TextField(
                        obscureText: !newPassController.isPasswordVisible.value,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                          fillColor: context.cardColor,
                          filled: true,
                          prefixIcon: icPass.iconImage(fit: BoxFit.contain).paddingAll(14),
                          suffixIcon: IconButton(
                            icon: Icon(
                              newPassController.isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: newPassController.togglePasswordVisibility,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: context.cardColor,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: poteaPrimaryColor,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.03),
                  SizedBox(
                    height: 50,
                    child: Obx(
                      () => TextField(
                        obscureText: !newPassController.isConfirmPasswordVisible.value,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                          fillColor: context.cardColor,
                          filled: true,
                          prefixIcon: icPass.iconImage(fit: BoxFit.contain).paddingAll(14),
                          suffixIcon: IconButton(
                            icon: Icon(
                              newPassController.isConfirmPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                            ),
                            onPressed: newPassController.toggleConfirmPasswordVisibility,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: context.cardColor,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: poteaPrimaryColor,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  setAsPrimaryWidget().paddingSymmetric(horizontal: 60),
                  SizedBox(height: Get.height * 0.11),
                  AppButton(
                    width: Get.width,
                    height: Get.height * 0.02,
                    color: poteaPrimaryColor,
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return Observer(
                            builder: (context) {
                              return AlertDialog(
                                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.network(imageCong, height: 70, width: 70),
                                    Text('Congratulations!', style: TextStyle(fontSize: 20, color: appStore.isDarkModeOn ? white : black, fontWeight: FontWeight.bold)),
                                    SizedBox(height: Get.height * 0.02),
                                    Text('Your account is ready to use. You will be redirected to the Home page in a few seconds..', textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
                                    Lottie.network(lottiePoteaLoader, width: 150),
                                  ],
                                ),
                              );
                            }
                          );
                        },
                      );
                      Future.delayed(Duration(seconds: 3), () {
                        hideKeyboard(context);
                        Get.back();
                        Get.to(() => DashboardScreen());
                      });
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(fontSize: 16, color: white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }

  Widget setAsPrimaryWidget() {
    return Obx(
      () => ListTileTheme(
        horizontalTitleGap: 0.0,
        child: CheckboxListTile(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          selectedTileColor: Colors.transparent,
          value: newPassController.checkboxValue.value,
          checkColor: white,
          title: Text("Remember me", style: TextStyle(color: appStore.isDarkModeOn ? white : black, fontSize: 16)),
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
          checkboxShape: RoundedRectangleBorder(borderRadius: radius(5)),
          side: const BorderSide(color: poteaPrimaryColor),
          dense: true,
          activeColor: appStore.isDarkModeOn ? poteaPrimaryColor : poteaPrimaryColor,
          onChanged: (value) {
            newPassController.checkboxValue(!newPassController.checkboxValue.value);
          },
        ),
      ),
    );
  }
}
