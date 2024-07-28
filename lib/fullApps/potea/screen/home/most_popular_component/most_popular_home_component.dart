import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../components/choose_plant.dart';
import '../../../utils/colors.dart';
import '../special_offer_component/offer_list.dart';
import '../special_offer_component/special_offer_model.dart';
import 'most_popular_item_component.dart';
import 'most_popular_list_screen.dart';

class MostPopularOffer extends StatelessWidget {
  const MostPopularOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Most Popular',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                hideKeyboard(context);
                Get.to(() => MostPopularListScreen());
              },
              child: Text('See All', style: TextStyle(color: poteaPrimaryColor, fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ).paddingOnly(bottom: 8, left: 16, right: 8),
        MostPopular(),
        20.height,
        Wrap(
          runSpacing: 16,
          spacing: 16,
          children: List.generate(
            offer.length,
            (index) {
              return MostPopularItemComponent(
                width: Get.width * 0.44,
                offer: OfferModel(
                  id: offer[index].id,
                  plantName: offer[index].plantName,
                  rating: offer[index].rating,
                  profileImage: offer[index].profileImage,
                  sold: offer[index].sold,
                  price: offer[index].price,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
