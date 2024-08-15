import 'package:flutter/material.dart';
import 'package:access_maketicket/defaultTheme/utils/DTWidgets.dart';
import 'package:access_maketicket/main/utils/AppConstant.dart';
import 'package:access_maketicket/main/utils/AppWidget.dart';

import 'DTDrawerWidget.dart';

class DTNoResultScreen extends StatefulWidget {
  @override
  _DTNoResultScreenState createState() => _DTNoResultScreenState();
}

class _DTNoResultScreenState extends State<DTNoResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'No Result'),
      drawer: DTDrawerWidget(),
      body: errorWidget(
        context,
        'images/defaultTheme/no_result.png',
        'No Result',
        ProKitShortText,
      ),
    );
  }
}
