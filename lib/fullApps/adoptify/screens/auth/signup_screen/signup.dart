import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/adoptify/components/appscaffold.dart';
import 'package:access_maketicket/fullApps/adoptify/screens/auth/signup_screen/signup_controller.dart';
import 'package:access_maketicket/main/utils/AppConstant.dart';

import '../../../../../main.dart';
import '../../../components/adoptify_loader.dart';
import '../../../utils/color.dart';
import '../components/signup_button_component.dart';
import '../signin_screen/signin.dart';
import 'detail_page/signup_pageflow.dart';

class SignUpPage extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Observer(builder: (context) {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Join Adoptify Today",
                        style: primaryTextStyle(weight: FontWeight.bold, size: 25, color: appStore.isDarkModeOn ? white : black),
                      ),
                      5.width,
                      Image(
                        image: NetworkImage("${BaseUrl}/images/adoptify/icons/paws.png"),
                        height: 30,
                        color: appStore.isDarkModeOn ? gray : black,
                      )
                    ],
                  ),
                  25.height,
                  Text(
                    "A world of furry possibilities awaits you.",
                    style: secondaryTextStyle(size: 18, color: appStore.isDarkModeOn ? Colors.white38 : Colors.black45),
                  ),
                  50.height,
                  Text(
                    "Email",
                    style: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 18, weight: FontWeight.w500),
                  ),
                  10.height,
                  TextField(
                    style: TextStyle(
                      color: appStore.isDarkModeOn ? white : black,
                    ),
                    controller: controller.signupController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                      fillColor: context.cardColor,
                      filled: true,
                      prefixIcon: Image(
                        image: NetworkImage("${BaseUrl}/images/adoptify/icons/ic_mail.png"),
                        color: appStore.isDarkModeOn ? grey : Colors.black45,
                        height: 18,
                      ).paddingAll(16),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: context.cardColor)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: adoptifyPrimaryColor,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  30.height,
                  Text(
                    "Password",
                    style: TextStyle(color: appStore.isDarkModeOn ? white : black, fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  10.height,
                  Obx(
                    () => TextField(
                      style: TextStyle(
                        color: appStore.isDarkModeOn ? white : black,
                      ),
                      obscureText: controller.isVisible.value,
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        fillColor: context.cardColor,
                        filled: true,
                        prefixIcon: Image(
                          image: NetworkImage("${BaseUrl}/images/adoptify/icons/ic_lock.png"),
                          color: appStore.isDarkModeOn ? grey : Colors.black45,
                          height: 20,
                        ).paddingAll(16),
                        suffixIcon: IconButton(
                          icon: ImageIcon(
                            NetworkImage(
                              controller.isVisible.value ? "${BaseUrl}/images/adoptify/image/ic_eye_slash.png" : "${BaseUrl}/images/adoptify/image/ic_eye.png",
                            ),
                            color: appStore.isDarkModeOn ? grey : Colors.black45,
                            size: 20,
                          ),
                          onPressed: controller.togglePasswordVisibility,
                        ),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: context.cardColor)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: adoptifyPrimaryColor,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  10.height,
                  setAsPrimaryWidget().paddingAll(Get.height * 0.002),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have a account?",
                        style: TextStyle(color: appStore.isDarkModeOn ? white : black, fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {
                          hideKeyboard(context);
                          Get.to(() => SignInPage());
                        },
                        child: Text("Sign in", style: TextStyle(color: adoptifyPrimaryColor, fontSize: 16)),
                      )
                    ],
                  ),
                  40.height,
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Divider(
                          color: appStore.isDarkModeOn ? Color.fromARGB(255, 84, 84, 84) : Color(0xFFD8D9D9),
                          height: Get.height * 0.001,
                        ),
                      ).expand(),
                      Text(
                        "or",
                        style: TextStyle(color: secondaryTextColor, fontSize: 20),
                      ).paddingSymmetric(horizontal: 20),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Divider(color: appStore.isDarkModeOn ? Color.fromARGB(255, 84, 84, 84) : Color(0xFFD8D9D9)),
                      ).expand(),
                    ],
                  ),
                  50.height,
                  SignupButton(),
                  120.height,
                ],
              ).paddingAll(Get.height * 0.02),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
                  child: AppButton(
                    elevation: 0,
                    text: "Sign up",
                    textStyle: primaryTextStyle(size: 20, weight: FontWeight.bold, color: white),
                    color: adoptifyPrimaryColor,
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    onTap: () {
                      hideKeyboard(context);
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return Observer(builder: (context) {
                            return Stack(
                              children: [
                                BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Container(
                                    color: Colors.black.withOpacity(0.1),
                                  ),
                                ),
                                AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      LoaderWidget(color: adoptifyPrimaryColor),
                                      SizedBox(height: 20),
                                      Text(
                                        "Sign Up...",
                                        style: TextStyle(color: appStore.isDarkModeOn ? white : black),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          });
                        },
                      );
                      Future.delayed(Duration(seconds: 2), () {
                        Get.back();
                        Get.off(() => SignUpFlow());
                        controller.currentPage.value = 0;
                      });
                    },
                  ).paddingSymmetric(vertical: 30, horizontal: 16)),
            ),
          ],
        );
      }),
    );
  }

  Widget setAsPrimaryWidget() {
    return ListTileTheme(
      horizontalTitleGap: 0.0,
      contentPadding: EdgeInsets.zero,
      child: Observer(builder: (context) {
        return Obx(
          () => CheckboxListTile(
            value: controller.checkboxValue.value,
            checkColor: white,
            title: Row(
              children: [
                Text("I agree to Adoptify", style: TextStyle(color: appStore.isDarkModeOn ? white : black, fontSize: 14)),
                5.width,
                Text("Term & Conditions.", style: TextStyle(color: adoptifyPrimaryColor, fontSize: 14)),
              ],
            ),
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
            checkboxShape: RoundedRectangleBorder(borderRadius: radius(5)),
            side: const BorderSide(color: adoptifyPrimaryColor),
            dense: true,
            activeColor: adoptifyPrimaryColor,
            onChanged: (value) {
              controller.checkboxValue(!controller.checkboxValue.value);
            },
          ),
        );
      }),
    );
  }
}
