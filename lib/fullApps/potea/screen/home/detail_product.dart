import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/components/app_scaffold.dart';
import 'package:access_maketicket/fullApps/potea/screen/home/quantity_widget.dart';
import 'package:access_maketicket/fullApps/potea/screen/home/review/review_sceen.dart';
import 'package:access_maketicket/fullApps/potea/screen/home/special_offer_component/special_offer_model.dart';
import 'package:access_maketicket/fullApps/potea/screen/home/whishlist/whishlist_controller.dart';

import '../../../../main.dart';
import '../../utils/colors.dart';
import '../../utils/common_base.dart';
import '../../utils/image.dart';
import 'detail_product_controller.dart';

class DetailProduct extends StatelessWidget {
  final OfferModel offer;

  DetailProduct({Key? key, required this.offer}) : super(key: key);

  final DetailProductController detailProductController = Get.put(DetailProductController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      hideAppBar: true,
      scaffoldBackgroundColor: context.cardColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 85),
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.5,
                  child: PageView.builder(
                    itemCount: detailProductController.plantDetails.length,
                    controller: detailProductController.pageController,
                    onPageChanged: (int index) {
                      detailProductController.currentPage(index);
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        width: Get.width,
                        height: Get.height * 0.300,
                        color: context.cardColor,
                        child: Image.network(
                          detailProductController.plantDetails[index].image ?? "",
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  color: context.scaffoldBackgroundColor,
                  width: Get.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: Get.height * 0.018),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(offer.plantName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          InkWell(
                            onTap: () {
                              Get.find<WishlistController>().addToWishlist(offer);
                            },
                            child: Obx(() {
                              return Image.network(
                                Get.find<WishlistController>().isInWishlist(offer) ? imageLoveFillFinal : imageLoveUnFillFinal,
                                color: poteaPrimaryColor,
                                width: Get.width * 0.09,
                              );
                            }),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: poteaPrimaryColor.withOpacity(appStore.isDarkModeOn ? 0.2 : 0.1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(offer.sold, style: TextStyle(color: poteaPrimaryColor)).paddingSymmetric(horizontal: 4),
                          ),
                          SizedBox(width: Get.width * 0.02),
                          Image.network(icRating, width: 18),
                          SizedBox(width: Get.width * 0.02),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => ReviewsScreen());
                            },
                            child: Text(offer.rating + '(5,389 reviews)', style: TextStyle(fontSize: 14, color: appStore.isDarkModeOn ? white : black)),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * 0.018),
                      commonDivider,
                      SizedBox(height: Get.height * 0.018),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('Description', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: Get.height * 0.018),
                      Text(offer.description, style: TextStyle(fontSize: 12, color: grey)),
                      SizedBox(height: Get.height * 0.018),
                      Row(
                        children: [
                          Text('Quantity', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          16.width,
                          QuantitySelector(
                            color: appStore.isDarkModeOn ? darkCardContainerColor : lightCardConatinerColor,
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * 0.018),
                      commonDivider,
                      SizedBox(height: Get.height * 0.028),
                    ],
                  ).paddingSymmetric(horizontal: 16),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Total price', style: TextStyle(fontSize: 12)),
                    Text(
                      offer.price,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                AppButton(
                  width: Get.width * 0.60,
                  height: Get.height * 0.02,
                  color: poteaPrimaryColor,
                  shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  onTap: () {},
                  child: Text('Add to Cart', style: TextStyle(fontSize: 16, color: white)),
                ),
              ],
            ),
          ),
          Positioned(top: Get.height * 0.06, left: Get.width * 0.04, child: backButton()),
          Positioned(
            top: Get.height * 0.46,
            left: Get.width * 0.08,
            right: Get.width * 0.08,
            bottom: Get.height * 0.16,
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List<Widget>.generate(
                  detailProductController.plantDetails.length,
                  (index) {
                    return InkWell(
                      onTap: () {
                        detailProductController.pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Container(
                        height: 8,
                        width: detailProductController.currentPage.value == index ? 25 : 8,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: detailProductController.currentPage.value == index ? poteaPrimaryColor : grey,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
