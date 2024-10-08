import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/eventApp/screens/EAHomeScreen.dart';
import 'package:access_maketicket/fullApps/eventApp/screens/EANewsList.dart';
import 'package:access_maketicket/fullApps/eventApp/screens/EAPeopleScreen.dart';
import 'package:access_maketicket/fullApps/eventApp/screens/EAProfileScreen.dart';
import 'package:access_maketicket/fullApps/eventApp/utils/EAColors.dart';
import 'package:access_maketicket/main.dart';

import 'EASearchScreen.dart';

class EADashedBoardScreen extends StatefulWidget {
  final String? name;

  EADashedBoardScreen({this.name});

  @override
  EADashedBoardScreenState createState() => EADashedBoardScreenState();
}

class EADashedBoardScreenState extends State<EADashedBoardScreen> {
  int _selectedIndex = 0;
  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    init();

    _pages.add(EAHomeScreen(name: widget.name));
    _pages.add(EASearchScreen());
    _pages.add(EANewsList());
    _pages.add(EAPeopleScreen());
    _pages.add(EAProfileScreen());
  }

  Widget _bottomTab() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedFontSize: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryColor1,
      unselectedItemColor: appStore.isDarkModeOn ? white : black,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(LineIcons.copy, size: 28), label: ''),
        BottomNavigationBarItem(icon: Icon(LineIcons.search, size: 28), label: ''),
        BottomNavigationBarItem(icon: Icon(LineIcons.newspaper, size: 28), label: ''),
        BottomNavigationBarItem(icon: Icon(LineIcons.user_friends, size: 28), label: ''),
        BottomNavigationBarItem(icon: Icon(LineIcons.user, size: 28), label: ''),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
      bottomNavigationBar: _bottomTab(),
      body: Center(child: _pages.elementAt(_selectedIndex)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
