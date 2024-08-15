import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/components/app_scaffold.dart';
import 'package:access_maketicket/fullApps/potea/screen/profile/privacy_policy/privacy_policy_controller.dart';

class PrivacyPolicy extends StatelessWidget {
  final PrivacyController controller = Get.put(PrivacyController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('Privacy Policy', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      body: Obx(() {
        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: controller.privacyData.length,
          itemBuilder: (context, index) {
            final item = controller.privacyData[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                16.height,
                Text(item.description),
                16.height,
              ],
            );
          },
        );
      }),
    );
  }
}
