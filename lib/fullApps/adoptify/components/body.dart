import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/adoptify/components/adoptify_loader.dart';
import 'package:prokit_flutter/fullApps/adoptify/utils/color.dart';

class Body extends StatelessWidget {
  final Widget child;
  final RxBool isLoading;

  const Body({Key? key, required this.isLoading, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          child,
          Obx(() => LoaderWidget(color: adoptifyPrimaryColor).center().visible(isLoading.value)),
        ],
      ),
    );
  }
}
