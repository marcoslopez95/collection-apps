import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../main.dart';
import '../../../utils/colors.dart';
import '../../../utils/image.dart';
import '../model/review_model.dart';

class ReviewTile extends StatelessWidget {
  final Review reviewData;

  ReviewTile({required this.reviewData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(reviewData.image),
              ),
              SizedBox(width: 8.0),
              Text(reviewData.name, style: TextStyle(fontWeight: FontWeight.bold)),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: poteaPrimaryColor),
                ),
                child: Row(
                  children: [
                    Image.network(icRatWhite, height: 14, color: poteaPrimaryColor),
                    8.width,
                    Text(reviewData.rating.toString()),
                  ],
                ).paddingSymmetric(horizontal: 16, vertical: 4),
              ),
              8.width,
              Image.network(
                icMore,
                color: appStore.isDarkModeOn ? white : black,
                width: 20,
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(reviewData.review),
          SizedBox(height: 8.0),
          Row(
            children: [
              Image.network(imageLoveFillFinal, color: poteaPrimaryColor, width: 25),
              SizedBox(width: 8.0),
              Text(reviewData.likes.toString()),
              SizedBox(width: 32),
              Text('${reviewData.daysAgo} days ago', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
