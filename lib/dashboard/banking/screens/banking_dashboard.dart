import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/dashboard/banking/fragments/cards_banking_fragment.dart';
import 'package:access_maketicket/dashboard/banking/fragments/home_banking_fragment.dart';
import 'package:access_maketicket/dashboard/banking/fragments/repots_banking_fragment.dart';
import 'package:access_maketicket/dashboard/banking/fragments/settings_banking_fragment.dart';
import 'package:access_maketicket/dashboard/banking/utils/colors.dart';
import 'package:access_maketicket/dashboard/banking/utils/images.dart';
import 'package:access_maketicket/main.dart';

class BankingDashboard extends StatefulWidget {
  static String tag = '/banking_dashboard';

  final bool isDirect;

  BankingDashboard({this.isDirect = false});

  @override
  _BankingDashboardState createState() => _BankingDashboardState();
}

class _BankingDashboardState extends State<BankingDashboard> {
  int _selectedItemIndex = 0;

  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    _pages = [
      HomeBankingFragment(isDirect: widget.isDirect),
      CardsBankingFragment(),
      ReportsBankingFragment(),
      SettingsBankingFragment(),
    ];

    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Widget _bottomTab() {
    return BottomNavigationBar(
      currentIndex: _selectedItemIndex,
      onTap: _onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: appStore.isDarkModeOn ? Colors.black : Colors.white,
      selectedItemColor: primaryBankingColor2,
      unselectedItemColor: appStore.isDarkModeOn ? Colors.white : Colors.black,
      elevation: 20,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      selectedFontSize: 14,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: customBottomNav(context, false, 'Home', ic_home),
          activeIcon: customBottomNav(context, true, 'Home', ic_home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: customBottomNav(context, false, 'Cards', ic_credit_card),
          activeIcon: customBottomNav(context, true, 'Cards', ic_credit_card),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: customBottomNav(context, false, 'Reports', ic_reports),
          activeIcon: customBottomNav(context, true, 'Reports', ic_reports),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: customBottomNav(context, false, 'Settings', ic_settings),
          activeIcon: customBottomNav(context, true, 'Settings', ic_settings),
          label: '',
        ),
      ],
    );
  }

  void _onTap(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

  Widget customBottomNav(BuildContext context, bool isActiveIcon, String text, String icon) {
    if (isActiveIcon) {
      return Column(
        children: [
          Image.asset(icon, height: 16, width: 16, color: primaryBankingColor1),
          8.height,
          Text('$text', style: boldTextStyle(size: 14, color: primaryBankingColor1)),
        ],
      );
    } else {
      return Column(
        children: [
          Image.asset(icon, height: 20, width: 20, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
          Text('$text', style: primaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black)),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomTab(),
      body: _pages[_selectedItemIndex],
    );
  }
}
