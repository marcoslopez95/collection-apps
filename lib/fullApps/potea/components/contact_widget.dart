import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

class ContactUsWidget extends StatelessWidget {
  final String iconPath;
  final String name;
  final Function()? onTap;

  ContactUsWidget({required this.iconPath, required this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.grey[900] : Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Image.network(iconPath, height: 25, color: poteaPrimaryColor),
                SizedBox(width: 10),
                Text(
                  name,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ).paddingSymmetric(horizontal: 16),
        ),
      ],
    );
  }
}
