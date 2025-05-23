import 'dart:developer';
import 'dart:io';

import 'package:access_maketicket/fullApps/smartDeck/SDUtils/SDColors.dart';
import 'package:access_maketicket/src/Model/PurchaseOrder.dart';
import 'package:access_maketicket/src/Model/PurchaseOrderAccess.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:access_maketicket/fullApps/smartDeck/Screens/SDHomePageScreen.dart';
import 'package:access_maketicket/fullApps/stockMarket/utils/images.dart';
import 'package:access_maketicket/src/Services/MaketicketService.dart';
import 'package:just_audio/just_audio.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:access_maketicket/src/Model/Event.dart';

class QRViewExample extends StatefulWidget {
  final Event? event;

  const QRViewExample({Key? key, this.event = null}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState(event: event);
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  var response;
  final Event? event;
  String? message;
  int? color;
  int? icon;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final player = AudioPlayer();

  _QRViewExampleState({this.event});

  Future<void> playSound() async {
    print('''
        ****************************************
        Comenzando reproduccion
        ****************************************
        ''');
    await player.setUrl('asset:///assets/media/camera-250776.mp3');
    await player.play();
    print('''
        ****************************************
        termino reproduccion
        ****************************************
        ''');
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void initState() {
    super.initState();
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null)
                    Icon(IconData(icon!, fontFamily: 'MaterialIcons'),
                        size: 42, color: Color(color!)),
                  if (result != null)
                    Text(
                      '${response['message']} \n ${message}',
                      style: TextStyle(
                          color: response['success'] == true
                              ? Color(color!)
                              : Colors.red,
                          fontWeight: FontWeight.bold),
                    )
                  else
                    Text(
                        '${event != null ? event?.attributes.name : 'Escanea un código'}'),
                  if (controller != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(8),
                          child: ElevatedButton(
                              onPressed: () async {
                                await controller!.toggleFlash();
                                setState(() {});
                              },
                              child: FutureBuilder(
                                future: controller!.getFlashStatus(),
                                builder: (context, snapshot) {
                                  return Text(
                                      '${snapshot.data! ? 'Desactivar' : 'Activar'} Flash ');
                                },
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8),
                          child: ElevatedButton(
                              onPressed: () async {
                                await controller?.flipCamera();
                                setState(() {});
                              },
                              child: FutureBuilder(
                                future: controller?.getCameraInfo(),
                                builder: (context, snapshot) {
                                  if (snapshot.data != null) {
                                    return Text(
                                        'Camara ${describeEnum(snapshot.data!) == 'front' ? 'Trasera' : 'Frontal'}');
                                  } else {
                                    return const Text('loading');
                                  }
                                },
                              )),
                        )
                      ],
                    ),
                  /*Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      */ /*Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.pauseCamera();
                          },
                          child: const Text('pause',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),*/ /*
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.resumeCamera();
                          },
                          child: const Text('resume',
                              style: TextStyle(fontSize: 20)),
                        ),
                      )
                    ],
                  ),*/
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  MacketicketService _maketicketServive = MacketicketService();

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      await playSound();
      var res;
      var msg;
      if (scanData.code != '') {
        print('''
        --------- uuid --------
        ${scanData.code}
        ------- end uuid --------
        ''');
        await controller.pauseCamera();
        res = await _maketicketServive.scanUuid(scanData.code!);
        PurchaseOrderAccess access = PurchaseOrderAccess.fromJson(res['data']);
        await controller.resumeCamera();
        if (res['success'] == true) {
          msg = '${access.relationships?.chair?.attributes.full_zone}';
        }
        print('''
        --------- res --------
        icon: ${res['icon']}
        color: ${res['color']}
        ------- end res --------
        ''');
      }
      setState(() {
        result = scanData;
        response = res;
        icon = int.parse(res['icon']);
        color = int.parse(res['color']);
        message = msg ?? '';
      });
      Future.delayed(Duration(seconds: 5), () {
        setState(() {
          result = null;
        });
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
