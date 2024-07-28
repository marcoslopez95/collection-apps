import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prokit_flutter/fullApps/adoptify/walkthrough/walkthrough_model.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class WalkThroughController extends GetxController {
  final CarouselController carouselController = CarouselController();
  RxInt selectedPageIndex = 0.obs;

  bool get isLastPage => selectedPageIndex.value == walkthrough.length - 1;
  var pageController = PageController();

  forwardAction() {
    pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  final RxList<WalkThroughModel> walkthrough = RxList<WalkThroughModel>(
    [
      WalkThroughModel(
        title: "Adoptify - Where Furry Tales Begin",
        description: "Embark on a heartwarming journey to find your perfect companion, Swipe, match, and open your heart to a new furry friend",
        lightImage: "${BaseUrl}/images/adoptify/walkthrough/15.png",
        darkImage: "${BaseUrl}/images/adoptify/walkthrough/d15.png",
      ),
      WalkThroughModel(
        title: "Explore a World of Companionship",
        description: "Discover a diverse array of adorable companions, find your favorites, and let the tail-wagging adventure begin",
        lightImage: "${BaseUrl}/images/adoptify/walkthrough/15-2.png",
        darkImage: "${BaseUrl}/images/adoptify/walkthrough/d15-2.png",
      ),
      WalkThroughModel(
        title: "Connect with Caring Pet Owners Around You",
        description: "Easily connect with pet owners ask about animals & make informed decisions. Adoptify is here to guide you every step of the way",
        lightImage: "${BaseUrl}/images/adoptify/walkthrough/15-3.png",
        darkImage: "${BaseUrl}/images/adoptify/walkthrough/d15-3.png",
      ),
    ],
  );
}
