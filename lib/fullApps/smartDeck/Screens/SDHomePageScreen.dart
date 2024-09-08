import 'package:access_maketicket/fullApps/musicPodcast/component/MPDrawerScreen.dart';
import 'package:access_maketicket/fullApps/smartDeck/Screens/SDLeaderInfoScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:access_maketicket/helper.dart';
import 'package:access_maketicket/main/utils/AppWidget.dart';
import 'package:access_maketicket/fullApps/smartDeck/SDUtils/SDColors.dart';
import 'package:access_maketicket/fullApps/smartDeck/Screens/SDChatScreen.dart';
import 'package:access_maketicket/fullApps/smartDeck/Screens/SDDashboardScreen.dart';
import 'package:access_maketicket/fullApps/smartDeck/Screens/SDLeaderBoardScreen.dart';
import 'package:access_maketicket/fullApps/smartDeck/Screens/SDProfileScreen.dart';
import 'package:access_maketicket/fullApps/smartDeck/Screens/SDScoreBoardScreen.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/src/Model/Event.dart';
import 'package:access_maketicket/src/Views/ScannerQR.dart';

class SDHomePageScreen extends StatefulWidget {
  Event? event;

  SDHomePageScreen({this.event = null});

  @override
  _SDHomePageScreenState createState() => _SDHomePageScreenState();
}

class _SDHomePageScreenState extends State<SDHomePageScreen> {
  int currentIndex = 1;
  Helper helper = Helper();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final tab = [
      DrawerScreen(),
      SDDashboard(widget.event),
      QRViewExample(event: (widget.event ?? null)),
      SDLeaderInfoScreen(),
      //SDChatScreen(),
      sdPRofileScreen(),
    ];

    return SafeArea(
      child: Scaffold(
        body: tab[currentIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(color: sdShadowColor, spreadRadius: 0, blurRadius: 2),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: BottomNavigationBar(
              backgroundColor: context.cardColor,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              currentIndex: currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(IconData(0xe3dc, fontFamily: 'MaterialIcons'), size: 28, color: sdIconColor),
                  activeIcon: Icon(IconData(0xe3dc, fontFamily: 'MaterialIcons'), size: 28, color: sdPrimaryColor),
                  label: 'a',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('images/smartDeck/images/sdhome.png', height: 28, width: 28, color: sdIconColor),
                  activeIcon: Image.asset('images/smartDeck/images/sdhome.png', height: 28, width: 28, color: sdPrimaryColor),
                  label: 'a',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('images/smartDeck/images/sdexamcard.png', height: 28, width: 28, color: sdIconColor),
                  activeIcon: Image.asset('images/smartDeck/images/sdexamcard.png', height: 28, width: 28, color: sdPrimaryColor),
                  label: 'a',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('images/smartDeck/images/sdleaderboard.png', height: 28, width: 28, color: sdIconColor),
                  activeIcon: Image.asset('images/smartDeck/images/sdleaderboard.png', height: 28, width: 28, color: sdPrimaryColor),
                  label: 'a',
                ),
                /*BottomNavigationBarItem(
                  icon: Stack(
                    children: <Widget>[
                      Image.asset('images/smartDeck/images/sdchats.png', height: 28, width: 28, color: sdIconColor),
                      Positioned(
                        top: -2,
                        right: -6,
                        child: CircleAvatar(radius: 3, backgroundColor: sdSecondaryColorRed),
                      )
                    ],
                  ),
                  activeIcon: Stack(
                    children: <Widget>[
                      Image.asset('images/smartDeck/images/sdchats.png', height: 28, width: 28, color: sdPrimaryColor),
                      Positioned(
                        top: -2,
                        right: -6,
                        child: CircleAvatar(radius: 3, backgroundColor: sdSecondaryColorRed),
                      )
                    ],
                  ),
                  label: 'a',
                ),*/
                BottomNavigationBarItem(
                  icon: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    height: 30,
                    width: 30,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: CachedNetworkImage(
                        placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                        imageUrl: 'https://i.insider.com/5de6dd81fd9db241b00c04d3?width=1100&format=jpeg&auto=webp',
                        fit: BoxFit.cover,
                        height: 35,
                        width: 10,
                      ),
                    ),
                  ),
                  activeIcon: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: sdPrimaryColor, width: 2)),
                    height: 30,
                    width: 30,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: 'https://i.insider.com/5de6dd81fd9db241b00c04d3?width=1100&format=jpeg&auto=webp',
                        height: 35,
                        width: 10,
                      ),
                    ),
                  ),
                  label: 'a',
                ),
              ],
              onTap: (index) {
                setState(
                  () {
                    currentIndex = index;
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
