import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:access_maketicket/main/utils/AppConstant.dart';

import '../../../../../../generated/assets.dart';
import 'model/slider_model.dart';

class SliderController extends GetxController {
  final CarouselController carouselController = CarouselController();
  RxList<SliderModel> imageList = RxList([
    SliderModel(
      description: "See how you can find friends who are a match for you",
      title: "Just About to Adopt Dogs?",
      image: "${BaseUrl}/images/adoptify/icons/dog_dash.png",
    ),
    SliderModel(
      description: "See how you can find friends who are a match for you",
      title: "Just About to Adopt Cats?",
      image: "${BaseUrl}/images/adoptify/pets/cat.png",
    )
  ]);
  RxInt currentindex = 0.obs;
}
