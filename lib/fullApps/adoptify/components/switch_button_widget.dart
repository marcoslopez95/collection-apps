import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import '../utils/color.dart';

class SwitchButtonWidget extends StatelessWidget {
  final String title;
  final RxBool switchValue;

  SwitchButtonWidget({super.key, required this.title, required this.switchValue});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switchValue.value = !switchValue.value;
      },
      child: Observer(
        builder: (context) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: primaryTextStyle(size: 16, color: appStore.isDarkModeOn ? white : black, weight: FontWeight.bold),
              ),
              Obx(
                () => Switch(
                  activeColor: white,
                  inactiveThumbColor: white,
                  inactiveTrackColor: appStore.isDarkModeOn ? Colors.white12 : Colors.black12,
                  trackOutlineColor: MaterialStatePropertyAll(context.cardColor),
                  activeTrackColor: adoptifyPrimaryColor,
                  value: switchValue.value,
                  onChanged: (value) {
                    switchValue.value = value;
                  },
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 16);
        }
      ),
    );
  }
}
