import 'package:access_maketicket/helper.dart';
import 'package:access_maketicket/src/Enums/PaymentMethodEnum.dart';
import 'package:access_maketicket/src/Enums/TypeArticleEnum.dart';
import 'package:access_maketicket/src/Model/PurchaseOrder.dart';
import 'package:access_maketicket/src/Model/PurchaseOrderAccess.dart';
import 'package:access_maketicket/src/Services/PurchaseOrderService.dart';
import 'package:flutter/material.dart';

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
  PurchaseOrder? purchaseOrder;
  var query = TextEditingController();
  PurchaseOrderService _purchaseOrderService = PurchaseOrderService();

  List<ScoreboardModel> mScoreList = [
    ScoreboardModel(
      title: 'Math Exam 2',
      subtitle: 'Passed',
      status: 70,
    ),
    ScoreboardModel(
      title: 'English-Week 2',
      subtitle: 'Passed',
      status: 80,
    ),
    ScoreboardModel(
      title: 'Physics Final Exam',
      subtitle: 'Passed',
      status: 30,
    ),
    ScoreboardModel(
      title: 'Math Exam 2',
      subtitle: 'Passed',
      status: 70,
    ),
    ScoreboardModel(
      title: 'English-Week 2',
      subtitle: 'Passed',
      status: 90,
    ),
    ScoreboardModel(
      title: 'Physics Final Exam',
      subtitle: 'Passed',
      status: 30,
    ),
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    if(helper.event == null) return;
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
      String getName = TypeArticleEnum.FREE.value == access.relationships?.chair?.relationships.article.attributes.type_articles_id
                    ? ''
                    : (access.relationships?.chair?.relationships.article.attributes.name ?? '');
      return Container(
        decoration: boxDecorationRoundedWithShadow(16, backgroundColor: context.cardColor),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(access.relationships?.chair?.attributes.full_zone ?? '', style: boldTextStyle(size: 16)),
                Text(getName, style: secondaryTextStyle(size: 10)),
              ],
            )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(access.relationships?.status?.attributes.name ?? '', style: boldTextStyle(color: Colors.black, size: 16)),
              ],
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(height: width * 0.5, color: sdPrimaryColor),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom:16),
                      decoration: boxDecorations(radius: 6, bgColor: sdViewColor.withOpacity(0.8)),
                      child: TextField(
                        controller: query,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Buscar',
                          prefixIcon: Icon(Icons.search, color: Colors.black),

                        ),
                        onTapOutside: (pointer)async {
                          int queryParse = int.parse(query.text);
                            var res = await _purchaseOrderService.getPurchaseOrderByIdOrUuid(queryParse,null);
                            if(res == null) return;
                            setState(() {
                              purchaseOrder = res;
                            });


                        },
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: boxDecorations(bgColor: Colors.deepOrangeAccent.withOpacity(0.8)),
                          padding: EdgeInsets.all(16),
                          child: Text("71", style: primaryTextStyle(size: 18, color: Colors.white)),
                        ),
                        SizedBox(width: 16),
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${purchaseOrder?.relationships?.event.attributes.name ?? 'Busque una orden'}", style: primaryTextStyle(size: 16, color: Colors.white)),
                            Text("${purchaseOrder?.id ?? ''}", style: primaryTextStyle(size: 16, color: Colors.white)),
                          ],
                        ))

                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      decoration: boxDecoration(radius: 8, backGroundColor: context.cardColor, spreadRadius: 2, blurRadius: 10),
                      padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          mOption("Cedula", purchaseOrder?.relationships?.user.relationships.profile?.attributes.dni ?? ''),
                          Container(height: 22, color: sdViewColor, width: 1),
                          mOption("Nombre", purchaseOrder?.relationships?.user.attributes.name),
                          Container(height: 22, color: sdViewColor, width: 1),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Text("Lista de Accesos", style: secondaryTextStyle(size: 14, color: sdTextSecondaryColor)),
                    ListView.builder(
                      itemCount: purchaseOrder?.relationships?.accesses.length ?? 0,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(bottom: 16),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        if(purchaseOrder?.relationships?.accesses == null){
                          return null;
                        }
                        return mLeaderList(purchaseOrder!.relationships!.accesses[index]);
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
