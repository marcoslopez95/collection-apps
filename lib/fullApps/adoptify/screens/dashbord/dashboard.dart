import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/adoptify/screens/chat/chat_screen.dart';
import 'package:prokit_flutter/fullApps/adoptify/screens/favorites/favorite_screen.dart';
import 'package:prokit_flutter/fullApps/adoptify/screens/maps/maps.dart';
import 'package:prokit_flutter/fullApps/adoptify/screens/profile/profile.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

import '../../../../generated/assets.dart';
import '../../utils/color.dart';
import '../home/home.dart';
import 'dashboard_controller.dart';

class Dashboard extends StatelessWidget {
  final DashboardController homeController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () {
            Widget currentWidget;
            switch (homeController.selectedIndex.value) {
              case 0:
                currentWidget = HomeScreen();
                break;
              case 1:
                currentWidget = Maps();
                break;
              case 2:
                currentWidget = FavoritePetsPage();
                break;
              case 3:
                currentWidget = Message();
                break;
              case 4:
                currentWidget = Profile();
                break;
              default:
                currentWidget = HomeScreen();
            }
            return currentWidget;
          },
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            backgroundColor: context.scaffoldBackgroundColor,
            selectedItemColor: adoptifyPrimaryColor,
            unselectedItemColor: adoptifyPrimaryColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image(
                  image: NetworkImage(
                    homeController.selectedIndex.value == 0 ? "${BaseUrl}/images/adoptify/navigation/home_fill.png" : "${BaseUrl}/images/adoptify/navigation/home_outline.png",
                  ),
                  height: 22,
                  color: homeController.selectedIndex.value == 0 ? adoptifyPrimaryColor : grey,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image(
                  image: NetworkImage(
                    homeController.selectedIndex.value == 1 ? "${BaseUrl}/images/adoptify/navigation/location_fill.png" : "${BaseUrl}/images/adoptify/navigation/location_outline.png",
                  ),
                  color: homeController.selectedIndex.value == 1 ? adoptifyPrimaryColor : grey,
                  height: 22,
                ),
                label: 'Maps',
              ),
              BottomNavigationBarItem(
                icon: Image(
                  image: NetworkImage(
                    homeController.selectedIndex.value == 2 ? "${BaseUrl}/images/adoptify/navigation/favorite_fill.png" : "${BaseUrl}/images/adoptify/navigation/favorite_outline.png",
                  ),
                  color: homeController.selectedIndex.value == 2 ? adoptifyPrimaryColor : grey,
                  height: 22,
                ),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Image(
                  image: NetworkImage(
                    homeController.selectedIndex.value == 3 ? "${BaseUrl}/images/adoptify/navigation/message_fill.png" : "${BaseUrl}/images/adoptify/navigation/message_outline.png",
                  ),
                  color: homeController.selectedIndex.value == 3 ? adoptifyPrimaryColor : grey,
                  height: 22,
                ),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: Image(
                  image: NetworkImage(
                    homeController.selectedIndex.value == 4 ? "${BaseUrl}/images/adoptify/navigation/profile_fill.png" : "${BaseUrl}/images/adoptify/navigation/profile_outline.png",
                  ),
                  color: homeController.selectedIndex.value == 4 ? adoptifyPrimaryColor : grey,
                  height: 22,
                ),
                label: 'Profile',
              ),
            ],
            currentIndex: homeController.selectedIndex.value,
            onTap: (index) {
              homeController.changePage(index);
            },
          ),
        ),
      ),
    );
  }
}
