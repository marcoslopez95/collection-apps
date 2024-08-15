import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/adoptify/components/appscaffold.dart';
import 'package:access_maketicket/main/utils/AppConstant.dart';

import '../../../../../main.dart';
import '../../../utils/color.dart';
import '../components/signup_button_component.dart';
import '../signin_screen/signin.dart';
import '../signup_screen/signup.dart';
import 'option_controller.dart';

class OptionScreen extends StatelessWidget {
  final OptionController controller = Get.put(OptionController());

  OptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return controller.onWillPop(context);
      },
      child: AppScaffold(
        hasLeadingWidget: false,
        body: Observer(builder: (context) {
          return SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: NetworkImage("${BaseUrl}/images/adoptify/image/adoptify.png"),
                    color: adoptifyPrimaryColor,
                    height: Get.height * 0.12,
                  ),
                  20.height,
                  Text(
                    "Let's Get Started!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: appStore.isDarkModeOn ? white : black,
                      fontSize: Get.width * 0.09,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  10.height,
                  Text(
                    "Let's dive into your Account",
                    style: TextStyle(
                      color: appStore.isDarkModeOn ? Colors.white38 : Colors.black45,
                      fontSize: Get.width * 0.05,
                    ),
                  ),
                  30.height,
                  SignupButton(),
                  50.height,
                  Container(
                    height: Get.height * 0.067,
                    width: Get.width * 0.9,
                    child: AppButton(
                      width: Get.width,
                      elevation: 0,
                      text: "Sign up",
                      textStyle: TextStyle(
                        fontSize: Get.width * 0.05,
                        color: white,
                      ),
                      color: adoptifyPrimaryColor,
                      shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      onTap: () {
                        Get.to(() => SignUpPage());
                      },
                    ),
                  ),
                  20.height,
                  Container(
                    height: Get.height * 0.067,
                    width: Get.width * 0.9,
                    child: AppButton(
                      width: Get.width,
                      elevation: 0,
                      text: "Sign In",
                      textStyle: TextStyle(
                        color: appStore.isDarkModeOn ? white : adoptifyPrimaryColor,
                        fontSize: Get.width * 0.05,
                      ),
                      color: appStore.isDarkModeOn ? Color(0xFF35383F) : Color(0xFFFEF7EF),
                      shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      onTap: () {
                        Get.to(() => SignInPage());
                      },
                    ),
                  ),
                  75.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Privacy Policy",
                        style: TextStyle(color: appStore.isDarkModeOn ? Colors.white30 : Colors.black38),
                      ),
                      14.width,
                      Text(
                        ".",
                        style: TextStyle(color: appStore.isDarkModeOn ? Colors.white30 : Colors.black38, fontSize: 25),
                      ).paddingBottom(Get.height * 0.009),
                      TextButton(
                        onPressed: () {
                          //
                        },
                        child: Text(
                          "Terms of Service",
                          style: TextStyle(
                            color: appStore.isDarkModeOn ? Colors.white30 : Colors.black38,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
