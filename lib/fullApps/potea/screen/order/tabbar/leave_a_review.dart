import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/potea/screen/order/model/order_model.dart';

import '../../../../../main.dart';
import '../../../utils/colors.dart';
import '../../../utils/common_base.dart';
import '../../../utils/image.dart';
import 'leave_a_review_controller.dart';

class LeaveAReview extends StatelessWidget {
  LeaveAReview({super.key, required this.order});

  final LeaveAReviewController controller = Get.put(LeaveAReviewController());
  final OrderModel order;
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Container(
            height: Get.height * 0.75,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: context.cardColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              children: [
                Divider(
                  indent: 3,
                  height: 1,
                  thickness: 3,
                  color: borderColor.withOpacity(0.5),
                ).paddingSymmetric(horizontal: 140),
                SizedBox(height: Get.height * 0.016),
                Center(
                  child: Text(
                    'Leave a Review',
                    style: TextStyle(color: appStore.isDarkModeOn ? white : black, fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: Get.height * 0.016),
                commonDivider,
                Container(
                  height: 129,
                  width: Get.width,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: context.cardColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                        color: appStore.isDarkModeOn ? lightCardConatinerColor : darkCardContainerColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(order.image),
                        ),
                      ),
                      SizedBox(width: Get.width * 0.018),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(order.itemName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          Text('Qty = ${order.quantity}', style: TextStyle(fontSize: 14)),
                          Container(
                            height: Get.height * 0.03,
                            width: Get.width * 0.2,
                            decoration: BoxDecoration(
                              color: appStore.isDarkModeOn ? darkFocusedColor : lightFocusedColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text('Completed', style: TextStyle(fontSize: 12, color: poteaPrimaryColor)),
                            ),
                          ),
                          Text(
                            '\$${order.total}',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: poteaPrimaryColor),
                          ),
                        ],
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 16, vertical: 16),
                ),
                commonDivider,
                SizedBox(height: Get.height * 0.018),
                Text('How is your order?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: Get.height * 0.018),
                Text('Please give your rating & also your review...', style: TextStyle(fontSize: 14, color: lightGrey)),
                SizedBox(height: Get.height * 0.018),
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return IconButton(
                          icon: Icon(
                            index < controller.rating.value ? Icons.star : Icons.star_border,
                            color: index < controller.rating.value ? Colors.green : Colors.grey,
                          ),
                          onPressed: () {
                            controller.updateRating(index + 1);
                          },
                        );
                      }),
                    )),
                SizedBox(height: 16),
                Obx(
                  () => TextField(
                    focusNode: _focusNode,
                    controller: TextEditingController(text: controller.reviewText.value),
                    onChanged: (text) {
                      controller.updateReviewText(text);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                      hintText: 'Amazing plant & fast delivery!🔥🔥🔥',
                      hintStyle: TextStyle(fontSize: 14),
                      suffixIcon: SizedBox(width: 1, child: Image.network(icPictureMain, height: 10, color: poteaPrimaryColor)),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                commonDivider,
                SizedBox(height: Get.height * 0.018),
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        height: Get.height * 0.02,
                        color: appStore.isDarkModeOn ? slateGrey : lightaddressColor,
                        shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                        onTap: () {
                          Get.back();
                        },
                        child: Text('Cancel', style: TextStyle(fontSize: 16, color: appStore.isDarkModeOn ? white : poteaPrimaryColor)),
                      ),
                    ),
                    SizedBox(width: Get.width * 0.02),
                    Expanded(
                      child: AppButton(
                        height: Get.height * 0.02,
                        color: poteaPrimaryColor,
                        shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                        onTap: () {},
                        child: Text('Submit', style: TextStyle(fontSize: 16, color: white)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
