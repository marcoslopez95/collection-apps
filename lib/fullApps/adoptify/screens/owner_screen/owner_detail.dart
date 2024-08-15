import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/adoptify/components/appscaffold.dart';
import 'package:access_maketicket/main/utils/AppConstant.dart';

import '../../../../main.dart';
import '../../utils/color.dart';
import '../../utils/constants.dart';
import 'ownerdetail_controller.dart';

class OwnerDetail extends StatelessWidget {
  final OwnerDetailController controller = Get.put(OwnerDetailController());

  OwnerDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return AppScaffold(
        isCenterTitle: true,
        appBarTitle: Observer(builder: (context) {
          return Text(
            "Owner / Organization",
            style: primaryTextStyle(size: 18, color: appStore.isDarkModeOn ? white : black, weight: FontWeight.bold),
          );
        }),
        actions: [
          Observer(builder: (context) {
            return IconButton(
              onPressed: () {},
              icon: Image(
                image: NetworkImage("${BaseUrl}/images/adoptify/icons/more.png"),
                color: appStore.isDarkModeOn ? white : black,
                height: 18,
              ),
            );
          }),
        ],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: Get.width * 0.1,
                      backgroundImage: NetworkImage("${BaseUrl}/images/adoptify/message/5.jpg"),
                    ).paddingRight(12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Happy Tails Animal Rescue",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, weight: FontWeight.bold),
                        ).paddingBottom(8),
                        Row(
                          children: [
                            Image(
                              image: NetworkImage("${BaseUrl}/images/adoptify/navigation/location_fill.png"),
                              height: 16,
                              color: adoptifyPrimaryColor,
                            ).paddingRight(8),
                            LimitedBox(
                              maxWidth: Get.width * 0.45,
                              child: Text(
                                "123 Paws Street, NYC, NY 10001",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: secondaryTextStyle(color: appStore.isDarkModeOn ? Colors.white54 : Colors.black54, size: 14),
                              ),
                            ),
                          ],
                        ).paddingBottom(Get.height * 0.01),
                        Row(
                          children: [
                            Icon(
                              Icons.call_rounded,
                              color: adoptifyPrimaryColor,
                              size: 16,
                            ).paddingRight(Get.width * 0.02),
                            LimitedBox(
                              maxWidth: Get.width * 0.45,
                              child: Text(
                                "(555) 123-4567",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: secondaryTextStyle(
                                  color: appStore.isDarkModeOn ? Colors.white54 : Colors.black54,
                                  size: 14,
                                ),
                              ),
                            ),
                          ],
                        ).paddingBottom(Get.height * 0.01),
                        Row(
                          children: [
                            Image(
                              image: NetworkImage("${BaseUrl}/images/adoptify/icons/ic_mail.png"),
                              height: 16,
                              color: adoptifyPrimaryColor,
                            ).paddingRight(Get.width * 0.02),
                            LimitedBox(
                              maxWidth: Get.width * 0.45,
                              child: Text(
                                "info@happytailsrecuse.org",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: secondaryTextStyle(
                                  color: appStore.isDarkModeOn ? Colors.white54 : Colors.black54,
                                  size: 14,
                                ),
                              ),
                            ),
                          ],
                        ).paddingBottom(Get.height * 0.01),
                        Row(
                          children: [
                            Image(
                              image: NetworkImage("${BaseUrl}/images/adoptify/navigation/direction.png"),
                              height: 16,
                              color: adoptifyPrimaryColor,
                            ).paddingRight(Get.width * 0.02),
                            LimitedBox(
                              maxWidth: Get.width * 0.45,
                              child: Text(
                                "info@happytailsrecuse.org",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: secondaryTextStyle(
                                  color: appStore.isDarkModeOn ? Colors.white54 : Colors.black54,
                                  size: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ).expand(),
                  ],
                ).paddingAll(Get.height * 0.02),
              ),
              30.height,
              Container(
                height: Get.height * 0.15,
                decoration: BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFF4BAF58)),
                          child: Icon(
                            Icons.call_rounded,
                            size: 20,
                            color: white,
                          ).paddingAll(16),
                        ),
                        10.height,
                        Text(
                          "Phone",
                          style: primaryTextStyle(size: 16, color: appStore.isDarkModeOn ? white : black),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF1C91E9),
                          ),
                          child: Image(
                            image: NetworkImage("${BaseUrl}/images/adoptify/icons/ic_mail.png"),
                            height: 20,
                            color: whiteColor,
                          ).paddingAll(16),
                        ),
                        10.height,
                        Text(
                          "Email",
                          style: primaryTextStyle(size: 16, color: appStore.isDarkModeOn ? white : black),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFFF34140)),
                          child: Image(
                            image: NetworkImage("${BaseUrl}/images/adoptify/navigation/direction.png"),
                            height: 18,
                            color: whiteColor,
                          ).paddingAll(16),
                        ),
                        10.height,
                        Text(
                          "Website",
                          style: primaryTextStyle(size: 16, color: appStore.isDarkModeOn ? white : black),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFFEC9126)),
                          child: Image(
                            image: NetworkImage("${BaseUrl}/images/adoptify/icons/send.png"),
                            height: 18,
                            color: whiteColor,
                          ).paddingAll(16),
                        ),
                        10.height,
                        Text(
                          "Navigate",
                          style: primaryTextStyle(size: 16, color: appStore.isDarkModeOn ? white : black),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              20.height,
              Text(
                "Adoption Policy",
                style: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 16, weight: FontWeight.bold),
              ),
              20.height,
              Container(
                decoration: BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    tile(context, "Happy Tail Animal Rescuse", AdoptionPolicy.HappyTailAnimalRescuse),
                    10.height,
                    tile(context, "1. Adoption Application", AdoptionPolicy.AdoptionApplication),
                    10.height,
                    tile(context, "2. Home Visit", AdoptionPolicy.HomeVisit),
                    10.height,
                    tile(context, "3. Meet and Greet", AdoptionPolicy.MeetandGreet),
                    10.height,
                    tile(context, "4. Adoption Fee", AdoptionPolicy.AdoptionFee),
                    10.height,
                    tile(context, "5. Trial Period", AdoptionPolicy.TrialPeriod),
                    10.height,
                    tile(context, "6. Post Adoption Support", AdoptionPolicy.PostAdoptionSupport),
                  ],
                ).paddingAll(16),
              ),
            ],
          ).paddingAll(16),
        ),
      );
    });
  }

  Widget tile(
    BuildContext context,
    String title,
    String subtitle,
  ) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: primaryTextStyle(
          size: 16,
          color: appStore.isDarkModeOn ? white : black,
          weight: FontWeight.bold,
        ),
      ).paddingBottom(5),
      subtitle: Text(
        subtitle,
        style: secondaryTextStyle(
          size: 16,
          color: appStore.isDarkModeOn ? Colors.white70 : Colors.black87,
        ),
      ),
    ).paddingBottom(9);
  }
}
