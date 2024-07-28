import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../../main.dart';

class OnlinePdfViewerScreen extends StatefulWidget {
  @override
  OnlinePdfViewerScreenState createState() => OnlinePdfViewerScreenState();
}

class OnlinePdfViewerScreenState extends State<OnlinePdfViewerScreen> {
  String pdfURL = 'https://css4.pub/2015/icelandic/dictionary.pdf';
  late PDFDocument document;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    init();
    loadDocument();
  }

  Future<void> init() async {
    changeStatusColor(appStore.scaffoldBackground!);
  }

  loadDocument() async {
    document = await PDFDocument.fromURL("https://css4.pub/2015/icelandic/dictionary.pdf");
    setState(() {
      isLoading = false;
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Online PDF Viewer', style: boldTextStyle(size: 22)),
          backgroundColor: appStore.appBarColor,
          leading: BackButton(
            color: appStore.textPrimaryColor,
            onPressed: () {
              finish(context);
            },
          ),
        ),
        body: Center(
            child: isLoading
                ? CircularProgressIndicator()
                : PDFViewer(
                    document: document,
                    scrollDirection: Axis.vertical,
                    zoomSteps: 1,
                  )),
      ),
    );
  }
}
