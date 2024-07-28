import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/potea/components/app_scaffold.dart';
import 'package:prokit_flutter/fullApps/potea/screen/home/whishlist/whishlist_controller.dart';

import '../../../../../main.dart';
import '../../../components/choose_plant.dart';
import '../../../components/searchbar_widget.dart';
import '../../../utils/image.dart';
import '../special_offer_component/special_offer_item_component.dart';

class WishlistScreen extends StatelessWidget {
  final WishlistController wishlistController = Get.put(WishlistController());

  WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('My Wishlist', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      actions: [
        InkWell(
          onTap: () {
            Get.to(() => SearchBarWidget());
          },
          child: Image.network(
            icSearch,
            height: 24,
            color: appStore.isDarkModeOn ? Colors.white : Colors.black,
          ).paddingAll(16),
        ),
      ],
      body: wishlistController.wishlist.isEmpty
          ? Text('No Data Found', style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black)).center()
          : AnimatedScrollView(
              padding: EdgeInsets.only(bottom: 50, top: 16, left: 16),
              physics: AlwaysScrollableScrollPhysics(),
              children: [
                MostPopular(),
                16.height,
                Obx(
                  () {
                    return Wrap(
                      runSpacing: 16,
                      spacing: 16,
                      children: List.generate(
                        wishlistController.wishlist.length,
                        (index) {
                          return SpecialOfferItemComponent(
                            width: Get.width * 0.44,
                            offer: wishlistController.wishlist[index],
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
    );
  }
}
