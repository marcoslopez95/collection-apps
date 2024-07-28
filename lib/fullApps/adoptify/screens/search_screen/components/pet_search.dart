import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/adoptify/components/appscaffold.dart';
import 'package:prokit_flutter/fullApps/adoptify/screens/search_screen/components/petsearch_controller.dart';
import 'package:prokit_flutter/fullApps/adoptify/screens/search_screen/search.dart';
import 'package:prokit_flutter/fullApps/adoptify/utils/cached_image_widget.dart';
import 'package:prokit_flutter/fullApps/adoptify/utils/color.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

import '../../../../../generated/assets.dart';
import '../../../../../main.dart';
import '../../pets/pet_detail_screen.dart';

class SearchResult extends StatelessWidget {
  SearchResult({super.key});

  final PetSearchController controller = Get.put(PetSearchController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isCenterTitle: true,
      appBarTitle: Observer(builder: (context) {
        return Text(
          "Search Results",
          style: primaryTextStyle(size: 18, color: appStore.isDarkModeOn ? white : black, weight: FontWeight.bold),
        );
      }),
      actions: [
        GestureDetector(
          onTap: () {
            Get.off(() => Search());
          },
          child: Observer(builder: (context) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: appStore.isDarkModeOn ? Colors.white24 : Colors.black38,
                ),
                shape: BoxShape.circle,
              ),
              child: Image(
                image: AssetImage(Assets.iconsSearch),
                height: 18,
                color: appStore.isDarkModeOn ? Colors.white70 : Colors.black87,
              ).paddingAll(Get.height * 0.008),
            );
          }),
        ).paddingRight(16),
      ],
      body: Column(
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
          Obx(() {
            if (controller.selectedCategory.value.isNotEmpty) {
              return Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 3 / 4,
                  ),
                  itemCount: controller.getAnimalsList().length,
                  itemBuilder: (context, index) {
                    final animal = controller.getAnimalsList()[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => PetDetailPage(pet: animal));
                      },
                      child: Container(
                        height: Get.height * 0.3,
                        width: Get.width * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: context.cardColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: Get.height * 0.2,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                    child: CachedImageWidget(url: animal.image, fit: BoxFit.cover),
                                  ),
                                ),
                              ],
                            ),
                            Observer(builder: (context) {
                              return Text(
                                animal.name,
                                style: primaryTextStyle(
                                  size: 16,
                                  weight: FontWeight.w600,
                                  color: appStore.isDarkModeOn ? white : black,
                                ),
                              ).paddingSymmetric(horizontal: Get.width * 0.02, vertical: Get.height * 0.005);
                            }),
                            Observer(builder: (context) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.network(
                                    "${BaseUrl}/images/adoptify/icons/pin.png",
                                    height: 20,
                                    color: adoptifyPrimaryColor,
                                  ),
                                  5.width,
                                  Text(
                                    animal.distance ?? "",
                                    style: secondaryTextStyle(
                                      size: 14,
                                      color: appStore.isDarkModeOn ? white : black,
                                    ),
                                  ),
                                  6.width,
                                  Text(
                                    "-",
                                    style: secondaryTextStyle(
                                      size: 14,
                                      color: appStore.isDarkModeOn ? white : black,
                                    ),
                                  ),
                                  6.width,
                                  LimitedBox(
                                    maxWidth: Get.width * 0.15,
                                    child: Text(
                                      animal.breed ?? "",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: secondaryTextStyle(
                                        size: 14,
                                        color: appStore.isDarkModeOn ? white : black,
                                      ),
                                    ),
                                  ),
                                ],
                              ).paddingSymmetric(horizontal: 5);
                            })
                          ],
                        ),
                      ).paddingAll(3),
                    );
                  },
                ),
              );
            }
            return Container();
          }),
        ],
      ),
    );
  }

  Widget buildCategoryItem(String category, String imageAsset) {
    return Observer(builder: (context) {
      return Obx(
        () => GestureDetector(
          onTap: () {
            controller.selectCategory(category);
          },
          child: Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8),
            height: Get.height * 0.05,
            decoration: BoxDecoration(
              color: controller.selectedCategory.value == category ? adoptifyPrimaryColor : null,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: appStore.isDarkModeOn ? Colors.white24 : Colors.black38,
              ),
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
