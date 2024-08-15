import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/adoptify/components/appscaffold.dart';
import 'package:access_maketicket/fullApps/adoptify/components/likebutton_widget.dart';
import 'package:access_maketicket/fullApps/adoptify/screens/favorites/favorite_controller.dart';
import 'package:access_maketicket/fullApps/adoptify/screens/pets/pet_detail_screen.dart';
import 'package:access_maketicket/fullApps/adoptify/screens/search_screen/search.dart';
import 'package:access_maketicket/fullApps/adoptify/utils/cached_image_widget.dart';
import 'package:access_maketicket/main/utils/AppConstant.dart';

import '../../../../generated/assets.dart';
import '../../../../main.dart';
import '../../utils/color.dart';

class FavoritePetsPage extends StatelessWidget {
  final FavoritePetsController _favController = Get.find();

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return _favController.onWillPop(context);
      },
      child: AppScaffold(
        isCenterTitle: true,
        hasLeadingWidget: false,
        leadingWidget: Image(
          image: NetworkImage("${BaseUrl}/images/adoptify/image/adoptify.png"),
          color: adoptifyPrimaryColor,
          height: 30,
        ).paddingOnly(left: Get.width * 0.02),
        appBarTitle: Observer(builder: (context) {
          return Text(
            "Favorites",
            style: primaryTextStyle(weight: FontWeight.bold, color: appStore.isDarkModeOn ? white : black, size: 18),
          );
        }),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => Search());
            },
            child: Observer(builder: (context) {
              return Image(
                image: AssetImage(Assets.iconsSearch),
                height: 18,
                color: appStore.isDarkModeOn ? Colors.white70 : Colors.black87,
              ).paddingRight(Get.width * 0.04);
            }),
          ),
        ],
        body: Obx(
          () {
            final petList = _favController.favoritePets;

            if (petList.isEmpty) {
              return Center(
                child: Observer(builder: (context) {
                  return Text(
                    "No favorite pets yet!",
                    style: TextStyle(
                      fontSize: Get.width * 0.050,
                      color: appStore.isDarkModeOn ? white : black,
                    ),
                  );
                }),
              );
            }

            return Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildCategoryItem('Cats', "${BaseUrl}/images/adoptify/pets/cat.png"),
                      buildCategoryItem('Dogs', "${BaseUrl}/images/adoptify/pets/dog.png"),
                      buildCategoryItem('Birds', "${BaseUrl}/images/adoptify/pets/parrot.png"),
                      buildCategoryItem('Horses', "${BaseUrl}/images/adoptify/pets/horse.png"),
                      buildCategoryItem('Rabbits', "${BaseUrl}/images/adoptify/pets/rabbit.png"),
                      buildCategoryItem('Reptiles', "${BaseUrl}/images/adoptify/pets/snake.png"),
                      buildCategoryItem('Fish', "${BaseUrl}/images/adoptify/pets/fish.png"),
                      buildCategoryItem('Primates', "${BaseUrl}/images/adoptify/pets/monkey.png"),
                    ],
                  ),
                ),
                GridView.builder(
                  padding: EdgeInsets.all(Get.height * 0.02),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 3 / 4,
                  ),
                  itemCount: petList.length,
                  itemBuilder: (context, index) {
                    final item = petList[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => PetDetailPage(pet: item));
                      },
                      child: Container(
                        decoration: BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      topLeft: Radius.circular(15),
                                    ),
                                  ),
                                  height: Get.height * 0.18,
                                  width: Get.width * 0.45,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                    child: CachedImageWidget(url: item.image, fit: BoxFit.cover),
                                  ),
                                ),
                                Positioned(
                                  top: Get.height * 0.016,
                                  bottom: Get.height * 0.12,
                                  right: Get.width * 0.02,
                                  left: Get.width * 0.3,
                                  child: LikeButton(pet: item),
                                ),
                              ],
                            ),
                            10.height,
                            Observer(builder: (context) {
                              return Text(
                                item.name,
                                style: primaryTextStyle(
                                  size: 16,
                                  weight: FontWeight.w600,
                                  color: appStore.isDarkModeOn ? white : black,
                                ),
                              );
                            }).paddingSymmetric(horizontal: 10),
                            10.height,
                            Observer(builder: (context) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.network(
                                    "${BaseUrl}/images/adoptify/icons/pin.png",
                                    height: 18,
                                    color: adoptifyPrimaryColor,
                                  ),
                                  5.width,
                                  Text(
                                    item.distance ?? "",
                                    style: secondaryTextStyle(
                                      size: 14,
                                      color: appStore.isDarkModeOn ? white : black,
                                    ),
                                  ).paddingRight(Get.width * 0.006),
                                  Text(
                                    "-",
                                    style: secondaryTextStyle(
                                      size: 14,
                                      color: appStore.isDarkModeOn ? white : black,
                                    ),
                                  ).paddingRight(Get.width * 0.006),
                                  LimitedBox(
                                    maxWidth: Get.width * 0.17,
                                    child: Text(
                                      item.breed ?? "",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: primaryTextStyle(
                                        size: 14,
                                        color: appStore.isDarkModeOn ? white : black,
                                      ),
                                    ),
                                  ).expand(),
                                ],
                              ).paddingSymmetric(horizontal: 10);
                            }),
                          ],
                        ),
                      ).paddingAll(Get.height * 0.007),
                    );
                  },
                ).expand(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildCategoryItem(String category, String imageAsset) {
    return Observer(builder: (context) {
      return Obx(
        () => GestureDetector(
          onTap: () {
            _favController.selectCategory(category);
          },
          child: Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8),
            height: Get.height * 0.05,
            decoration: BoxDecoration(
              color: _favController.selectedCategory == category ? adoptifyPrimaryColor : null,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: appStore.isDarkModeOn ? Colors.white24 : Colors.black38),
            ),
            child: Row(
              children: [
                Image.network(imageAsset, height: 50),
                SizedBox(height: 8.0),
                Text(
                  category,
                  style: primaryTextStyle(
                    color: appStore.isDarkModeOn ? white : black,
                    size: 16,
                    weight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
