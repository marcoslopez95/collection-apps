import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/adoptify/components/appscaffold.dart';
import 'package:prokit_flutter/fullApps/adoptify/screens/auth/signin_screen/signin_controller.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

import '../../../../../main.dart';
import '../../../components/adoptify_loader.dart';
import '../../../utils/color.dart';
import '../../dashbord/dashboard.dart';
import '../components/signup_button_component.dart';
import 'forgot_password/forgot_password.dart';

class SignInPage extends StatelessWidget {
  final SigninController controller = Get.put(SigninController());

  SignInPage({super.key});

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
                  Text(
                    "Welcome Back 👋",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Get.width * 0.08,
                      color: appStore.isDarkModeOn ? white : black,
                    ),
                  ),
                  30.height,
                  Text(
                    "Let's continues the journey  with your furry friends.",
                    style: TextStyle(
                      fontSize: Get.width * 0.04,
                      color: appStore.isDarkModeOn ? Colors.white38 : Colors.black45,
                    ),
                  ),
                  50.height,
                  Text(
                    "Email",
                    style: TextStyle(
                      color: appStore.isDarkModeOn ? white : black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  10.height,
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: appStore.isDarkModeOn ? white : black,
                    ),
                    controller: controller.EmailController,
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
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: context.cardColor),
                      ),
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
                      obscureText: controller.is_Visible.value,
                      controller: controller.PasswordController,
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
                          height: 18,
                        ).paddingAll(16),
                        suffixIcon: IconButton(
                          icon: ImageIcon(
                            NetworkImage(
                              controller.is_Visible.value ? "${BaseUrl}/images/adoptify/image/ic_eye_slash.png" : "${BaseUrl}/images/adoptify/image/ic_eye.png",
                            ),
                            color: appStore.isDarkModeOn ? grey : Colors.black45,
                            size: 20,
                          ),
                          onPressed: controller.toggle_PasswordVisibility,
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
                      //onTap: () {},
                    ),
                  ),
                  10.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      setAsPrimaryWidget(),
                      TextButton(
                          onPressed: () {
                            Get.to(() => ForgotPassword());
                          },
                          child: Text("Forgot Password?", style: TextStyle(color: adoptifyPrimaryColor, fontSize: 15)))
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
                    text: "Sign In",
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
                                        "Sign In...",
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
                        Get.to(() => Dashboard());
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
    return Obx(
      () => Container(
        width: Get.width * 0.450,
        child: ListTileTheme(
          horizontalTitleGap: 0.0,
          child: CheckboxListTile(
            value: controller.checkboxValue.value,
            checkColor: white,
            title: Text("Remember me", style: TextStyle(color: appStore.isDarkModeOn ? white : black, fontSize: 14)),
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
        ),
      ),
    );
  }
}
