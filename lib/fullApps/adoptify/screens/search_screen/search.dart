import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/adoptify/components/appscaffold.dart';
import 'package:prokit_flutter/fullApps/adoptify/screens/search_screen/search_controller.dart';

import '../../../../generated/assets.dart';
import '../../../../main.dart';
import '../../utils/color.dart';
import '../pets/model/pets_model.dart';
import 'components/pet_search.dart';
import 'model/search_model.dart';

class Search extends StatelessWidget {
  final SearchPetController _controller = Get.put(SearchPetController());

  Search({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isCenterTitle: true,
      appBarTitle: Observer(builder: (context) {
        return Text(
          "Pet Search",
          style: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 18, weight: FontWeight.bold),
        );
      }),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Observer(builder: (context) {
                  return Text(
                    "Location",
                    style: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 18, weight: FontWeight.bold),
                  );
                }),
                10.height,
                Observer(builder: (context) {
                  return TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: primaryTextStyle(
                      color: appStore.isDarkModeOn ? white : black,
                    ),
                    controller: _controller.locController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      hintText: 'Enter Location',
                      hintStyle: secondaryTextStyle(
                        color: Colors.grey,
                        size: 16,
                        weight: FontWeight.w300,
                      ),
                      fillColor: context.cardColor,
                      filled: true,
                      prefixIcon: Image(
                        image: AssetImage(Assets.iconsLocation),
                        color: appStore.isDarkModeOn ? grey : Colors.black45,
                        height: 20,
                      ).paddingAll(16),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: context.cardColor)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: adoptifyPrimaryColor, width: 0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  );
                }),
                30.height,
                Observer(builder: (context) {
                  return Text(
                    "Pet Types",
                    style: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 18, weight: FontWeight.bold),
                  );
                }),
                10.height,
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: _controller.pettype.map<Widget>((PetsModel pettype) {
                    return Obx(
                      () => FilterChip(
                        avatar: Image(image: NetworkImage(pettype.image)),
                        label: Observer(builder: (context) {
                          return Text(
                            pettype.name,
                            style: secondaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 16),
                          );
                        }),
                        showCheckmark: false,
                        selected: pettype.selected.value,
                        selectedColor: adoptifyPrimaryColor,
                        backgroundColor: context.cardColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), side: BorderSide(color: Colors.grey)),
                        onSelected: (bool selected) {
                          _controller.togglePetTypeSelection(pettype);
                          if (selected) {
                            // ignore: unused_local_variable
                            int index = _controller.pettype.indexOf(pettype);
                          }
                        },
                      ),
                    );
                  }).toList(),
                ),
                20.height,
                Observer(builder: (context) {
                  return Text(
                    "Gender",
                    style: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 18, weight: FontWeight.bold),
                  );
                }),
                10.height,
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: _controller.gender.map<Widget>((GenderModel gender) {
                    return Obx(
                      () => FilterChip(
                        label: Observer(builder: (context) {
                          return Text(
                            gender.gender ?? "",
                            style: secondaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 16),
                          );
                        }),
                        showCheckmark: false,
                        selected: gender.selected.value,
                        selectedColor: adoptifyPrimaryColor,
                        backgroundColor: context.cardColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), side: BorderSide(color: Colors.grey)),
                        onSelected: (bool selected) {
                          _controller.toggleGenderSelection(gender);
                          if (selected) {
                            // ignore: unused_local_variable
                            int index = _controller.pettype.indexOf(gender);
                          }
                        },
                      ),
                    );
                  }).toList(),
                ),
                20.height,
                Observer(builder: (context) {
                  return Text(
                    "Size",
                    style: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 18, weight: FontWeight.bold),
                  );
                }),
                10.height,
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: _controller.size.map<Widget>((SizeModel petsize) {
                    return Obx(
                      () => FilterChip(
                        label: Observer(builder: (context) {
                          return Text(
                            petsize.size ?? "",
                            style: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 16),
                          );
                        }),
                        showCheckmark: false,
                        selected: petsize.selected.value,
                        selectedColor: adoptifyPrimaryColor,
                        backgroundColor: context.cardColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), side: BorderSide(color: Colors.grey)),
                        onSelected: (bool selected) {
                          _controller.toggleSizeSelection(petsize);
                          if (selected) {
                            // ignore: unused_local_variable
                            int index = _controller.pettype.indexOf(petsize);
                          }
                        },
                      ),
                    );
                  }).toList(),
                ),
                20.height,
                Observer(builder: (context) {
                  return Text(
                    "Age",
                    style: primaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 18, weight: FontWeight.bold),
                  );
                }),
                10.height,
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: _controller.age.map<Widget>((AgeModel petage) {
                    return Obx(
                      () => FilterChip(
                        label: Observer(builder: (context) {
                          return Text(
                            petage.age ?? "",
                            style: secondaryTextStyle(color: appStore.isDarkModeOn ? white : black, size: 16),
                          );
                        }),
                        showCheckmark: false,
                        selected: petage.selected.value,
                        selectedColor: adoptifyPrimaryColor,
                        backgroundColor: context.cardColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), side: BorderSide(color: Colors.grey)),
                        onSelected: (bool selected) {
                          _controller.toggleAgeSelection(petage);
                          if (selected) {
                            // ignore: unused_local_variable
                            int index = _controller.pettype.indexOf(petage);
                          }
                        },
                      ),
                    );
                  }).toList(),
                ),
                120.height,
              ],
            ).paddingAll(Get.height * 0.02),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                width: Get.width,
                decoration: BoxDecoration(color: context.cardColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
                child: AppButton(
                  elevation: 0,
                  text: "Search",
                  textStyle: primaryTextStyle(size: 20, weight: FontWeight.bold, color: white),
                  color: adoptifyPrimaryColor,
                  shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  onTap: () {
                    hideKeyboard(context);
                    Get.to(() => SearchResult());
                  },
                ).paddingSymmetric(vertical: 30, horizontal: 16)),
          ),
        ],
      ),
    );
  }
}
