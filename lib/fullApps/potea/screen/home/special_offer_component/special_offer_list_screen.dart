import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/potea/components/app_scaffold.dart';
import 'package:prokit_flutter/fullApps/potea/screen/home/special_offer_component/special_offer_item_component.dart';

import '../../../../../main.dart';
import '../../../components/searchbar_widget.dart';
import '../../../utils/image.dart';
import 'offer_list.dart';

class SpecialOfferListScreen extends StatelessWidget {
  const SpecialOfferListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('Special Offer', style: TextStyle(fontSize: 18)),
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
                color: appStore.isDarkModeOn ? white : black,
              ),
            )),
      ],
      body: AnimatedScrollView(
        padding: EdgeInsets.only(bottom: 50, top: 16),
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          Center(
            child: Wrap(
              runSpacing: 16,
              spacing: 16,
              children: List.generate(
                offer.length,
                (index) {
                  return SpecialOfferItemComponent(
                    width: Get.width * 0.44,
                    offer: offer[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
