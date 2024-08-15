import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/components/app_scaffold.dart';

import '../../../../../main.dart';
import '../../../utils/colors.dart';
import '../../../utils/common_base.dart';
import '../../../utils/image.dart';
import 'add_new_controller.dart';

class AddNewAddressScreen extends StatelessWidget {
  AddNewAddressScreen({super.key});

  final AddNewAddressController controller = Get.put(AddNewAddressController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('Add New Address', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      actions: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Image.network(
            icMore,
            color: appStore.isDarkModeOn ? white : black,
            width: 20,
          ),
        ),
      ],
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: appStore.isDarkModeOn ? scaffoldSecondaryDark : scaffoldLightColor,
                    image: DecorationImage(image: NetworkImage(imageMap), fit: BoxFit.cover),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: context.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        indent: 3,
                        height: 1,
                        thickness: 3,
                        color: borderColor.withOpacity(0.5),
                      ).paddingSymmetric(horizontal: 140),
                      SizedBox(height: Get.height * 0.018),
                      Center(
                        child: Text(
                          'Address Details',
                          style: TextStyle(color: appStore.isDarkModeOn ? white : black, fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.016),
                      commonDivider,
                      SizedBox(height: Get.height * 0.018),
                      Text('Name Address', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: Get.height * 0.010),
                      AppTextField(
                        textStyle: TextStyle(fontSize: 12),
                        textFieldType: TextFieldType.NAME,
                        titleTextStyle: TextStyle(fontSize: 14),
                        decoration: inputDecoration(
                          context,
                          hintText: 'Apartment',
                          fillColor: context.cardColor,
                          filled: true,
                          borderRadius: 15,
                        ),
                      ),
                      SizedBox(height: Get.height * 0.018),
                      Text('Address Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: Get.height * 0.010),
                      AppTextField(
                        textStyle: TextStyle(fontSize: 12),
                        textFieldType: TextFieldType.NAME,
                        titleTextStyle: TextStyle(fontSize: 14),
                        decoration: inputDecoration(
                          context,
                          hintText: '2899 Summer Drive Taylor, PC 48180',
                          fillColor: context.cardColor,
                          filled: true,
                          borderRadius: 15,
                        ),
                        suffix: icLocation.iconImage(fit: BoxFit.contain).paddingAll(14),
                      ),
                      SizedBox(height: Get.height * 0.018),
                      setAsPrimaryWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AppButton(
              elevation: 0,
              height: Get.height * 0.06,
              width: Get.width,
              color: poteaPrimaryColor,
              shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              onTap: () {},
              child: Text('Add', style: TextStyle(fontSize: 16, color: white)),
            ).paddingAll(16),
          ),
        ],
      ),
    );
  }

  Widget setAsPrimaryWidget() {
    return Obx(
      () => ListTileTheme(
        horizontalTitleGap: 0.0,
        child: CheckboxListTile(
          value: controller.checkboxValue.value,
          checkColor: white,
          title: Text('Make this as the default address', style: TextStyle(color: appStore.isDarkModeOn ? white : black, fontSize: 14)),
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
          checkboxShape: RoundedRectangleBorder(borderRadius: radius(5)),
          side: const BorderSide(color: poteaPrimaryColor),
          dense: true,
          activeColor: appStore.isDarkModeOn ? poteaPrimaryColor : poteaPrimaryColor,
          onChanged: (value) {
            controller.checkboxValue(!controller.checkboxValue.value);
          },
        ),
      ),
    );
  }
}
