import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../screens/auth/signup_screen/signup_controller.dart';
import '../utils/color.dart';

class GradientProgressIndicator extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());
  final double value;

  GradientProgressIndicator({required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: Get.height * 0.02,
          width: Get.width * 0.6,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.grey[300]!, Colors.grey[300]!],
                    ),
                  ),
                ),
                FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: value,
                  child: Container(
                    decoration: BoxDecoration(
                      color: adoptifyPrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 8),
        Text(
          "${controller.currentPage}/${3}",
          style: primaryTextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
