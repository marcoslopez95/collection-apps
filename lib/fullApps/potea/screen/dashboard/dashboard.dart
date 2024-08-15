import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/colors.dart';
import '../../utils/image.dart';
import '../cart/cart.dart';
import '../order/order_screen.dart';
import '../profile/profile_screen.dart';
import '../wallet/wallet.dart';
import 'dashboard_controller.dart';
import 'package:access_maketicket/fullApps/potea/screen/home/home_screen.dart';

class DashboardScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          Widget currentWidget;
          switch (homeController.selectedIndex.value) {
            case 0:
              currentWidget = HomeScreen();
              break;
            case 1:
              currentWidget = Cart();
              break;
            case 2:
              currentWidget = NestedTabBar();
              break;
            case 3:
              currentWidget = Wallet();
              break;
            case 4:
              currentWidget = ProfileScreen();
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
          selectedItemColor: poteaPrimaryColor,
          unselectedItemColor: Colors.grey,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.network(
                homeController.selectedIndex.value == 0 ? icHomeFill : icHome,
                height: 20,
                color: homeController.selectedIndex.value == 0 ? poteaPrimaryColor : grey,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.network(
                homeController.selectedIndex.value == 1 ? icCartFill : icCart,
                height: 20,
                color: homeController.selectedIndex.value == 1 ? poteaPrimaryColor : grey,
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Image.network(
                homeController.selectedIndex.value == 2 ? icOrderMainFill : icOrderMain,
                height: 20,
                color: homeController.selectedIndex.value == 2 ? poteaPrimaryColor : grey,
              ),
              label: 'Order',
            ),
            BottomNavigationBarItem(
              icon: Image.network(
                homeController.selectedIndex.value == 3 ? icWalletFillWhite : icWallet,
                height: 20,
                color: homeController.selectedIndex.value == 3 ? poteaPrimaryColor : grey,
              ),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: Image.network(
                homeController.selectedIndex.value == 4 ? icProfileFillMain : icProfileMain,
                height: 20,
                color: homeController.selectedIndex.value == 4 ? poteaPrimaryColor : grey,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: homeController.selectedIndex.value,
          onTap: (index) {
            homeController.selectedIndex.value = index;
          },
        ),
      ),
    );
  }
}
