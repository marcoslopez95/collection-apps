import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/components/app_scaffold.dart';
import 'package:access_maketicket/fullApps/potea/utils/common_base.dart';

import '../../../../../main.dart';
import '../../../utils/colors.dart';
import '../../../utils/image.dart';
import '../new_pin/create_new_pin.dart';
import 'fill_profile_controller.dart';
import 'image_picker_controller.dart';

class FillProfile extends StatelessWidget {
  FillProfile({super.key});

  ImagePickerController controller = Get.put(ImagePickerController());
  FillProfileController fillconteroller = Get.put(FillProfileController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('Fill Your Profile', style: TextStyle(fontSize: 18)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: GestureDetector(
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: controller.imagePath.isNotEmpty ? FileImage(File(controller.imagePath.value)) : NetworkImage(userIm) as ImageProvider,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: Get.height * 0.01,
                            right: Get.width * 0.33,
                            top: Get.width * 0.16,
                            left: Get.width * 0.58,
                            child: Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: poteaPrimaryColor),
                              child: IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SafeArea(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: <Widget>[
                                              ListTile(
                                                leading: Icon(Icons.camera_alt, color: poteaPrimaryColor),
                                                title: Text('Camera'),
                                                onTap: () {
                                                  controller.getImage(source: ImageSource.camera);
                                                  Get.back();
                                                },
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.photo_library, color: poteaPrimaryColor),
                                                title: Text('Gallery'),
                                                onTap: () {
                                                  controller.getImage(source: ImageSource.gallery);
                                                  Get.back();
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(Icons.edit),
                                  iconSize: 18,
                                  color: white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    16.height,
                    AppTextField(
                      textStyle: TextStyle(fontSize: 12),
                      keyboardType: TextInputType.multiline,
                      textFieldType: TextFieldType.NAME,
                      titleTextStyle: TextStyle(fontSize: 14),
                      decoration: inputDecoration(
                        context,
                        hintText: 'Full Name',
                        fillColor: context.cardColor,
                        filled: true,
                        borderRadius: 15,
                      ),
                    ).paddingSymmetric(horizontal: 16),
                    16.height,
                    AppTextField(
                      textStyle: TextStyle(fontSize: 12),
                      keyboardType: TextInputType.multiline,
                      textFieldType: TextFieldType.NAME,
                      titleTextStyle: TextStyle(fontSize: 14),
                      decoration: inputDecoration(
                        context,
                        hintText: 'Nickname',
                        fillColor: context.cardColor,
                        filled: true,
                        borderRadius: 15,
                      ),
                    ).paddingSymmetric(horizontal: 16),
                    16.height,
                    AppTextField(
                      textStyle: TextStyle(fontSize: 12),
                      keyboardType: TextInputType.datetime,
                      controller: fillconteroller.dateController,
                      textFieldType: TextFieldType.NAME,
                      titleTextStyle: TextStyle(fontSize: 14),
                      decoration: inputDecoration(
                        context,
                        hintText: 'Date of Birth',
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
                      textFieldType: TextFieldType.EMAIL,
                      keyboardType: TextInputType.emailAddress,
                      titleTextStyle: TextStyle(fontSize: 14),
                      decoration: inputDecoration(
                        context,
                        hintText: 'Email',
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          contentPadding: EdgeInsets.all(8),
                          fillColor: context.cardColor,
                          filled: true,
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(fontSize: 12),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(15)),
                        ),
                        initialCountryCode: 'IN',
                        showDropdownIcon: true,
                        dropdownIconPosition: IconPosition.trailing,
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                        flagsButtonPadding: EdgeInsets.symmetric(horizontal: 16),
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
                            child: Text(
                              gender,
                              style: TextStyle(
                                fontSize: 12,
                                color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                              ),
                            ),
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
                        hint: Text(
                          'Gender',
                          style: TextStyle(
                            fontSize: 14,
                            color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                          ),
                        ),
                        icon: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Icon(Icons.arrow_drop_down, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                        ),
                      ).paddingSymmetric(horizontal: 16),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      bottomNavBar: AppButton(
        width: Get.width,
        height: Get.height * 0.02,
        color: poteaPrimaryColor,
        shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onTap: () {
          Get.to(() => CreatePin());
        },
        child: Text('Continue', style: TextStyle(fontSize: 16, color: white)),
      ).paddingOnly(bottom: 26, left: 16, right: 16),
    );
  }
}
