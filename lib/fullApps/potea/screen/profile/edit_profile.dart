import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/components/app_scaffold.dart';
import 'package:access_maketicket/fullApps/potea/utils/common_base.dart';

import '../../../../main.dart';
import '../../utils/colors.dart';
import '../../utils/image.dart';
import 'fill_profile/fill_profile_controller.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  FillProfileController fillconteroller = Get.put(FillProfileController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('Edit Profile', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                16.height,
                AppTextField(
                  textStyle: TextStyle(fontSize: 12),
                  textFieldType: TextFieldType.NAME,
                  titleTextStyle: TextStyle(fontSize: 14),
                  decoration: inputDecoration(
                    context,
                    hintText: 'Andrew Ainsley',
                    fillColor: context.cardColor,
                    filled: true,
                    borderRadius: 15,
                  ),
                ).paddingSymmetric(horizontal: 16),
                16.height,
                AppTextField(
                  textStyle: TextStyle(fontSize: 12),
                  textFieldType: TextFieldType.NAME,
                  titleTextStyle: TextStyle(fontSize: 14),
                  decoration: inputDecoration(
                    context,
                    hintText: 'Andrew',
                    fillColor: context.cardColor,
                    filled: true,
                    borderRadius: 15,
                  ),
                ).paddingSymmetric(horizontal: 16),
                16.height,
                AppTextField(
                  textStyle: TextStyle(fontSize: 12),
                  controller: fillconteroller.dateController,
                  textFieldType: TextFieldType.NAME,
                  titleTextStyle: TextStyle(fontSize: 14),
                  decoration: inputDecoration(
                    context,
                    hintText: '12/27/1995',
                    fillColor: context.cardColor,
                    filled: true,
                    borderRadius: 15,
                  ),
                  suffix: InkWell(
                    child: icCalendar.iconImage(fit: BoxFit.contain).paddingAll(14),
                    onTap: () {
                      fillconteroller.selectDate(context);
                    },
                  ),
                ).paddingSymmetric(horizontal: 16),
                16.height,
                AppTextField(
                  textStyle: TextStyle(fontSize: 12),
                  textFieldType: TextFieldType.NAME,
                  titleTextStyle: TextStyle(fontSize: 14),
                  decoration: inputDecoration(
                    context,
                    hintText: 'andrew_ainsley@yourdomain.com',
                    fillColor: context.cardColor,
                    filled: true,
                    borderRadius: 15,
                  ),
                  suffix: icMail.iconImage(fit: BoxFit.contain).paddingAll(14),
                ).paddingSymmetric(horizontal: 16),
                16.height,
                SizedBox(
                  height: 60,
                  child: IntlPhoneField(
                    decoration: InputDecoration(
                      counter: Offstage(),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      contentPadding: EdgeInsets.all(8),
                      fillColor: context.cardColor,
                      filled: true,
                      hintText: '+1 111 467 378 399',
                      hintStyle: TextStyle(fontSize: 12),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(15)),
                    ),
                    initialCountryCode: 'US',
                    showDropdownIcon: true,
                    dropdownIconPosition: IconPosition.trailing,
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                    flagsButtonPadding: EdgeInsets.all(16),
                  ),
                ).paddingSymmetric(horizontal: 16),
                8.height,
                SizedBox(
                  width: Get.width,
                  child: DropdownButtonFormField<String>(
                    dropdownColor: context.cardColor,
                    value: fillconteroller.selectedGender.value,
                    items: fillconteroller.genders.map((String gender) {
                      return DropdownMenuItem<String>(
                        value: gender,
                        child: Text(gender, style: TextStyle(fontSize: 12, color: appStore.isDarkModeOn ? white : black)),
                      );
                    }).toList(),
                    onChanged: (String? newGender) {
                      if (newGender != null) {
                        fillconteroller.selectGender(newGender);
                      }
                    },
                    decoration: inputDecoration(
                      context,
                      fillColor: context.cardColor,
                      filled: true,
                      borderRadius: 15,
                    ),
                    hint: Text('Male', style: TextStyle(fontSize: 14, color: appStore.isDarkModeOn ? white : black)),
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Icon(Icons.arrow_drop_down, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                    ),
                  ).paddingSymmetric(horizontal: 16),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)), color: context.scaffoldBackgroundColor),
              child: AppButton(
                elevation: 0,
                width: Get.width,
                height: Get.height * 0.02,
                color: poteaPrimaryColor,
                shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                onTap: () {
                  Get.back();
                },
                child: Text('Update', style: TextStyle(fontSize: 16, color: white)),
              ).paddingAll(16),
            ),
          ),
        ],
      ),
    );
  }
}
