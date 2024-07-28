import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/potea/components/app_scaffold.dart';
import 'package:prokit_flutter/fullApps/potea/screen/home/review/review_controller.dart';
import 'package:prokit_flutter/fullApps/potea/screen/home/review/review_tile.dart';

import '../../../../../main.dart';
import '../../../utils/colors.dart';
import '../../../utils/image.dart';

class ReviewsScreen extends StatelessWidget {
  final ReviewsController reviewsController = Get.put(ReviewsController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('4.6 (5,389 reviews)', style: TextStyle(fontSize: 18)),
      actions: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.network(
            icSearch,
            height: 24,
            color: appStore.isDarkModeOn ? white : black,
          ),
        ),
      ],
      body: Column(
        children: [
          16.height,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(
              () => Row(
                children: reviewsController.ratings.map((rating) {
                  final isSelected = reviewsController.selectedRating.value == rating;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      showCheckmark: false,
                      label: Row(
                        children: [
                          Image.network(
                            isSelected ? icRatWhite : icRat,
                            height: 14,
                          ),
                          8.width,
                          Text(rating, style: TextStyle(color: isSelected ? white : poteaPrimaryColor)),
                        ],
                      ),
                      selected: isSelected,
                      onSelected: (isSelected) {
                        reviewsController.selectedRating.value = rating;
                      },
                      selectedColor: poteaPrimaryColor,
                      backgroundColor: context.cardColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: poteaPrimaryColor, width: 1.5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: reviewsController.reviews.length,
                itemBuilder: (context, index) {
                  final review = reviewsController.reviews[index];
                  return ReviewTile(reviewData: review);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
