import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/potea/components/app_scaffold.dart';
import 'package:prokit_flutter/fullApps/potea/screen/auth/forgot_pass/forgot_password.dart';
import 'package:prokit_flutter/fullApps/potea/screen/auth/sign_in_controller.dart';
import 'package:prokit_flutter/fullApps/potea/screen/auth/sign_up_screen.dart';
import 'package:prokit_flutter/fullApps/potea/utils/common_base.dart';

import '../../../../main.dart';
import '../../utils/colors.dart';
import '../../utils/image.dart';
import '../dashboard/dashboard.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final SignInController signInController = Get.put(SignInController());
  final GlobalKey<FormState> _signInformKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hasLeadingWidget: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: SvgPicture.network(
                    assetsPotea,
                    width: 50,
                  ),
                ),
                Text('otea', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600)),
              ],
            ),
            SizedBox(height: Get.height * 0.03),
            Text('Login to Your Account', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: Get.height * 0.05),
            Form(
              key: _signInformKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        fillColor: context.cardColor,
                        filled: true,
                        prefixIcon: icMail.iconImage(fit: BoxFit.contain).paddingAll(14),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: context.cardColor, width: 0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: poteaPrimaryColor, width: 0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ).paddingSymmetric(horizontal: 16),
                  ),
                  16.height,
                  SizedBox(
                    height: 50,
                    child: Obx(
                      () => TextField(
                        obscureText: !signInController.isPasswordVisible.value,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w300),
                          fillColor: context.cardColor,
                          filled: true,
                          prefixIcon: icPass.iconImage(fit: BoxFit.contain).paddingAll(14),
                          suffixIcon: IconButton(
                            icon: Icon(
                              signInController.isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                              color: lightGrey,
                            ),
                            onPressed: signInController.togglePasswordVisibility,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: context.cardColor, width: 0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: poteaPrimaryColor, width: 0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        //onTap: () {},
                      ).paddingSymmetric(horizontal: 16),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.001),
                  setAsPrimaryWidget().paddingSymmetric(horizontal: 80),
                  SizedBox(height: Get.height * 0.001),
                  AppButton(
                    width: Get.width,
                    height: Get.height * 0.02,
                    color: poteaPrimaryColor,
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    onTap: () {
                      Get.to(() => DashboardScreen());
                    },
                    child: Text('Sign in', style: TextStyle(fontSize: 16, color: white)),
                  ).paddingSymmetric(horizontal: 16),
                  SizedBox(height: Get.height * 0.02),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Get.to(() => ForgotPassword());
                      },
                      child: Text('Forgot the password?', style: TextStyle(color: poteaPrimaryColor)),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.040),
                  Row(children: <Widget>[
                    Expanded(child: commonDivider),
                    5.width,
                    Text("or continue with"),
                    5.width,
                    Expanded(child: commonDivider),
                  ]).paddingSymmetric(horizontal: 16),
                  SizedBox(height: Get.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 60,
                        width: 80,
                        decoration: BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.circular(20), border: Border.all(color: lightGrey, width: 0.1)),
                        child: Image.network(icFacebook, height: 20).paddingAll(16),
                      ),
                      Container(
                        height: 60,
                        width: 80,
                        decoration: BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.circular(20), border: Border.all(color: lightGrey, width: 0.1)),
                        child: Image.network(icGoogle, height: 20).paddingAll(16),
                      ),
                      Container(
                        height: 60,
                        width: 80,
                        decoration: BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.circular(20), border: Border.all(color: lightGrey, width: 0.1)),
                        child: Image.network(icAppleLogo, color: appStore.isDarkModeOn ? Colors.white : Colors.black, height: 20).paddingAll(16),
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 16),
                  SizedBox(height: Get.height * 0.030),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?", style: TextStyle(fontSize: 14)),
                      TextButton(
                        onPressed: () {
                          Get.to(() => SignUp());
                        },
                        child: Text('Sign up', style: TextStyle(color: poteaPrimaryColor)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget setAsPrimaryWidget() {
    return Obx(
      () => ListTileTheme(
        horizontalTitleGap: 0.0,
        child: CheckboxListTile(
          value: signInController.checkboxValue.value,
          checkColor: white,
          title: Text("Remember me", style: TextStyle(color: appStore.isDarkModeOn ? white : black, fontSize: 18)),
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
          checkboxShape: RoundedRectangleBorder(borderRadius: radius(5)),
          side: const BorderSide(color: poteaPrimaryColor),
          dense: true,
          activeColor: appStore.isDarkModeOn ? poteaPrimaryColor : poteaPrimaryColor,
          onChanged: (value) {
            signInController.checkboxValue(!signInController.checkboxValue.value);
          },
        ),
      ),
    );
  }
}
