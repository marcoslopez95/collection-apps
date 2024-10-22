import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/smartDeck/ModelClass/SDSearchModel.dart';
import 'package:access_maketicket/fullApps/smartDeck/SDUtils/SDColors.dart';
import 'package:access_maketicket/fullApps/smartDeck/SDUtils/SDStyle.dart';
import 'package:access_maketicket/fullApps/smartDeck/Screens/SDDashboardScreen.dart';
import 'package:access_maketicket/helper.dart';
import 'package:access_maketicket/main.dart';
import 'package:access_maketicket/main/utils/AppWidget.dart';
import 'package:access_maketicket/src/Model/Event.dart';
import 'package:access_maketicket/src/Services/MaketicketService.dart';
import 'package:access_maketicket/fullApps/smartDeck/Screens/SDHomePageScreen.dart';

class SDSearchScreen extends StatefulWidget {
  Future<void> Function(List<int>) onSearch;

  SDSearchScreen({
    required this.onSearch
  });

  @override
  _SDSearchScreenState createState() => _SDSearchScreenState(onSearch: onSearch);
}

class _SDSearchScreenState extends State<SDSearchScreen> {
  Future<void> Function(List<int>) onSearch;
  _SDSearchScreenState({
    required this.onSearch
  });
  List<Event> events = [];
  List<int> event_ids = [];
  Helper helper = Helper();

  final MacketicketService macketicketService = MacketicketService();
  var query = TextEditingController();

  Future<void> fetchSearchResults(String query) async {
    var results = await macketicketService.getEventsSearch(query: query);
    setState(() {
      events = results;
    });
  }

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
                        decoration: boxDecorations(
                            radius: 6, bgColor: sdViewColor.withOpacity(0.8)),
                        child: TextField(
                          controller: query,
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
                        fetchSearchResults(query.text);
                        //finish(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text("Buscar", style: primaryTextStyle(
                            color: sdPrimaryColor)),
                      ),
                    )
                  ],
                ),
              ),

              if(events.length > 0)
                ListView.builder(
                  itemCount: events.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 16),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        helper.event = events[index];

                        if(event_ids.contains(events[index].id)){
                          helper.events.remove(events[index]);
                          event_ids.remove(events[index].id);
                          setState(() {
                            event_ids.remove(events[index].id);
                          });
                        }else{
                          helper.events.add(events[index]);
                          setState(() {
                            event_ids.add(events[index].id);
                          });
                        }
                        /*Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              SDHomePageScreen(event: events[index])),
                        );*/

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
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: event_ids.contains(events[index].id) ? sdSecondaryColorGreen : sdSecondaryColorRed
                                      ),
                                      padding: EdgeInsets.all(4),
                                      child: Icon(
                                          Icons.star,
                                          color: Colors.white,
                                          size: 12),
                                    ),
                                    16.width,
                                    SizedBox(
                                      width: 200.0,
                                      child: Text(
                                        events[index].attributes.name!,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                        style: TextStyle(color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0),
                                      ),
                                    ),
                                    //Text(events[index].attributes.name!, style: primaryTextStyle(),overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                                Icon(Icons.keyboard_arrow_right,
                                    color: sdIconColor)
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
              if(event_ids.length > 0)
               Container(
                margin: EdgeInsets.only(left: 16),
                child: Text(
                    "ACCEDER AL EVENTO (${event_ids.length})",
                    style: primaryTextStyle( color: Colors.red, decoration: TextDecoration.underline)
                ).onTap(()async {
                  await this.onSearch(event_ids);
                  finish(context);
                }),
              ),
              if(events.length == 0)
                Container(
                  child: Text(
                    'Evento no encontrado',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  )
                )

            ],
          ),
        ),
      ),
    );
  }
}
