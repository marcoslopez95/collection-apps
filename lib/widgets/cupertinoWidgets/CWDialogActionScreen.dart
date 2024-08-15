import 'package:flutter/material.dart';
import 'package:access_maketicket/main/model/ListModels.dart';
import 'package:access_maketicket/main/utils/AppWidget.dart';

class CWDialogActionScreen extends StatefulWidget {
  static String tag = '/CWDialogActionScreen';

  @override
  CWDialogActionScreenState createState() => CWDialogActionScreenState();
}

class CWDialogActionScreenState extends State<CWDialogActionScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  List<ListModel> example = [
    ListModel(name: 'Simple Dialog'),
    ListModel(name: 'Camera Gallery Permission Dialog'),
    ListModel(name: 'Review Dialog'),
    ListModel(name: 'Map Permission Dialog'),
  ];

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, 'Cupertino Dialog Action'),
      ),
    );
  }
}
