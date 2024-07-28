import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';

import '../../../../main.dart' as main;
import '../../../../main.dart';
import 'model/map_model.dart';

class MapController extends GetxController {
  List<MapModel> mapModel = <MapModel>[].obs;
  var markers = RxSet<Marker>();
  var isLoading = false.obs;
  var selectedRadius = '5m'.obs;
  var radiusController = TextEditingController();
  Completer<GoogleMapController> _controller = Completer();

  List<String> radii = ['5m', '10m', '15m', '20m', '25m', '30m'];

  fetchLocations() async {
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.tryParse('{YOUR_URL}')!);
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);
        log(result.toString());
        mapModel.addAll(RxList<Map<String, dynamic>>.from(result).map((e) => MapModel.fromJson(e)).toList());
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isLoading(false);
      print('finaly: $mapModel');
      createMarkers();
    }
  }

  void onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    if (main.appStore.isDarkModeOn) {
      _controller.future.then((value) => value.setMapStyle(darkMapStyle));
    } else {
      _controller.future.then((value) => value.setMapStyle(lightMapStyle));
    }
  }

  createMarkers() {
    mapModel.forEach(
      (element) {
        markers.add(
          Marker(
            markerId: MarkerId(element.id.toString()),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            position: LatLng(element.latitude, element.longitude),
            infoWindow: InfoWindow(title: element.name, snippet: element.city),
            onTap: () {
              print('market tapped');
            },
          ),
        );
      },
    );
  }

  var lastBackPressTime = 0.obs;

  bool onWillPop(BuildContext context) {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    if (currentTime - lastBackPressTime.value < 2000) {
      return true; // Exit the app
    } else {
      lastBackPressTime.value = currentTime;
      toast('Press Back Again to Exit');
      return false;
    }
  }
}
