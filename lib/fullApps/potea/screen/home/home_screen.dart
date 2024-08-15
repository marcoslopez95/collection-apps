import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/components/app_scaffold.dart';
import 'package:access_maketicket/fullApps/potea/screen/home/notification/notification_screen.dart';
import 'package:access_maketicket/fullApps/potea/screen/home/special_offer_component/Special_offer_home_component.dart';
import 'package:access_maketicket/fullApps/potea/screen/home/whishlist/whishlist_controller.dart';
import 'package:access_maketicket/fullApps/potea/screen/home/whishlist/whishlist_screen.dart';
import 'package:access_maketicket/fullApps/potea/utils/common_base.dart';

import '../../components/searchbar_widget.dart';
import '../../utils/colors.dart';
import '../../utils/image.dart';
import '../dashboard/dashboard_controller.dart';
import 'filter/filter_screen.dart';
import 'most_popular_component/most_popular_home_component.dart';

class HomeScreen extends StatelessWidget {
  final WishlistController wishlistController = Get.put(WishlistController());

  HomeScreen({super.key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return homeController.onWillPop(context);
      },
      child: AppScaffold(
        hasLeadingWidget: false,
        actions: [
          IconButton(
            onPressed: () {
              hideKeyboard(context);
              Get.to(
                NotificationScreen(),
              );
            },
            icon: icNotification.iconImage(fit: BoxFit.contain, size: 23),
          ),
          IconButton(
            onPressed: () {
              hideKeyboard(context);
              Get.to(() => WishlistScreen());
            },
            icon: icHeart.iconImage(fit: BoxFit.contain, size: 23),
          ),
          8.width,
        ],
        appBarTitle: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(userIm),
              ),
              SizedBox(width: Get.width * 0.03),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Good Morning 👋', style: TextStyle(color: Colors.grey, fontSize: 14)),
                  Text('Andrew Ainsley', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
                    hintText: 'Search Here',
                    hintStyle: TextStyle(color: Colors.grey.shade500),
                    prefixIcon: Icon(Icons.search_rounded, color: Colors.grey.shade500),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Image.network(icFlt, width: 24, color: poteaPrimaryColor),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return filter_bottom();
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  onTap: () {
                    Get.to(() => SearchBarWidget());
                  },
                ),
              ),
              SizedBox(height: 20),
              SpecialOffer(),
              SizedBox(height: 20),
              MostPopularOffer(),
              30.height,
            ],
          ),
        ),
      ),
    );
  }
}
