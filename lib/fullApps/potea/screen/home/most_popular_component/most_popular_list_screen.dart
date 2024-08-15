import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/components/app_scaffold.dart';

import '../../../../../main.dart';
import '../../../components/choose_plant.dart';
import '../../../components/searchbar_widget.dart';
import '../../../utils/image.dart';
import '../special_offer_component/offer_list.dart';
import '../special_offer_component/special_offer_model.dart';
import 'most_popular_item_component.dart';

class MostPopularListScreen extends StatelessWidget {
  const MostPopularListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('Most Popular', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      actions: [
        InkWell(
          onTap: () {
            Get.to(() => SearchBarWidget());
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.network(
              icSearch,
              height: 24,
              color: appStore.isDarkModeOn ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
      body: AnimatedScrollView(
        padding: EdgeInsets.only(bottom: 50, top: 16),
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          Center(
            child: Column(
              children: [
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
                          description: offer[index].description,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
