import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:multi_image_picker_plus/multi_image_picker_plus.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/cloudStorage/components/CSDrawerComponents.dart';
import 'package:access_maketicket/fullApps/cloudStorage/utils/CSColors.dart';
import 'package:access_maketicket/fullApps/cloudStorage/utils/CSImages.dart';
import 'package:access_maketicket/main.dart';

class CSPhotosScreen extends StatefulWidget {
  static String tag = '/CSPhotosScreen';

  @override
  CSPhotosScreenState createState() => CSPhotosScreenState();
}

class CSPhotosScreenState extends State<CSPhotosScreen> {
  List<Asset> images = [];
  String error1 = 'No Error Detected';
  bool isIconShowingOrNot = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  Widget buildGridView() {
    return Container(
      padding: EdgeInsets.all(4),
      child: GridView.count(
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        shrinkWrap: true,
        crossAxisCount: 3,
        children: List.generate(
          images.length,
          (index) {
            Asset asset = images[index];
            return AssetThumb(
              asset: asset,
              width: 300,
              height: 300,
            );
          },
        ),
      ),
    );
  }

  Future<void> loadAssets() async {
    setState(
      () {
        images = [];
      },
    );

    List<Asset> resultList = [];
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        selectedAssets: images,

        androidOptions: AndroidOptions(
          maxImages: 25,
          actionBarColor: Color(0xFF000000),
          actionBarTitle: "Select photos to upload",
          actionBarTitleColor: Color(0xFFFFFFFF),
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: Color(0xFF000000),
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
      print("error : $error");
    }

    setState(
      () {
        images = resultList;
        error1 = error;
      },
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: CSDrawerComponents(),
        appBar: AppBar(
          bottom: TabBar(
            onTap: (val) {
              print(val);
              val == 1 ? isIconShowingOrNot = true : isIconShowingOrNot = false;
              setState(() {});
            },
            tabs: [
              Tab(child: Text("Photos", style: boldTextStyle())),
              Tab(child: Text("Albums", style: boldTextStyle())),
            ],
            //indicatorColor: Colors.black,
            labelStyle: boldTextStyle(color: black.withOpacity(0.5), size: 16),
            unselectedLabelColor: black.withOpacity(0.5),
            labelColor: Colors.black,
          ),
          title: Text('Photos', style: boldTextStyle(size: 20)),
          iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : black),
          actions: isIconShowingOrNot
              ? []
              : [
                  IconButton(
                    icon: Icon(Feather.check_square, size: 20),
                    onPressed: () {},
                  )
                ],
        ),
        body: TabBarView(
          children: [
            Column(
              children: [Expanded(child: buildGridView())],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(CSOfflineImg, width: 150, height: 150),
                16.height,
                Text("No albums yet", style: boldTextStyle(size: 20)),
                16.height,
                Text(
                  "Add some of your photos to an album to see it here!",
                  textAlign: TextAlign.center,
                  style: primaryTextStyle(size: 16),
                ).paddingSymmetric(horizontal: 50),
                16.height,
                Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(color: CSDarkBlueColor),
                  child: Text('Create new album', style: boldTextStyle(color: Colors.white, size: 16)).center(),
                )
              ],
            )
          ],
        ),
        floatingActionButton: isIconShowingOrNot
            ? null
            : FloatingActionButton(
                backgroundColor: CSDarkBlueColor,
                onPressed: loadAssets,
                child: Icon(Icons.add_photo_alternate_outlined, color: Colors.white),
              ),
      ),
    );
  }
}
