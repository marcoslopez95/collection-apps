import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:access_maketicket/fullApps/potea/screen/home/quantity_controller.dart';

import '../../utils/colors.dart';

class QuantitySelector extends StatelessWidget {
  final QuantityController controller = Get.put(QuantityController());
  final Color? color;
  final double? height;

  QuantitySelector({this.color, this.height});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: color,
          ),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: controller.decrement,
                color: poteaPrimaryColor,
              ),
              Obx(() => Text('${controller.quantity}', style: TextStyle(fontSize: 18, color: poteaPrimaryColor))),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: controller.increment,
                color: poteaPrimaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
