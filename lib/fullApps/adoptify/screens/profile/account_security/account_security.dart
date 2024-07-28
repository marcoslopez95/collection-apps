import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/adoptify/components/appscaffold.dart';

import '../../../../../main.dart';
import '../../../components/list_tile_widget.dart';
import '../../../components/switch_button_widget.dart';
import '../../auth/signin_screen/new_password/newpassword.dart';
import 'accountsecurity_controller.dart';

class AccountSecurity extends StatelessWidget {
  final AccountSecurityController controller = Get.put(AccountSecurityController());

  AccountSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isCenterTitle: true,
      appBarTitle: Observer(builder: (context) {
        return Text(
          "Account & Security",
          style: TextStyle(color: appStore.isDarkModeOn ? white : black, fontSize: 18, fontWeight: FontWeight.bold),
        );
      }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SwitchButtonWidget(
              title: 'Biometric ID',
              switchValue: controller.BiometricID,
            ),
            20.height,
            SwitchButtonWidget(
              title: 'Face ID',
              switchValue: controller.FaceID,
            ),
            20.height,
            SwitchButtonWidget(
              title: 'SMS Authenticator',
              switchValue: controller.SMSAuthenticator,
            ),
            20.height,
            SwitchButtonWidget(
              title: 'Google Authenticator',
              switchValue: controller.GoogleAuthenticator,
            ),
            30.height,
            ListTileWidget(
              title: 'Change Password',
              onTap: () {
                Get.to(NewPassword());
              },
            ),
            ListTileWidget(
              title: 'Device Management',
              subtitle: "Manage your account on the various devices you own.",
              onTap: () {},
            ),
            ListTileWidget(
              title: 'Deactivate Account',
              subtitle: "Temporarily deactivate your account. Easily reactivate when you're ready",
              onTap: () {},
            ),
            ListTileWidget(title: "Delete Account", subtitle: "Permanently remove your account and data Proceed with caution.", isDelete: true, onTap: () {})
          ],
        ),
      ),
    );
  }
}
