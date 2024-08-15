import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/potea/components/app_scaffold.dart';

import '../../../../../main.dart';
import '../../../components/contact_widget.dart';
import '../../../utils/colors.dart';
import '../../../utils/image.dart';
import 'customer_service/customer_service_screen.dart';
import 'faq_selected.dart';

class HelpBar extends StatelessWidget {
  HelpBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: AppScaffold(
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.network(
              icMore,
              color: appStore.isDarkModeOn ? white : black,
              width: 23,
            ),
          ),
          8.width,
        ],
        appBarTitle: Text('Help Center', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        body: Column(
          children: <Widget>[
            TabBar(
              tabs: const <Widget>[
                Tab(text: 'FAQ'),
                Tab(text: 'Contact Us'),
              ],
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 4.0, color: poteaPrimaryColor),
                insets: EdgeInsets.symmetric(horizontal: Get.height * 0.15),
              ),
              labelColor: poteaPrimaryColor,
              unselectedLabelColor: lightGrey,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  FAQ(),
                  ContactUs(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        16.height,
        FAQSelected(),
      ],
    );
  }
}

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          16.height,
          ContactUsWidget(
            iconPath: icSupport,
            name: 'Customer Service',
            onTap: () {
              Get.to(() => CustomerService());
            },
          ),
          ContactUsWidget(
            iconPath: icWhatsapp,
            name: 'Whatsapp',
          ),
          ContactUsWidget(
            iconPath: icGlobe,
            name: 'Website',
          ),
          ContactUsWidget(
            iconPath: icFb,
            name: 'Facebook',
          ),
          ContactUsWidget(
            iconPath: icTwitter,
            name: 'Twitter',
          ),
          ContactUsWidget(
            iconPath: icInstagram,
            name: 'Instagram',
          ),
        ],
      ),
    );
  }
}
