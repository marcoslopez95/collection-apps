import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/components/app_scaffold.dart';
import 'package:access_maketicket/fullApps/potea/screen/order/tab_bar_controller.dart';

import '../../../../main.dart';
import '../../components/searchbar_widget.dart';
import '../../utils/colors.dart';
import '../../utils/image.dart';
import '../dashboard/dashboard_controller.dart';
import 'order_main_controller.dart';
import 'order_tab_widget.dart';

class NestedTabBar extends StatelessWidget {
  NestedTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TabBarController controller = Get.put(TabBarController());
    final TabController tabController = TabController(length: 2, vsync: Scaffold.of(context));
    HomeController homeController = Get.put(HomeController());

    tabController.addListener(() {
      controller.changeIndex(tabController.index);
    });

    return WillPopScope(
      onWillPop: () async {
        return homeController.onWillPop(context);
      },
      child: AppScaffold(
        hasLeadingWidget: false,
        actions: [
          InkWell(
            onTap: () {
              Get.to(() => SearchBarWidget());
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.network(
                icSearch,
                height: 24,
                color: appStore.isDarkModeOn ? white : black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.network(
              icMore,
              color: appStore.isDarkModeOn ? white : black,
              width: 23,
            ),
          ),
          8.width,
        ],
        appBarTitle: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(assetsPoteaLogo, height: 28),
              SizedBox(width: Get.width * 0.03),
              Text('My Orders', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            TabBar(
              controller: tabController,
              tabs: const <Widget>[
                Tab(text: 'Active'),
                Tab(text: 'Completed'),
              ],
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 4.0, color: poteaPrimaryColor),
                insets: EdgeInsets.symmetric(horizontal: Get.height * 0.15),
              ),
              labelColor: poteaPrimaryColor,
              unselectedLabelColor: lightGrey,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: <Widget>[
                  ActiveList(),
                  CompletedList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActiveList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OrderMainController ordercontroller = Get.put(OrderMainController());
    return ListView.builder(
      itemCount: ordercontroller.orderList.length,
      itemBuilder: (context, index) {
        final order = ordercontroller.orderList[index];
        return OrderTabWidget(order: order, isActive: true).paddingOnly(top: 16);
      },
    ).paddingSymmetric(horizontal: 16);
  }
}

class CompletedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OrderMainController ordercontroller = Get.put(OrderMainController());
    return ListView.builder(
      itemCount: ordercontroller.orderList.length,
      itemBuilder: (context, index) {
        final order = ordercontroller.orderList[index];
        return OrderTabWidget(order: order, isActive: false).paddingOnly(top: 16);
      },
    ).paddingSymmetric(horizontal: 16);
  }
}
