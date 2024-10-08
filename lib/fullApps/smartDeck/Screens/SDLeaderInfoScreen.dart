import 'package:access_maketicket/helper.dart';
import 'package:access_maketicket/src/Enums/PaymentMethodEnum.dart';
import 'package:access_maketicket/src/Enums/TypeArticleEnum.dart';
import 'package:access_maketicket/src/Model/PurchaseOrder.dart';
import 'package:access_maketicket/src/Model/PurchaseOrderAccess.dart';
import 'package:access_maketicket/src/Services/BaseService.dart';
import 'package:access_maketicket/src/Services/MaketicketService.dart';
import 'package:access_maketicket/src/Services/PurchaseOrderService.dart';
import 'package:access_maketicket/src/Views/ScannerQRScreen.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:access_maketicket/fullApps/smartDeck/ModelClass/ScoreboardAvailableModel.dart';
import 'package:access_maketicket/fullApps/smartDeck/SDUtils/SDColors.dart';
import 'package:access_maketicket/fullApps/smartDeck/SDUtils/SDStyle.dart';

class SDLeaderInfoScreen extends StatefulWidget {
  @override
  _SDLeaderInfoScreenState createState() => _SDLeaderInfoScreenState();
}

class _SDLeaderInfoScreenState extends State<SDLeaderInfoScreen> {
  Helper helper = Helper();
  bool isLoading = false;
  PurchaseOrder? purchaseOrder;
  String? message = 'Busque una orden';
  MacketicketService _maketicketService = MacketicketService();
  var query = TextEditingController();
  PurchaseOrderService _purchaseOrderService = PurchaseOrderService();
  String? uuid;
  List<int> seatsSelected = [];

  Future<void> setUuid(String value) async {
    setState(() => uuid = value);
    var res =
        await _purchaseOrderService.getPurchaseOrderByIdOrUuid(null, value);
    if (res == null) return;
    setState(() {
      purchaseOrder = res.purchaseOrder;
    });
  }

  void updateOrder(String? message, {PurchaseOrder? po = null})
  {
    setState(() {
      this.message = message;
      this.purchaseOrder = po;
    });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    if (helper.event == null) return;
  }

  @override
  Widget build(BuildContext context) {
    helper.context = context;
    var width = MediaQuery.of(context).size.width;
    Widget mOption(var mHeading, var mSubHeading) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('${mHeading ?? ''}', style: primaryTextStyle()),
          SizedBox(height: 4),
          Text('${mSubHeading ?? ''}', style: secondaryTextStyle()),
        ],
      );
    }

    Widget mLeaderList(PurchaseOrderAccess access) {
      String getName = TypeArticleEnum.FREE.value ==
              access.relationships?.chair?.relationships.article.attributes
                  .type_articles_id
          ? ''
          : (access.relationships?.chair?.relationships.article.attributes
                  .name ??
              '');
      return Container(
        decoration: boxDecorationRoundedWithShadow(16,
            backgroundColor: context.cardColor),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (seatsSelected.contains(access.id))
                  Icon(Icons.check_box, color: Colors.green),
                if (!seatsSelected.contains(access.id))
                  Icon(Icons.check_box_outline_blank, color: Colors.black),

              ],
            ).onTap(() async {
              if (!seatsSelected.contains(access.id)) {
                setState(() {
                  seatsSelected.add(access.id);
                });
              } else {
                setState(() {
                  seatsSelected.remove(access.id);
                });
              }
            }),

            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(access.relationships?.chair?.attributes.full_zone ?? '',
                    style: boldTextStyle(size: 16)),
                Text(getName, style: secondaryTextStyle(size: 10)),
                Text('Canjes Disponibles: ${access.attributes.available ?? 0}',
                    style: secondaryTextStyle(size: 10)),
              ],
            )),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(access.relationships?.status?.attributes.name ?? '',
                    style: boldTextStyle(color: Colors.black, size: 16)),
              ],
            ),
            SizedBox(
              width: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.check, color: Colors.green),
                Text('Permitir',
                    style: boldTextStyle(color: textSecondaryColor, size: 12)),
              ],
            ).onTap(() async {
              int purchaseOrderId = purchaseOrder!.id;
              int event_id = purchaseOrder!.attributes.event_id;
              this.updateOrder('Actualizando');
              await _maketicketService.scanUuid(access.attributes.uuid,
                  event_id: event_id);
              var res = await _purchaseOrderService.getPurchaseOrderByIdOrUuid(
                  purchaseOrderId, null);
              if (res == null) return;
              this.updateOrder(null, po: res.purchaseOrder);
            }),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(height: width * 0.8, color: sdPrimaryColor),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: 16, right: 16, top: 16, bottom: 16),
                          decoration: boxDecorations(
                              radius: 6, bgColor: sdViewColor.withOpacity(0.8)),
                          child: TextField(
                            controller: query,
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Buscar',
                              prefixIcon:
                                  Icon(Icons.search, color: Colors.black)
                                      .onTap(() async {
                                setState(() {
                                  message = 'Buscando...';
                                });
                                int queryParse = int.parse(query.text);
                                var res = await _purchaseOrderService
                                    .getPurchaseOrderByIdOrUuid(
                                        queryParse, null);
                                if (res == null) return;
                                setState(() {
                                  message = res.error;
                                  purchaseOrder = res.purchaseOrder;
                                });
                              }),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 16),
                          child: Icon(Icons.qr_code, color: Colors.white)
                              .onTap(() {
                            ScannerQRScreen(
                              setUuid: this.setUuid,
                            ).launch(context);
                          }),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: boxDecorations(
                              bgColor:
                                  Colors.deepOrangeAccent.withOpacity(0.8)),
                          padding: EdgeInsets.all(16),
                          child: Text("71",
                              style: primaryTextStyle(
                                  size: 18, color: Colors.white)),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "${purchaseOrder?.relationships?.event.attributes.name ?? message}",
                                style: primaryTextStyle(
                                    size: 16, color: Colors.white)),
                            Text("${purchaseOrder?.id ?? ''}",
                                style: primaryTextStyle(
                                    size: 16, color: Colors.white)),
                          ],
                        ))
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      decoration: boxDecoration(
                          radius: 8,
                          backGroundColor: context.cardColor,
                          spreadRadius: 2,
                          blurRadius: 10),
                      padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          mOption(
                              "Cedula",
                              purchaseOrder?.relationships?.user.relationships
                                      .profile?.attributes.dni ??
                                  ''),
                          Container(height: 22, color: sdViewColor, width: 1),
                          mOption(
                              "Nombre",
                              purchaseOrder
                                  ?.relationships?.user.attributes.name),
                          Container(height: 22, color: sdViewColor, width: 1),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Text("Lista de Accesos",
                        style: secondaryTextStyle(
                            size: 14, color: sdTextSecondaryColor)),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        if (seatsSelected.length ==
                            purchaseOrder?.relationships?.accesses.length)
                          Container(
                            margin: EdgeInsets.only(right: 16),
                            child: Icon(Icons.check_box, color: Colors.green)
                                .onTap(() {
                              purchaseOrder?.relationships?.accesses
                                  .forEach((PurchaseOrderAccess access) {
                                if (seatsSelected.contains(access.id)) {
                                  setState(() {
                                    seatsSelected.remove(access.id);
                                  });
                                }
                              });
                            }),
                          ),
                        if (seatsSelected.length !=
                            purchaseOrder?.relationships?.accesses.length)
                          Container(
                            margin: EdgeInsets.only(right: 16),
                            child: Icon(Icons.check_box_outline_blank_outlined,
                                    color: Colors.red)
                                .onTap(() {
                              purchaseOrder?.relationships?.accesses
                                  .forEach((PurchaseOrderAccess access) {
                                if (!seatsSelected.contains(access.id)) {
                                  setState(() {
                                    seatsSelected.add(access.id);
                                  });
                                }
                              });
                            }),
                          ),
                        if (seatsSelected.length > 0)
                          Column(
                            children: [
                              Icon(Icons.check, color: Colors.black),
                            ],
                          ).onTap(()async{
                            int purchase_order_id = purchaseOrder!.id;
                            List<String> uuids = purchaseOrder!.relationships!.accesses.where((a) => seatsSelected.contains(a.id))
                                .map((a) => a.attributes.uuid).toList();
                            this.updateOrder('Actualizando');
                            setState(() {
                              seatsSelected = [];
                            });
                            BaseResponse<PurchaseOrder>? response = await _purchaseOrderService.acceptTicketBatch(purchase_order_id,uuids);
                            if(response == null) return;
                            this.updateOrder('Actualizando', po: response.data);
                          }),
                      ],
                    ),
                    ListView.builder(
                      itemCount:
                          purchaseOrder?.relationships?.accesses.length ?? 0,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(bottom: 16),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        if (purchaseOrder?.relationships?.accesses == null) {
                          return null;
                        }
                        return mLeaderList(
                            purchaseOrder!.relationships!.accesses[index]);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
