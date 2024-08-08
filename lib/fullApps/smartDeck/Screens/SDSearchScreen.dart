import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartDeck/ModelClass/SDSearchModel.dart';
import 'package:prokit_flutter/fullApps/smartDeck/SDUtils/SDColors.dart';
import 'package:prokit_flutter/fullApps/smartDeck/SDUtils/SDStyle.dart';
import 'package:prokit_flutter/fullApps/smartDeck/Screens/SDDashboardScreen.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/src/Model/Event.dart';
import 'package:prokit_flutter/src/Services/MaketicketService.dart';
import 'package:prokit_flutter/fullApps/smartDeck/Screens/SDHomePageScreen.dart';

class SDSearchScreen extends StatefulWidget {
  @override
  _SDSearchScreenState createState() => _SDSearchScreenState();
}

class _SDSearchScreenState extends State<SDSearchScreen> {
  List<Event> events = [];
  final MacketicketService macketicketService = MacketicketService();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    var ev = await macketicketService.getEvents();
    setState(() {
      events = ev;
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.isDarkModeOn ? scaffoldDarkColor : white);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: boxDecorations(radius: 6, bgColor: sdViewColor.withOpacity(0.8)),
                        child: TextField(
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Buscar',
                            prefixIcon: Icon(Icons.search, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        finish(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text("Buscar", style: primaryTextStyle(color: sdPrimaryColor)),
                      ),
                    )
                  ],
                ),
              ),
             /* Container(
                margin: EdgeInsets.only(left: 16),
                child: Text("Search history", style: secondaryTextStyle()),
              ),*/
              ListView.builder(
                itemCount: events.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 16),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      print('estoy dando tap');
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SDHomePageScreen(event_id: events[index].id)),
                      );

                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(shape: BoxShape.circle, color: sdSecondaryColorRed),
                                    padding: EdgeInsets.all(4),
                                    child: Icon(Icons.star, color: Colors.white, size: 12),
                                  ),
                                  16.width,
                                  SizedBox(
                                    width: 200.0,
                                    child: Text(
                                      events[index].attributes.name!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
                                    ),
                                  ),
                                  //Text(events[index].attributes.name!, style: primaryTextStyle(),overflow: TextOverflow.ellipsis),
                                ],
                              ),
                              Icon(Icons.keyboard_arrow_right, color: sdIconColor)
                            ],

                          ),
                        ),
                        Container(
                          color: sdViewColor,
                          height: 1,
                          margin: EdgeInsets.only(top: 16, bottom: 16),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
