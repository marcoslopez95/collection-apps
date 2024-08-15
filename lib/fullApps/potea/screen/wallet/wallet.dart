import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/components/app_scaffold.dart';
import 'package:access_maketicket/fullApps/potea/screen/order/transaction_screen.dart';

import '../../../../main.dart';
import '../../components/searchbar_widget.dart';
import '../../utils/colors.dart';
import '../../utils/image.dart';
import '../dashboard/dashboard_controller.dart';
import '../order/e_receipt_screen.dart';
import '../order/order_main_controller.dart';
import 'ewallet/top_up_amount.dart';

class Wallet extends StatelessWidget {
  Wallet({super.key});

  final OrderMainController orderMainController = Get.put(OrderMainController());
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
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
              Text('My E-Wallet', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              16.height,
              Container(
                height: Get.height * 0.25,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(walletTrans), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(30),
                  color: poteaPrimaryColor,
                ),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Andrew Ainsley', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: white)),
                            Spacer(),
                            Image.network(walletVisa, height: Get.height * 0.018),
                            Image.network(walletMastercard, height: Get.height * 0.040),
                          ],
                        ),
                        Text('.... .... .... 3629', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: white)),
                        SizedBox(height: Get.height * 0.020),
                        Text('Your balance', style: TextStyle(color: white)),
                        Row(
                          children: [
                            Text('\$9,449', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: white)),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Get.to(TopUpAmount());
                              },
                              child: Container(
                                height: Get.height * 0.050,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: white),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      walletTopUp,
                                      height: 15,
                                      color: poteaPrimaryColor,
                                    ),
                                    SizedBox(width: Get.width * 0.008),
                                    Text('Top Up  ', style: TextStyle(color: poteaPrimaryColor)),
                                  ],
                                ).paddingAll(8),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ).paddingAll(24),
                  ],
                ),
              ).paddingSymmetric(horizontal: 16),
              16.height,
              Row(
                children: [
                  Text('Transaction History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => TransactionScreen());
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: poteaPrimaryColor),
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 16),
              16.height,
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: orderMainController.orderList.length,
                  itemBuilder: (context, index) {
                    final order = orderMainController.orderList[index];
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.transparent,
                        child: ClipOval(
                          child: Image.network(
                            order.image,
                            fit: BoxFit.cover,
                            width: Get.width * 0.40,
                            height: Get.height * 0.40,
                          ),
                        ),
                      ),
                      title: Row(
                        children: [
                          Text(order.itemName, style: TextStyle(fontSize: 14)),
                          Spacer(),
                          Text('\$' + order.total, style: TextStyle(color: poteaPrimaryColor, fontSize: 14)),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Text(order.date, style: TextStyle(fontSize: 12)),
                          Spacer(),
                          Text(order.category, style: TextStyle(fontSize: 14)),
                        ],
                      ),
                      onTap: () {
                        orderMainController.selectOrder(order);
                        Get.to(() => EReceiptScreen());
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
