import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/screen/home/special_offer_component/special_offer_item_component.dart';
import 'package:access_maketicket/fullApps/potea/screen/home/special_offer_component/special_offer_list_screen.dart';

import '../../../utils/colors.dart';
import 'offer_list.dart';

class SpecialOffer extends StatelessWidget {
  const SpecialOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Special Offer', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Spacer(),
            TextButton(
              onPressed: () {
                hideKeyboard(context);
                Get.to(() => SpecialOfferListScreen());
              },
              child: Text('See All', style: TextStyle(color: poteaPrimaryColor)),
            ),
          ],
        ).paddingOnly(bottom: 8, left: 16, right: 8),
        HorizontalList(
          spacing: 16,
          padding: EdgeInsets.symmetric(horizontal: 16),
          itemCount: offer.length,
          itemBuilder: (context, index) {
            return SpecialOfferItemComponent(
              offer: offer[index],
              width: Get.width * 0.50,
            );
          },
        ),
      ],
    );
  }
}
