import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../components/cached_image_widget.dart';
import '../../../components/view_all_label_component.dart';
import '../model/dashboard_data_model.dart';

class FavouriteMusicComponent extends StatefulWidget {
  @override
  _FavouriteMusicComponentState createState() => _FavouriteMusicComponentState();
}

class _FavouriteMusicComponentState extends State<FavouriteMusicComponent> {
  List<DashBoardDataModel> favouriteMusicDataList = getFavouriteMusicList();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViewAllLabel(
          label: 'Your Favorites',
          onTap: () {
            //
          },
        ).paddingSymmetric(horizontal: 16),
        12.height,
        HorizontalList(
          spacing: 16,
          runSpacing: 0,
          padding: EdgeInsets.symmetric(horizontal: 16),
          itemCount: favouriteMusicDataList.length,
          itemBuilder: (context, index) {
            DashBoardDataModel favouriteMusicData = favouriteMusicDataList[index];
            return Container(
              width: 130,
              decoration: boxDecorationDefault(
                color: Colors.grey.withAlpha(25),
                borderRadius: radius(18),
                boxShadow: defaultBoxShadow(blurRadius: 0, shadowColor: Colors.black.withAlpha(20), spreadRadius: 0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedImageWidget(
                    url: favouriteMusicData.img.validate(),
                    height: 90,
                    width: context.width(),
                    fit: BoxFit.cover,
                  ).cornerRadiusWithClipRRect(18).paddingAll(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Marquee(child: Text(favouriteMusicData.trackTitle.validate(), style: primaryTextStyle(color: whiteColor))),
                      6.height,
                      Marquee(child: Text(favouriteMusicData.trackSubTitle.validate(), style: secondaryTextStyle())),
                    ],
                  ).paddingAll(10),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
