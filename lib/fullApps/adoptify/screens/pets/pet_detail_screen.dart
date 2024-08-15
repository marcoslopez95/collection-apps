import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/adoptify/components/appscaffold.dart';
import 'package:access_maketicket/fullApps/adoptify/components/likebutton_widget.dart';
import 'package:access_maketicket/fullApps/adoptify/utils/cached_image_widget.dart';
import 'package:access_maketicket/main/utils/AppConstant.dart';
import 'package:share/share.dart';

import '../../../../main.dart';
import '../../utils/color.dart';
import '../home/home_controller.dart';
import '../owner_screen/owner_detail.dart';
import 'component/you_may_component.dart';
import 'model/pets_model.dart';

class PetDetailPage extends StatelessWidget {
  final PetsModel pet;

  const PetDetailPage({Key? key, required this.pet});

  @override
  Widget build(BuildContext context) {
    final HomeScreenController controller = Get.put(HomeScreenController());
    final PageController pageController = PageController();

    return AppScaffold(
      isCenterTitle: true,
      appBarTitle: Observer(builder: (context) {
        return Text(
          "Pet Details",
          style: TextStyle(fontSize: 18, color: appStore.isDarkModeOn ? white : black, fontWeight: FontWeight.bold),
        );
      }),
      actions: [
        IconButton(
          onPressed: () {
            Share.share('Check out this pet: ${pet.name}. It is a ${pet.breed ?? "breed not specified"}.');
          },
          icon: Observer(builder: (context) {
            return Image(
              image: NetworkImage("${BaseUrl}/images/adoptify/icons/share.png"),
              color: appStore.isDarkModeOn ? white : black,
              height: 18,
            );
          }),
        ),
        IconButton(
          onPressed: () {},
          icon: Observer(builder: (context) {
            return Image(
              image: NetworkImage("${BaseUrl}/images/adoptify/icons/more.png"),
              color: appStore.isDarkModeOn ? white : black,
              height: 18,
            );
          }),
        ),
      ],
      body: Obx(
        () {
          final petImages = [pet.image, pet.image2, pet.image3].where((image) => image != null).toList();

          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: Get.height * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: adoptifyPrimaryColor.withOpacity(0.5),
                      ),
                      child: Stack(
                        children: [
                          PageView.builder(
                            controller: pageController,
                            scrollDirection: Axis.horizontal,
                            itemCount: petImages.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: Get.width * 0.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: adoptifyPrimaryColor.withOpacity(0.5),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedImageWidget(url: petImages[index]!, fit: BoxFit.cover),
                                ),
                              );
                            },
                            onPageChanged: (index) {
                              controller.imageindex.value = index;
                            },
                          ),
                          Positioned(
                            bottom: 10,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Obx(() => Container(
                                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      "${controller.imageindex.value + 1} / ${petImages.length}",
                                      style: TextStyle(color: Colors.white, fontSize: 16),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.height,
                    Observer(builder: (context) {
                      return Row(
                        children: [
                          Text(
                            pet.name,
                            style: primaryTextStyle(
                              color: appStore.isDarkModeOn ? white : black,
                              size: 16,
                              weight: FontWeight.bold,
                            ),
                          ),
                          10.width,
                          Row(
                            children: [
                              Text(
                                '(',
                                style: secondaryTextStyle(color: appStore.isDarkModeOn ? Colors.white54 : Colors.black54),
                              ),
                              LimitedBox(
                                maxWidth: Get.width * 0.45,
                                child: Text(
                                  ' ${pet.breed ?? ""}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: secondaryTextStyle(
                                    color: appStore.isDarkModeOn ? Colors.white54 : Colors.black54,
                                  ),
                                ),
                              ),
                              Text(
                                ')',
                                style: secondaryTextStyle(color: appStore.isDarkModeOn ? Colors.white54 : Colors.black54),
                              ),
                            ],
                          )
                        ],
                      );
                    }),
                    10.height,
                    Observer(builder: (context) {
                      return Row(
                        children: [
                          Image(
                            image: NetworkImage("${BaseUrl}/images/adoptify/icons/pin.png"),
                            height: 16,
                            color: adoptifyPrimaryColor,
                          ),
                          10.width,
                          Text(
                            pet.distance ?? "",
                            style: secondaryTextStyle(
                              color: appStore.isDarkModeOn ? Colors.white54 : Colors.black54,
                            ),
                          ),
                        ],
                      );
                    }),
                    20.height,
                    Observer(builder: (context) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: Get.height * 0.13,
                            width: Get.width * 0.28,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: appStore.isDarkModeOn ? adoptifyPrimaryColor.withOpacity(0.2) : adoptifyPrimaryColor.withOpacity(0.1)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Gender",
                                  style: primaryTextStyle(color: appStore.isDarkModeOn ? Colors.white54 : Colors.black54, size: 16),
                                ),
                                10.height,
                                Text(
                                  pet.gender ?? "",
                                  style: boldTextStyle(color: appStore.isDarkModeOn ? white : black, size: 16),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: Get.height * 0.13,
                            width: Get.width * 0.28,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: appStore.isDarkModeOn ? blueColor.withOpacity(0.2) : blueColor.withOpacity(0.1)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Age",
                                  style: primaryTextStyle(color: appStore.isDarkModeOn ? Colors.white54 : Colors.black54, size: 16),
                                ),
                                10.height,
                                Text(
                                  pet.age ?? "",
                                  style: secondaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 16, weight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: Get.height * 0.13,
                            width: Get.width * 0.28,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: appStore.isDarkModeOn ? greenColor.withOpacity(0.2) : greenColor.withOpacity(0.1)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Size",
                                  style: primaryTextStyle(color: appStore.isDarkModeOn ? Colors.white54 : Colors.black54, size: 16),
                                ),
                                10.height,
                                Text(
                                  pet.size ?? "",
                                  style: secondaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 16, weight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                    20.height,
                    GestureDetector(
                      onTap: () {
                        Get.to(() => OwnerDetail());
                      },
                      child: Container(
                        height: Get.height * 0.1,
                        decoration: BoxDecoration(
                          color: context.cardColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Observer(builder: (context) {
                          return SettingItemWidget(
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage("${BaseUrl}/images/adoptify/message/5.jpg"),
                            ),
                            title: "Happy Tails Animal Rescue",
                            titleTextStyle: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 16),
                            subTitle: "123 Paws Street, NYC, NY 10001",
                            subTitleMaxLine: 1,
                            subTitleTextStyle: secondaryTextStyle(
                              color: appStore.isDarkModeOn ? Colors.white54 : Colors.black54,
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: Image(
                                image: NetworkImage("${BaseUrl}/images/adoptify/icons/send.png"),
                                height: 22,
                                color: adoptifyPrimaryColor,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    40.height,
                    YouMayAlsoLike(),
                    80.height
                  ],
                ).paddingAll(12),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: context.cardColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LikeButton(pet: pet),
                        20.width,
                        AppButton(
                          width: Get.width,
                          elevation: 0,
                          text: "Adopt",
                          textStyle: primaryTextStyle(size: 20, weight: FontWeight.bold, color: white),
                          color: adoptifyPrimaryColor,
                          shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          onTap: () {
                            //
                          },
                        ).paddingSymmetric(vertical: 20).expand(),
                      ],
                    ).paddingSymmetric(horizontal: 16)),
              ),
            ],
          );
        },
      ),
    );
  }
}
