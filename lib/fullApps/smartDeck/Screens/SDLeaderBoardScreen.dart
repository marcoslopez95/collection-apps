import 'package:access_maketicket/fullApps/carea/commons/colors.dart';
import 'package:access_maketicket/src/Model/PurchaseOrder.dart';
import 'package:access_maketicket/src/Services/PurchaseOrderService.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/smartDeck/ModelClass/SDLeaderboardModel.dart';
import 'package:access_maketicket/fullApps/smartDeck/SDUtils/SDColors.dart';
import 'package:access_maketicket/fullApps/smartDeck/SDUtils/SDStyle.dart';
import 'package:access_maketicket/main/utils/AppWidget.dart';

import 'SDLeaderInfoScreen.dart';

List<SDLeaderBoardModel> students = [
  SDLeaderBoardModel(
    image: 'https://www.best4geeks.com/wp-content/uploads/2018/08/21-smart-lady-profile-pic-2.jpg',
    name: 'Karnia Oktavia',
    message: 'Excellent work',
    score: 100,
  ),
  SDLeaderBoardModel(
    image: 'https://i.insider.com/5de6dd81fd9db241b00c04d3?width=1100&format=jpeg&auto=webp',
    name: 'Kamaludin Abdul',
    message: 'Good work',
    score: 97,
  ),
  SDLeaderBoardModel(
    image: 'https://miro.medium.com/max/785/0*Ggt-XwliwAO6QURi.jpg',
    name: 'Mark Paul',
    message: 'Nice work',
    score: 96,
  ),
  SDLeaderBoardModel(
    image: 'https://www.best4geeks.com/wp-content/uploads/2018/08/21-smart-lady-profile-pic-2.jpg',
    name: 'Jeck',
    message: 'Nice work',
    score: 92,
  ),
  SDLeaderBoardModel(
    image: 'https://miro.medium.com/max/785/0*Ggt-XwliwAO6QURi.jpg',
    name: 'John Smith',
    message: 'Nice',
    score: 50,
  ),
  SDLeaderBoardModel(
    image: 'https://i.insider.com/5de6dd81fd9db241b00c04d3?width=1100&format=jpeg&auto=webp',
    name: 'Paul',
    message: 'Good',
    score: 97,
  ),
  SDLeaderBoardModel(
    image: 'https://miro.medium.com/max/785/0*Ggt-XwliwAO6QURi.jpg',
    name: 'Smith',
    message: 'Nice work',
    score: 96,
  ),
  SDLeaderBoardModel(
    image: 'https://www.best4geeks.com/wp-content/uploads/2018/08/21-smart-lady-profile-pic-2.jpg',
    name: 'Lee',
    message: 'Nice work',
    score: 92,
  ),
];

// ignore: non_constant_identifier_names
Widget SDLeaderboardScreen([BuildContext? context, Size? size]) {
  PurchaseOrder? purchaseOrder = null;
  PurchaseOrderService _purchaseOrderService = PurchaseOrderService();

  var searchId = TextEditingController();
  return Column(
    children: [
      Container(
        padding: EdgeInsets.only(top: 25, left: 16, bottom: 16),
        width: size!.width,
        color: sdPrimaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Detalle De Orden', style: boldTextStyle(size: 18, color: Colors.white, letterSpacing: 0.5)),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                'Por favor ingrese un ID de orden o escanee un acceso',
                style: secondaryTextStyle(
                  size: 12,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            )
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.only(top: 25, left: 16, bottom: 16, right: 16),
        width: size!.width,
        child: TextFormField(
          controller: searchId,
          style: primaryTextStyle(),
          decoration: InputDecoration(
            labelText: 'ID de orden',
            labelStyle: secondaryTextStyle(),
            contentPadding: EdgeInsets.all(16),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appColorPrimary)),
          ),
        )
      ),
      Container(
        alignment: Alignment.center,
        width: 150,
        margin: EdgeInsets.only(top: 25, left: 50, bottom: 16, right: 50),
        padding: EdgeInsets.only(top: 10, left: 16, bottom: 10, right: 16),
        decoration: BoxDecoration(color: appColorPrimary, borderRadius: BorderRadius.circular(8), boxShadow: defaultBoxShadow()),
        child: Text('Buscar', style: boldTextStyle(color: white, size: 18)),
      ).onTap(() {
        SDLeaderInfoScreen().launch(context!);
      }),
      Expanded(
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 16),
          scrollDirection: Axis.vertical,
          itemCount: students.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                SDLeaderInfoScreen().launch(context);
              },
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                padding: EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
                width: size.width,
                decoration: boxDecorations(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: (index + 1) == 1
                          ? Color(0xFFFFD700)
                          : (index + 1) == 2
                              ? Colors.grey.withOpacity(0.5)
                              : (index + 1) == 3
                                  ? Colors.red.withOpacity(0.5)
                                  : Colors.transparent,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: (index + 1) == 1
                            ? Color(0xFFD4AF37)
                            : (index + 1) == 2
                                ? Colors.grey.withOpacity(0.5)
                                : (index + 1) == 3
                                    ? Colors.red.withOpacity(0.5)
                                    : Colors.transparent,
                        child: Text(
                          (index + 1).toString(),
                          style: secondaryTextStyle(size: 14, color: (index + 1) == 1 || (index + 1) == 2 || (index + 1) == 3 ? Colors.white : Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      height: 45,
                      width: 45,
                      child: ClipRRect(borderRadius: BorderRadius.circular(40), child: commonCacheImageWidget(students[index].image!, 35, width: 10)),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(students[index].name!, style: boldTextStyle(size: 16)),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(students[index].message!, style: secondaryTextStyle(size: 12)),
                          ),
                        ],
                      ),
                    ),
                    Text(students[index].score.toString(), style: boldTextStyle())
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
