import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/adoptify/components/appscaffold.dart';
import 'package:access_maketicket/fullApps/adoptify/screens/search_screen/search.dart';
import 'package:access_maketicket/main/utils/AppConstant.dart';

import '../../../../generated/assets.dart';
import '../../../../main.dart';
import '../../utils/color.dart';
import '../notification_screen/notification.dart';
import '../select_pets_category/select_pet.dart';
import 'blog/blogs_screen.dart';
import 'components/near_by_pets_component/pets_nearby.dart';
import 'components/slider_component/slider.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenController controller = Get.put(HomeScreenController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return controller.onWillPop(context);
      },
      child: AppScaffold(
        hasLeadingWidget: false,
        leadingWidget: Image(
          image: NetworkImage("${BaseUrl}/images/adoptify/image/adoptify.png"),
          color: adoptifyPrimaryColor,
          height: 30,
        ).paddingOnly(left: Get.width * 0.02),
        isCenterTitle: true,
        appBarTitle: Observer(builder: (context) {
          return Text(
            "Adoptify",
            style: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, weight: FontWeight.bold, size: 18),
          );
        }),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => Search());
            },
            child: Observer(builder: (context) {
              return Container(
                decoration: BoxDecoration(border: Border.all(color: appStore.isDarkModeOn ? Colors.white24 : Colors.black38), shape: BoxShape.circle),
                child: Image(
                  image: AssetImage(Assets.iconsSearch),
                  height: 18,
                  color: appStore.isDarkModeOn ? Colors.white70 : Colors.black87,
                ).paddingAll(Get.height * 0.008),
              );
            }),
          ),
          10.width,
          GestureDetector(
            onTap: () {
              Get.to(() => NotificationScreen());
            },
            child: Stack(
              children: [
                Observer(builder: (context) {
                  return Container(
                    decoration: BoxDecoration(border: Border.all(color: appStore.isDarkModeOn ? Colors.white24 : Colors.black26), shape: BoxShape.circle),
                    child: Image(
                      image: NetworkImage("${BaseUrl}/images/adoptify/icons/notification-bell.png"),
                      height: 18,
                      color: appStore.isDarkModeOn ? Colors.white70 : Colors.black87,
                    ).paddingAll(8),
                  );
                }),
                Positioned(
                  top: 10,
                  bottom: 20,
                  right: 4,
                  left: 12,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  ),
                ),
              ],
            ),
          ).paddingOnly(right: Get.width * 0.04),
        ],
        body: SingleChildScrollView(
          child: Column(
            children: [
              SliderWidget(),
              SelectPetsCatagory(),
              NearByPets(),
              Blogs(),
            ],
          ),
        ),
      ),
    );
  }
}
