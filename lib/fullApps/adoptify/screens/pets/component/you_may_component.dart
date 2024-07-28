import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/adoptify/utils/cached_image_widget.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

import '../../../../../main.dart';
import '../../../utils/color.dart';
import '../../home/components/near_by_pets_component/pets_nearby_controller.dart';
import '../pet_detail_screen.dart';

class YouMayAlsoLike extends StatelessWidget {
  final NearByPetsController _controller = Get.put(NearByPetsController());

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "You May Also Like",
            style: primaryTextStyle(
              color: appStore.isDarkModeOn ? Colors.white : Colors.black,
              size: 16,
              weight: FontWeight.bold,
            ),
          ),
          10.height,
          Obx(
            () => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _controller.nearpet.map(
                  (item) {
                    return Padding(
                      padding: EdgeInsets.all(Get.height * 0.009),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _controller.selectedNearPetIndex.value = _controller.nearpet.indexOf(item);
                              Get.to(
                                () => PetDetailPage(pet: item),
                              );
                            },
                            child: Container(
                              height: Get.height * 0.29,
                              width: Get.width * 0.45,
                              decoration: BoxDecoration(
                                color: context.cardColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: adoptifyPrimaryColor,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(15),
                                            topLeft: Radius.circular(15),
                                          ),
                                        ),
                                        height: Get.height * 0.2,
                                        width: Get.width * 0.45,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),
                                          child: CachedImageWidget(url: item.image, fit: BoxFit.cover),
                                        ),
                                      ),
                                    ],
                                  ),
                                  10.height,
                                  Row(
                                    children: [
                                      Text(
                                        item.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: primaryTextStyle(
                                          size: 16,
                                          weight: FontWeight.w600,
                                          color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                                        ),
                                      ).expand(),
                                    ],
                                  ).paddingSymmetric(horizontal: 8),
                                  10.height,
                                  Row(
                                    children: [
                                      Image.network(
                                        "${BaseUrl}/images/adoptify/icons/pin.png",
                                        height: 20,
                                        color: adoptifyPrimaryColor,
                                      ),
                                      5.width,
                                      Text(
                                        item.distance ?? "",
                                        style: secondaryTextStyle(
                                          size: 14,
                                          color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                                        ),
                                      ),
                                      6.width,
                                      Text(
                                        "-",
                                        style: secondaryTextStyle(
                                          size: 14,
                                          color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                                        ),
                                      ),
                                      6.width,
                                      LimitedBox(
                                        maxWidth: Get.width * 0.2,
                                        child: Text(
                                          item.breed ?? "",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: secondaryTextStyle(
                                            size: 14,
                                            color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                                          ),
                                        ),
                                      ).expand(),
                                    ],
                                  ).paddingSymmetric(horizontal: 8),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ],
      );
    });
  }
}
