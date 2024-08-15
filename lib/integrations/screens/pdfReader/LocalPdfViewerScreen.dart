import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:access_maketicket/main.dart';
import 'package:access_maketicket/main/utils/AppWidget.dart';

class LocalPdfViewerScreen extends StatefulWidget {
  static String tag = '/local_pdf_viewer';

  final bool isDirect;

  LocalPdfViewerScreen({this.isDirect = false});

  @override
  _LocalPdfViewerScreenState createState() => _LocalPdfViewerScreenState();
}

class _LocalPdfViewerScreenState extends State<LocalPdfViewerScreen> {
  late PDFDocument document;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    init();
    loadDocument();
  }

  void init() async {
    changeStatusColor(appStore.scaffoldBackground!);
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset('assets/pdf/Romeo_and_Juliet.pdf');
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
    return Scaffold(
      appBar: appBar(context, 'Local PDF Viewer', isDashboard: widget.isDirect),
      body: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : PDFViewer(
                  document: document,
                  scrollDirection: Axis.vertical,
                  zoomSteps: 1,
                )),
    );
  }
}
