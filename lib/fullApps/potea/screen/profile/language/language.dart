import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/potea/components/app_scaffold.dart';
import 'package:prokit_flutter/fullApps/potea/screen/profile/language/language_model.dart';

import '../../../utils/colors.dart';
import '../../../utils/common_base.dart';
import 'language_controller.dart';

class LanguageProfile extends StatelessWidget {
  LanguageProfile({super.key});

  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('Language', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            16.height,
            Text('Suggested', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)).paddingOnly(right: 16, left: 16, bottom: 16),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: languageController.lang.length,
                itemBuilder: (context, index) {
                  final lang = languageController.lang[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => GestureDetector(
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              children: [
                                Text(lang.lang, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
                                Spacer(),
                                Radio<LanguageModel>(
                                  activeColor: poteaPrimaryColor,
                                  value: lang,
                                  groupValue: languageController.selectedlang.value,
                                  onChanged: (LanguageModel? value) {
                                    languageController.setSelectedlang(value);
                                  },
                                ),
                              ],
                            ),
                          ).paddingSymmetric(horizontal: 16, vertical: 8),
                        ),
                      ),
                      if (index == 1) ...[
                        commonDivider.paddingSymmetric(horizontal: 16),
                        Text('Language', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)).paddingSymmetric(horizontal: 16, vertical: 16),
                      ],
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
