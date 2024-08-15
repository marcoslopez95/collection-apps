import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/adoptify/screens/select_pets_category/select_catagory.dart';

import '../../../../main.dart';
import '../home/home_controller.dart';

class SelectPetsCatagory extends StatelessWidget {
  final HomeScreenController _controller = Get.put(HomeScreenController());

  SelectPetsCatagory({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: Get.height * 0.25,
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: _controller.pet.length,
          itemBuilder: (BuildContext context, int index) {
            final pet = _controller.pet[index];
            return GestureDetector(
              onTap: () {
                _controller.selectedPetType.value = index;
                Get.to(() => Selectcategory(categoryName: pet.name));
                print(_controller.selectedPetType.value);
              },
              child: Container(
                child: Column(
                  children: [
                    Container(
                      height: Get.height * 0.067,
                      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: lightGrey, width: Get.width * 0.001)),
                      child: Image(
                        image: NetworkImage(pet.image),
                        height: 80,
                      ).paddingAll(Get.height * 0.01),
                    ),
                    10.height,
                    Observer(builder: (context) {
                      return Text(
                        pet.name,
                        style: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, weight: FontWeight.w600, size: 14),
                      );
                    }),
                  ],
                ),
              ).paddingAll(Get.width * 0.01),
            );
          },
        ),
      ),
    );
  }
}
