import 'package:dashed_stepper/dashed_stepper.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../utils/colors.dart';
import '../../../utils/image.dart';

class Tracking extends StatelessWidget {
  const Tracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DashedStepper(
          indicatorColor: poteaPrimaryColor,
          disabledColor: lightGrey,
          height: 30,
          gap: 1,
          icons: const [
            Image(image: NetworkImage(icLogistics), color: poteaPrimaryColor, height: 25),
            Image(image: NetworkImage(icDeliveryTruck), color: poteaPrimaryColor, height: 25),
            Image(image: NetworkImage(icDelivery), height: 25),
            Image(image: NetworkImage(icOrder), height: 25),
          ],
          length: 4,
          step: 2,
        ),
      ],
    );
  }
}
