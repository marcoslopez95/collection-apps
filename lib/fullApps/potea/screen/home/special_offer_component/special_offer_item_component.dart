import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/potea/screen/home/special_offer_component/special_offer_model.dart';

import '../../../../../main.dart';
import '../../../utils/colors.dart';
import '../../../utils/image.dart';
import '../detail_product.dart';
import '../whishlist/whishlist_controller.dart';

class SpecialOfferItemComponent extends StatelessWidget {
  final OfferModel offer;
  final double? width;

  const SpecialOfferItemComponent({Key? key, required this.offer, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => DetailProduct(offer: offer));
          },
          child: SizedBox(
            width: width ?? Get.width * 0.49,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color: context.cardColor,
                  child: ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.network(offer.profileImage)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                Text(offer.plantName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)).paddingSymmetric(horizontal: 4),
                Row(
                  children: [
                    Image.network(icRating, width: 18),
                    SizedBox(width: Get.width * 0.02),
                    Text(offer.rating, style: TextStyle(fontSize: 14, color: appStore.isDarkModeOn ? white : black)),
                    VerticalDivider(color: Colors.red),
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: poteaPrimaryColor, width: 1.5), borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0.5),
                        child: Text(offer.sold, style: TextStyle(fontSize: 11, color: poteaPrimaryColor)),
                      ),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 4),
                Text(offer.price, style: TextStyle(fontSize: 18, color: poteaPrimaryColor, fontWeight: FontWeight.bold)).paddingSymmetric(horizontal: 4),
              ],
            ),
          ),
        ),
        Positioned(
          top: Get.height * 0.02,
          right: Get.width * 0.04,
          child: InkWell(
            onTap: () {
              Get.find<WishlistController>().addToWishlist(offer);
            },
            child: Obx(
              () {
                return Image.network(
                  Get.find<WishlistController>().isInWishlist(offer) ? imageLoveFillFinal : imageLoveUnFillFinal,
                  color: poteaPrimaryColor,
                  width: 30,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
