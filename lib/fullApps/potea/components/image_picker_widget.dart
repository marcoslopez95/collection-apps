import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../screen/profile/fill_profile/image_picker_controller.dart';
import '../utils/colors.dart';
import '../utils/image.dart';

class ImagePickerWidget extends StatelessWidget {
  ImagePickerWidget({super.key});

  ImagePickerController controller = Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: GestureDetector(
                      child: CircleAvatar(
                        radius: Get.height * 0.067,
                        backgroundImage: controller.imagePath.isNotEmpty 
                            ? FileImage(File(controller.imagePath.value)) 
                            : NetworkImage(userIm) as ImageProvider,
                      ),
                    ),
                  ),
                  Positioned(
                    top: Get.height * 0.09,
                    right: Get.width * 0.35,
                    left: Get.width * 0.59,
                    child: GestureDetector(
                      child: SizedBox(height: 20, child: Image.network(icPencil)),
                      onTap: () {
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
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
