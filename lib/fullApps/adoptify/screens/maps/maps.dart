import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/adoptify/components/appscaffold.dart';
import 'package:access_maketicket/fullApps/adoptify/screens/search_screen/search.dart';
import 'package:access_maketicket/main/utils/AppConstant.dart';

import '../../../../generated/assets.dart';
import '../../../../main.dart';
import '../../utils/color.dart';
import 'maps_controller.dart';

class Maps extends StatelessWidget {
  final MapController controller = Get.put(MapController());

  Maps({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return controller.onWillPop(context);
      },
      child: AppScaffold(
        hasLeadingWidget: false,
        leadingWidget: Image(
          image: NetworkImage("${BaseUrl}/images/adoptify/image/adoptify.png"),
          color: adoptifyPrimaryColor,
          height: 30,
        ).paddingOnly(left: Get.width * 0.02),
        isCenterTitle: true,
        appBarTitle: Observer(builder: (context) {
          return Text(
            "Maps",
            style: TextStyle(color: appStore.isDarkModeOn ? white : black, fontWeight: FontWeight.bold, fontSize: 18),
          );
        }),
        actions: [
          Observer(builder: (context) {
            return GestureDetector(
              onTap: () {
                Get.to(() => Search());
              },
              child: Image(
                image: AssetImage(Assets.iconsSearch),
                height: 18,
                color: appStore.isDarkModeOn ? Colors.white70 : Colors.black87,
              ).paddingAll(Get.height * 0.008),
            );
          }),
          10.width,
        ],
        body: Stack(
          children: [
            Observer(
              builder: (context) {
                return GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(51.5072, 0.1276),
                    zoom: 14,
                  ),
                  onMapCreated: controller.onMapCreated,
                  markers: controller.markers,
                  mapType: MapType.normal,
                );
              }
            ),
            Positioned(
              top: Get.height * 0.06,
              bottom: Get.height * 0.63,
              left: Get.width * 0.06,
              right: Get.width * 0.06,
              child: DropdownButtonFormField<String>(
                dropdownColor: context.cardColor,
                style: primaryTextStyle(size: 16),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  hintText: 'Select Radius',
                  hintStyle: secondaryTextStyle(
                    color: Colors.grey,
                    weight: FontWeight.w300,
                  ),
                  fillColor: context.cardColor,
                  filled: true,
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: context.cardColor)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: adoptifyPrimaryColor,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(12),
                    child: Observer(builder: (context) {
                      return Image(
                        image: AssetImage(Assets.iconsLocation),
                        color: appStore.isDarkModeOn ? white : black,
                        height: 15,
                      );
                    }),
                  ),
                ),
                value: controller.selectedRadius.value,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    controller.selectedRadius.value = newValue;
                    controller.radiusController.text = newValue;
                  }
                },
                items: controller.radii.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Observer(builder: (context) {
                      return Text(
                        value,
                        style: TextStyle(color: appStore.isDarkModeOn ? white : black),
                      );
                    }),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
