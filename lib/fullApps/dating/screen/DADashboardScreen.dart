import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/dating/fragment/DAHomeFragment.dart';
import 'package:access_maketicket/fullApps/dating/fragment/DAInboxFragment.dart';
import 'package:access_maketicket/fullApps/dating/fragment/DAMatchesFragment.dart';
import 'package:access_maketicket/fullApps/dating/fragment/DAProfileFragment.dart';
import 'package:access_maketicket/fullApps/dating/utils/DAColors.dart';
import 'package:access_maketicket/main.dart';

class DADashboardScreen extends StatefulWidget {
  @override
  DADashboardScreenState createState() => DADashboardScreenState();
}

class DADashboardScreenState extends State<DADashboardScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    DAHomeFragment(),
    DAInboxFragment(),
    DAMatchesFragment(),
    DAProfileFragment(),
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: context.cardColor,
        selectedItemColor: primaryColor,
        unselectedItemColor: appStore.isDarkModeOn ? white : black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.inbox), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}
